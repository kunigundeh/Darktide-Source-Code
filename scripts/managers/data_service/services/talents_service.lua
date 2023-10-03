local PlayerManager = require("scripts/foundation/managers/player/player_manager")
local PlayerSpecializationUtil = require("scripts/utilities/player_specialization/player_specialization")
local TalentLayoutParser = require("scripts/ui/views/talent_builder_view/utilities/talent_layout_parser")
local TalentsService = class("TalentsService")

TalentsService.init = function (self, backend_interface)
	self._backend_interface = backend_interface
end

local function _set_backend_response_success(player, extra_data)
	local peer_id = player:peer_id()
	local local_player_id = player:local_player_id()
	local connection_manager = Managers.connection

	if connection_manager:is_host() then
		local profile_synchronizer_host = Managers.profile_synchronization:synchronizer_host()

		profile_synchronizer_host:profile_changed(peer_id, local_player_id)
	elseif connection_manager:is_client() then
		connection_manager:send_rpc_server("rpc_notify_profile_changed", peer_id, local_player_id)
	end

	return extra_data
end

local function _set_talents_backend_response_fail(result)
	local errors = result and result.body and result.body.errors

	Log.error("Talents", "couldn't set selected talents in backend")

	if errors then
		Log.error("Talents", "Message: %s", table.tostring(errors, 5))
	end
end

TalentsService.set_talents = function (self, player, talent_names)
	local character_id = player:character_id()
	local profile = player:profile()

	PlayerSpecializationUtil.filter_nonselectable_talents(profile.archetype, profile.specialization, profile.current_level, talent_names)

	local backend = self._backend_interface.characters
	local talent_array = PlayerSpecializationUtil.talents_with_tiers_set_to_array(talent_names, {})

	promise:next(callback(_set_backend_response_success, player, talent_names), _set_talents_backend_response_fail):catch(function (err)
		_set_talents_backend_response_fail(err)
	end)

	return promise
end

TalentsService.set_talents_v2 = function (self, player, layout, points_spent)
	local character_id = player:character_id()
	local talents = TalentLayoutParser.pack_backend_data(layout, points_spent)
	local backend = self._backend_interface.characters
	local promise = backend:set_talents_v2(character_id, talents)

	promise:next(callback(_set_backend_response_success, player), _set_talents_backend_response_fail):catch(function (err)
		_set_talents_backend_response_fail(err)
	end)

	return promise
end

local function _set_specialization_backend_response_fail(error)
	Log.error("Talents", "couldn't set selected specialization in backend")
end

TalentsService.set_specialization = function (self, player, specialization)
	local backend = self._backend_interface.characters
	local character_id = player:character_id()
	local characters_promise = backend:set_specialization(character_id, specialization)

	characters_promise:next(callback(_set_backend_response_success, player, specialization), _set_specialization_backend_response_fail)
end

TalentsService.load_icons_for_profile = function (self, profile, reference_name, callback, prioritize)
	local archetype = profile.archetype
	local talents_package_path = archetype.talents_package_path
	local load_id = Managers.package:load(talents_package_path, reference_name, callback, prioritize)

	return load_id
end

TalentsService.release_icons = function (self, load_id)
	if load_id then
		Managers.package:release(load_id)
	end
end

TalentsService.mark_unlocked_group_as_new = function (self, character_id, talent_group_id)
	local save_manager = Managers.save
	local character_save_data = character_id and save_manager and save_manager:character_data(character_id)

	if not character_save_data then
		return
	end

	if not character_save_data.new_unlocked_talent_groups then
		character_save_data.new_unlocked_talent_groups = {}
	end

	character_save_data.new_unlocked_talent_groups[talent_group_id] = true

	save_manager:queue_save()
end

TalentsService.unmark_unlocked_group_as_new = function (self, character_id, talent_group_id)
	local save_manager = Managers.save
	local character_save_data = character_id and save_manager and save_manager:character_data(character_id)

	if not character_save_data or not character_save_data.new_unlocked_talent_groups then
		return
	end

	character_save_data.new_unlocked_talent_groups[talent_group_id] = nil

	save_manager:queue_save()
end

TalentsService.is_group_marked_as_new = function (self, character_id, talent_group_id)
	local save_manager = Managers.save
	local character_save_data = character_id and save_manager and save_manager:character_data(character_id)

	if not character_save_data or not character_save_data.new_unlocked_talent_groups then
		return false
	end

	return character_save_data.new_unlocked_talent_groups[talent_group_id]
end

return TalentsService
