local Breed = require("scripts/utilities/breed")
local DialogueBreedSettings = require("scripts/settings/dialogue/dialogue_breed_settings")
local DialogueCategoryConfig = require("scripts/settings/dialogue/dialogue_category_config")
local DialogueQueries = require("scripts/extension_systems/dialogue/dialogue_queries")
local DialogueSettings = require("scripts/settings/dialogue/dialogue_settings")
local PlayerVoiceGrunts = require("scripts/utilities/player_voice_grunts")
local VoiceFxPresetSettings = require("scripts/settings/dialogue/voice_fx_preset_settings")
local WwiseRouting = require("scripts/settings/dialogue/wwise_vo_routing_settings")
local Vo = require("scripts/utilities/vo")
local DialogueExtension = class("DialogueExtension")

local function _has_wwise_voice_switch_config(breed_configuration)
	local wwise_voice_switch_group = breed_configuration.wwise_voice_switch_group
	local wwise_voices = breed_configuration.wwise_voices

	return wwise_voice_switch_group ~= nil and wwise_voice_switch_group ~= "" and wwise_voices ~= nil and #wwise_voices > 0
end

DialogueExtension.init = function (self, dialogue_system, dialogue_system_wwise, extension_per_breed_wwise_voice_index, vo_sources_cache, unit, extension_init_data, wwise_world)
	self.input = self
	self._dialogue_system = dialogue_system
	self._dialogue_system_wwise = dialogue_system_wwise
	self._unit = unit
	self._vo_sources_cache = vo_sources_cache
	self._wwise_world = wwise_world
	self._trigger_event_data_payload = {}
	self._vo_choice = nil
	self._vo_profile_name = nil
	self._voice_fx_preset = nil
	self._profile = nil
	self._voice_node = nil
	self._is_network_synced = false
	self._play_unit = nil
	self._vo_center_percent = nil
	self._status_extension = nil
	self._wwise_source_id = nil
	self._wwise_voice_switch_group = nil
	self._wwise_voice_switch_value = nil
	self._faction = nil
	self._faction_memory = nil
	self._faction_breed_name = nil
	self._user_memory = {}
	self._vo_event_cooldown_times = {}
	self._local_player = extension_init_data.local_player
	self._local_player_start_pos = nil
	self._local_player_has_moved = false
	self._last_query_sound_event = nil
	self._currently_playing_dialogue = nil
	self._dialogue_timer = nil
	self._random_talk_enabled = false
	self._next_random_talk_line_update_t = 180
	self._random_talk_tick_time_t = 60
	self._random_talk_trigger_id = nil
	self._mission_update_enabled = false
	self._next_mission_fetch_t = 0
	self._next_mission_play_vo_t = 0
	self._missions = {}
	self._missions_data = {}
	self._dynamic_smart_tag = nil
	self._is_a_player = false
	self._use_local_player_vo_profile = false
	self._stop_vce_event = nil
	self._context = {
		is_catapulted = "false",
		is_ledge_hanging = "false",
		is_hogtied = "false",
		is_disabled = false,
		is_netted = "false",
		player_level = 0,
		weapon_type = "none",
		story_stage = "none",
		is_warp_grabbed = "false",
		is_pounced_down = "false",
		is_local_player = false,
		is_knocked_down = "false",
		voice_fx_preset = 0,
		is_disabled_override = false,
		class_name = "none",
		is_consumed = "false",
		is_mutant_charged = "false",
		voice_template = "none",
		is_player = false,
		breed_name = "unknown_breed_name",
		health = 1
	}

	if self._local_player then
		self._context.is_local_player = true
	end

	local breed = extension_init_data.breed

	if breed then
		local breed_name = breed.name
		local dialogue_breed_settings = DialogueBreedSettings[breed_name]
		self._faction_breed_name = breed.faction_name

		if _has_wwise_voice_switch_config(dialogue_breed_settings) then
			if extension_per_breed_wwise_voice_index[breed_name] == nil then
				extension_per_breed_wwise_voice_index[breed_name] = 1
			end

			local selected_voice_index = nil

			if dialogue_breed_settings.randomize_voice then
				local voice_selection_seed = extension_init_data.seed
				voice_selection_seed, selected_voice_index = math.next_random(voice_selection_seed, 1, #dialogue_breed_settings.wwise_voices)
			else
				selected_voice_index = extension_per_breed_wwise_voice_index[breed_name]
				extension_per_breed_wwise_voice_index[breed_name] = selected_voice_index % #dialogue_breed_settings.wwise_voices + 1
			end

			self._wwise_voice_switch_value = dialogue_breed_settings.wwise_voices[selected_voice_index]
			self._wwise_voice_switch_group = dialogue_breed_settings.wwise_voice_switch_group
		end

		self._is_network_synced = dialogue_breed_settings.is_network_synced
		self._faction = dialogue_breed_settings.dialogue_memory_faction_name

		if self._faction == nil then
			Log.Warning("DialogueExtension", "Unit %s doesn't define a dialogue_memory_faction_name, please contact the Audio Team", unit)
		end

		if Breed.is_player(breed) then
			self._is_a_player = true
			self._context.is_player = "true"
			local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
			local first_person_unit = first_person_extension:first_person_unit()
			local fx_extension = ScriptUnit.extension(unit, "fx_system")
			self._fx_extension = fx_extension

			PlayerVoiceGrunts.create_voice(fx_extension, first_person_unit, "ap_camera_node")
		end

		self._context.breed_name = breed_name
		self._stop_vce_event = dialogue_breed_settings.stop_vce_event
		local vo_events = dialogue_breed_settings.vo_events

		if vo_events then
			local event_manager = Managers.event

			for event_name, vo_event in pairs(vo_events) do
				event_manager:register_with_parameters(self, "_cb_vo_event_triggered", event_name, event_name)
			end

			self._registered_vo_events = vo_events
		end

		local random_talk_settings = dialogue_breed_settings.random_talk_settings

		if random_talk_settings then
			self:_setup_random_talk_settings(random_talk_settings, dialogue_breed_settings.vo_class_name)
		end
	end

	local selected_voice = extension_init_data.selected_voice

	if selected_voice then
		self._is_a_player = true
		self._context.is_player = "true"
		local player_unit_spawn_manager = Managers.state.player_unit_spawn
		local player = player_unit_spawn_manager:owner(unit)

		if player then
			local profile = player:profile()

			if profile then
				self._context.player_level = profile.current_level
				self._profile = profile

				if not player:is_human_controlled() then
					self._context.player_level = self._dialogue_system.global_context.team_lowest_player_level
				end
			end
		end

		self:set_vo_profile(selected_voice)

		self._context.voice_template = self._vo_profile_name
		self._context.class_name = self:vo_class_name()

		return
	end

	if self._wwise_voice_switch_value then
		self:set_vo_profile(self._wwise_voice_switch_value)

		self._context.voice_template = self._vo_profile_name
		self._context.class_name = self:vo_class_name()

		return
	end

	local profile_name, voice_content = vo_sources_cache:get_default_voice_profile()
	self._vo_profile_name = profile_name
	self._vo_choice = voice_content
	self._context.voice_template = self._vo_profile_name
end

DialogueExtension._cb_vo_event_triggered = function (self, event_name, ...)
	local registered_vo_events = self._registered_vo_events
	local vo_func_name = registered_vo_events[event_name]
	local vo_function = Vo[vo_func_name]
	local unit = self._unit

	vo_function(unit, self, ...)
end

DialogueExtension._setup_random_talk_settings = function (self, random_talk_settings, vo_class)
	self._random_talk_enabled = random_talk_settings.enabled
	self._next_random_talk_line_update_t = random_talk_settings.random_talk_start_delay_t
	self._random_talk_tick_time_t = random_talk_settings.random_talk_tick_time_t
	self._random_talk_trigger_id = random_talk_settings.trigger_id
	self._mission_update_enabled = random_talk_settings.mission_update_enabled
end

DialogueExtension.setup_from_component = function (self, vo_class, vo_proile_name, use_local_player_voice_profile, dialogue_faction_name, enabled)
	self._enabled = enabled

	if not enabled then
		return
	end

	local dialogue_breed_settings = DialogueBreedSettings[vo_class]

	if dialogue_breed_settings and dialogue_breed_settings.random_talk_settings then
		self:_setup_random_talk_settings(dialogue_breed_settings.random_talk_settings, dialogue_breed_settings.vo_class_name)
	end

	self:init_faction_memory(dialogue_faction_name)

	self._use_local_player_vo_profile = use_local_player_voice_profile

	if use_local_player_voice_profile and not DEDICATED_SERVER then
		local local_player = Managers.player:local_player(1)
		local profile = local_player:profile()

		self:set_vo_profile(profile.selected_voice)
		self:_set_vo_class(profile.archetype.name)

		return
	end

	if not self._profile then
		self:set_vo_profile(vo_proile_name)
		self:_set_vo_class(vo_class)
	end
end

DialogueExtension.cleanup = function (self)
	if self._fx_extension then
		PlayerVoiceGrunts.destroy_voice(self._fx_extension)
	end

	if self._currently_playing_dialogue then
		self._dialogue_system:_remove_stopped_dialogue(self._currently_playing_dialogue)

		if self._currently_playing_dialogue.currently_playing_event_id then
			self._dialogue_system_wwise:stop_if_playing(self._currently_playing_dialogue.currently_playing_event_id)
		end
	end

	self._currently_playing_dialogue = nil

	table.clear(self._user_memory)
	table.clear(self._context)

	self._dialogue_timer = nil
	local registered_vo_events = self._registered_vo_events

	if registered_vo_events then
		local event_manager = Managers.event

		for event_name, _ in pairs(registered_vo_events) do
			event_manager:unregister(self, event_name)
		end
	end
end

DialogueExtension.set_voice_source = function (self)
	if self._wwise_source_id == nil then
		self._wwise_source_id = self._wwise_world.make_manual_source(self._wwise_world, self._play_unit, self._voice_node)
	end
end

DialogueExtension.on_extensions_ready = function (self)
	local play_unit = self._unit
	local vo_center_percent = 0
	local voice_node = nil

	if self._local_player then
		play_unit = ScriptUnit.extension(self._unit, "first_person_system"):first_person_unit()
		vo_center_percent = 100
		voice_node = Unit.node(play_unit, "ap_camera_node")
		local destination = {}
		destination[1], destination[2], destination[3] = Vector3.to_elements(POSITION_LOOKUP[self._unit])
		self._local_player_start_pos = destination
	elseif Unit.has_node(play_unit, "ap_voice") then
		voice_node = Unit.node(play_unit, "ap_voice")
	elseif Unit.has_node(play_unit, "j_head") then
		voice_node = Unit.node(play_unit, "j_head")
	else
		voice_node = 1
	end

	self._play_unit = play_unit
	self._voice_node = voice_node
	self._vo_center_percent = vo_center_percent

	self:set_voice_source()

	self._is_incapacitated = false
	self._incapacitate_time = -1
end

DialogueExtension.physics_async_update = function (self, context, dt, t)
	self:_update_random_talk_lines(t)
	self:_update_vo_event_cool_down_times(t)

	if self._status_extension then
		local is_incapacitated = self._status_extension:is_disabled()

		if not self._is_incapacitated and is_incapacitated then
			self._incapacitate_time = t
			self._context.is_disabled_override = false
		end

		self._is_incapacitated = is_incapacitated
	end
end

DialogueExtension._update_random_talk_lines = function (self, t)
	if not self._random_talk_enabled then
		return
	end

	if self._dialogue_system:is_server() and self._mission_update_enabled == true then
		self:_update_mission_update_vo()
	end

	local next_random_talk_line_update_t = self._next_random_talk_line_update_t

	if next_random_talk_line_update_t < t then
		self._next_random_talk_line_update_t = t + self._random_talk_tick_time_t
		local event_name = "generic_vo_event"

		table.clear(self._trigger_event_data_payload)

		local event_data = self:get_event_data_payload()
		event_data.trigger_id = self._random_talk_trigger_id

		self:trigger_dialogue_event(event_name, event_data)
	end
end

DialogueExtension._update_mission_update_vo = function (self)
	local t = Managers.time:time("main")

	if self._next_mission_fetch_t <= t then
		local missions_data, missions = self._dialogue_system:mission_board()

		if not missions_data or not missions_data.expiry_game_time then
			return
		end

		self._missions_data = missions_data
		self._missions = missions
		self._next_mission_fetch_t = missions_data.expiry_game_time + math.random()
		self._missions_board_promise = nil
		self._next_mission_play_vo_t = 0
	end

	if self._next_mission_play_vo_t <= t then
		local missions = self._missions

		for i = 1, #missions do
			local mission_data = missions[i]
			local start_time = mission_data.start_game_time
			local active_time = t - start_time

			if active_time <= 1 then
				if active_time >= -1 then
					local mission_name = mission_data.map
					local circumstance = mission_data.circumstance or "default"
					local event_name = "mission_update_vo"
					local is_circumstance = nil

					if circumstance == "default" then
						is_circumstance = "false"
					else
						is_circumstance = "true"
					end

					table.clear(self._trigger_event_data_payload)

					local event_data = self:get_event_data_payload()
					event_data.mission = mission_name
					event_data.is_circumstance = is_circumstance
					event_data.trigger_id = "mission_update"

					self:trigger_dialogue_event(event_name, event_data)
				else
					self._next_mission_play_vo_t = start_time

					break
				end
			end
		end

		if self._next_mission_play_vo_t <= 0 then
			self._next_mission_play_vo_t = self._next_mission_fetch_t
		end
	end
end

DialogueExtension._update_vo_event_cool_down_times = function (self, t)
	for vo_event_name, vo_profiles in pairs(self._vo_event_cooldown_times) do
		repeat
			for vo_profile, cooldown_time in pairs(vo_profiles) do
				if cooldown_time <= t then
					self._vo_event_cooldown_times[vo_event_name][vo_profile] = nil

					if table.is_empty(self._vo_event_cooldown_times[vo_event_name]) then
						self._vo_event_cooldown_times[vo_event_name] = nil
					end
				end
			end
		until true
	end
end

DialogueExtension.trigger_faction_dialogue_query = function (self, event_name, event_data, identifier, breed_faction_name, exclude_me)
	if not self._dialogue_system:is_server() then
		Log.error("DialogueExtension", "trigger_faction_dialogue_query must be executed in the server")

		return
	end

	self._dialogue_system:append_faction_event(self._unit, event_name, event_data, identifier, breed_faction_name, exclude_me)
end

DialogueExtension.trigger_factions_dialogue_query = function (self, event_name, event_data, identifier, breed_factions, exclude_me)
	if not self._dialogue_system:is_server() then
		Log.error("DialogueExtension", "trigger_faction_dialogue_query must be executed in the server")

		return
	end

	for _, faction in pairs(breed_factions) do
		self._dialogue_system:append_faction_event(self._unit, event_name, event_data, identifier, faction, exclude_me)
	end
end

DialogueExtension.trigger_dialogue_event = function (self, event_name, event_data, identifier)
	self:trigger_networked_dialogue_event(event_name, event_data, identifier)
end

DialogueExtension.manage_targeted_cooldowns = function (self, event_data)
	local cooldown_times = self._vo_event_cooldown_times
	local vo_event_name = event_data.vo_event
	local existing_cooldown_event = cooldown_times[vo_event_name]
	local profile_name = event_data.npc_profile_name

	if existing_cooldown_event then
		local existing_cooldown_time_t = existing_cooldown_event[profile_name]

		if existing_cooldown_time_t then
			return false
		end
	else
		cooldown_times[vo_event_name] = {}
	end

	local game_time = Managers.time:time("gameplay")
	local vo_event_cooldown_t = event_data.cooldown_time

	if vo_event_name and vo_event_cooldown_t then
		cooldown_times[vo_event_name][profile_name] = game_time + vo_event_cooldown_t
	end

	return true
end

DialogueExtension.trigger_targeted_dialogue_event = function (self, event_name, event_data, target_unit, identifier)
	event_data.target_unit = target_unit

	self:trigger_networked_dialogue_event(event_name, event_data, identifier)
end

DialogueExtension.trigger_networked_dialogue_event = function (self, event_name, event_data, identifier)
	if LEVEL_EDITOR_TEST then
		return
	end

	if self._dialogue_system:is_server() then
		self._dialogue_system:append_event_to_queue(self._unit, event_name, event_data, identifier)
	else
		local index_concept = self._dialogue_system.dialogueLookupConcepts[event_name]
		local array_event_data = {}
		local array_event_data_is_number = {}
		local current_pair = 1

		for key, value in pairs(event_data) do
			local context_name_id = self._dialogue_system.dialogueLookupContexts.all_context_names[key]
			array_event_data[current_pair] = context_name_id
			array_event_data_is_number[current_pair] = false
			current_pair = current_pair + 1

			if type(value) == "number" then
				array_event_data[current_pair] = value
				array_event_data_is_number[current_pair] = true
			else
				if self._dialogue_system.dialogueLookupContexts[key] == nil then
					return
				end

				local value_id = self._dialogue_system.dialogueLookupContexts[key][value]
				array_event_data[current_pair] = value_id
				array_event_data_is_number[current_pair] = false
			end

			current_pair = current_pair + 1
		end

		local _, go_id = Managers.state.unit_spawner:game_object_id_or_level_index(self._unit)

		Managers.state.game_session:send_rpc_server("rpc_trigger_dialogue_event", go_id, index_concept, array_event_data, array_event_data_is_number)
	end
end

DialogueExtension.trigger_voice = function (self, wwise_event_name, sound_source)
	self._dialogue_system_wwise:set_switch(sound_source, self._wwise_voice_switch_group, self._vo_profile_name)
	self:_set_source_parameter("voice_fx_preset", self._voice_fx_preset, sound_source)

	return self._dialogue_system_wwise:trigger_resource_event(wwise_event_name, sound_source)
end

DialogueExtension.play_voice_debug = function (self, sound_event)
	return
end

DialogueExtension.trigger_query = function (self, event_data)
	return
end

DialogueExtension.set_vo_profile = function (self, profile_name)
	local vo_sources_cache = self._vo_sources_cache
	self._wwise_voice_switch_group = self._wwise_voice_switch_group or DialogueSettings.default_voice_switch_group
	self._wwise_voice_switch_value = profile_name
	self._vo_profile_name = profile_name
	self._context.voice_template = self._vo_profile_name
	self._vo_choice = vo_sources_cache:get_vo_source(self._vo_profile_name)

	if self._fx_extension then
		local voice_source_id = PlayerVoiceGrunts.voice_source(self._fx_extension)

		PlayerVoiceGrunts.set_voice(self._wwise_world, voice_source_id, self._wwise_voice_switch_group, profile_name)
	end
end

DialogueExtension._set_vo_class = function (self, vo_class_name)
	self._vo_class = vo_class_name
	self._context.class_name = self._vo_class
end

DialogueExtension.init_faction_memory = function (self, faction_memory_name)
	local faction_memory = self._dialogue_system._faction_memories[faction_memory_name]

	if self._dialogue_system._is_rule_db_enabled then
		self._dialogue_system._tagquery_database:add_object_context(self._unit, "faction_memory", faction_memory)
	end

	self._faction_memory = faction_memory
	self._faction_breed_name = faction_memory_name
end

DialogueExtension.set_voice_profile_data = function (self, vo_class_name, wwise_switch_group, voice_profile)
	self._wwise_voice_switch_group = wwise_switch_group

	self:_set_vo_class(vo_class_name)
	self:set_vo_profile(voice_profile)
end

DialogueExtension.set_voice_data = function (self)
	local wwise_world = self._wwise_world

	WwiseWorld.set_switch(wwise_world, self._wwise_voice_switch_group, self._wwise_voice_switch_value, self._wwise_source_id)

	local voice_fx_preset = self._voice_fx_preset

	if voice_fx_preset then
		WwiseWorld.set_source_parameter(wwise_world, self._wwise_source_id, "voice_fx_preset", voice_fx_preset)
	end
end

DialogueExtension.voice_data = function (self)
	return self._wwise_voice_switch_group or "voice_profile", self._vo_profile_name, self._voice_fx_preset
end

DialogueExtension.get_voice_profile = function (self)
	return self._vo_profile_name
end

DialogueExtension.has_vo_profile = function (self)
	return self._vo_choice and self._vo_profile_name
end

DialogueExtension.set_voice_fx_preset = function (self, optional_voice_fx_preset_name)
	local voice_fx_preset = VoiceFxPresetSettings[optional_voice_fx_preset_name] or VoiceFxPresetSettings.voice_fx_rtpc_none
	self._voice_fx_preset = voice_fx_preset
	self._context.voice_fx_preset = voice_fx_preset
end

DialogueExtension._set_source_parameter = function (self, parameter, value, wwise_source_id)
	WwiseWorld.set_source_parameter(self._wwise_world, wwise_source_id, parameter, value)
end

DialogueExtension.get_dialogue_event_index = function (self, query)
	if self._vo_choice[query.result] then
		local dialogue_index = DialogueQueries.get_dialogue_event_index(self._vo_choice[query.result])

		return self._vo_choice[query.result].sound_events[dialogue_index], self._vo_choice[query.result].sound_events_duration[dialogue_index], dialogue_index
	else
		return nil, nil
	end
end

DialogueExtension.get_dialogue_event = function (self, dialogue_name, dialogue_index)
	if self._vo_choice[dialogue_name] then
		return self._vo_choice[dialogue_name].sound_events[dialogue_index], self._vo_choice[dialogue_name].sound_events[dialogue_index], self._vo_choice[dialogue_name].sound_events_duration[dialogue_index]
	else
		return nil, nil, nil
	end
end

DialogueExtension.has_dialogue = function (self, dialogue_name)
	if self._vo_choice[dialogue_name] then
		return true
	else
		return false
	end
end

DialogueExtension.play_event = function (self, event)
	local type = event.type

	if type == "resource_event" then
		local sound_event = event.sound_event
		local wwise_source_id = self._wwise_source_id or self._dialogue_system_wwise:make_unit_auto_source(self._play_unit, self._voice_node)

		WwiseWorld.set_switch(self._wwise_world, self._wwise_voice_switch_group, self._wwise_voice_switch_value, self._wwise_source_id)

		return self._dialogue_system_wwise:trigger_resource_event("wwise/events/vo/" .. sound_event, wwise_source_id)
	elseif type == "vorbis_external" then
		local wwise_route = event.wwise_route
		local sound_event = event.sound_event
		local wwise_source_id = self._wwise_source_id or self._dialogue_system_wwise:make_unit_auto_source(self._play_unit, self._voice_node)
		local selected_wwise_route = self:get_selected_wwise_route(wwise_route, wwise_source_id)
		local wwise_play_event = selected_wwise_route.wwise_event_path
		local wwise_es = selected_wwise_route.wwise_sound_source

		self:stop_currently_playing_vce_event()
		self:_set_source_parameter("voice_fx_preset", self._voice_fx_preset, wwise_source_id)

		return self._dialogue_system_wwise:trigger_vorbis_external_event(wwise_play_event, wwise_es, "wwise/externals/" .. sound_event, wwise_source_id)
	end
end

DialogueExtension.stop_currently_playing_vo = function (self)
	local current_dialogue = self._currently_playing_dialogue

	if current_dialogue then
		if current_dialogue.currently_playing_event_id then
			self._dialogue_system_wwise:stop_if_playing(current_dialogue.currently_playing_event_id)
		end

		self._dialogue_system:_remove_stopped_dialogue(current_dialogue)
	end
end

DialogueExtension.stop_currently_playing_vce_event = function (self)
	local stop_vce_event = self._stop_vce_event

	if stop_vce_event and self._wwise_source_id then
		self._dialogue_system_wwise:trigger_resource_event(stop_vce_event, self._wwise_source_id)
	end
end

DialogueExtension.stop_currently_playing_wwise_event = function (self, event_id)
	self._dialogue_system_wwise:stop_if_playing(event_id)
end

DialogueExtension.play_local_vo_events = function (self, rule_names, wwise_route_key, on_play_callback, seed)
	local rule_queue = self._dialogue_system._vo_rule_queue

	for i = 1, #rule_names do
		local rule = rule_names[i]

		if self._vo_choice[rule] then
			local vo_event = {
				unit = self._unit,
				rule_name = rule,
				wwise_route_key = wwise_route_key,
				on_play_callback = on_play_callback,
				seed = seed
			}
			rule_queue[#rule_queue + 1] = vo_event
		end
	end

	local dialogue_system = self._dialogue_system
	local animation_event = "start_talking"

	dialogue_system:_trigger_face_animation_event(self._unit, animation_event)
end

DialogueExtension.play_local_vo_event = function (self, rule_name, wwise_route_key, on_play_callback, seed, optional_keep_talking)
	local dialogue_system = self._dialogue_system
	local rule = self._vo_choice[rule_name]

	if not rule then
		return
	end

	local dialogue_index = nil

	if seed then
		local _, random_n = math.next_random(seed, 1, rule.sound_events_n)
		dialogue_index = random_n
	else
		dialogue_index = DialogueQueries.get_dialogue_event_index(rule)
	end

	local sound_event, subtitles_event, sound_event_duration = self:get_dialogue_event(rule_name, dialogue_index)
	local currently_playing_dialogue = self:get_currently_playing_dialogue()
	local wwise_playing = currently_playing_dialogue and self._dialogue_system_wwise:is_playing(currently_playing_dialogue.currently_playing_event_id)

	if sound_event and not wwise_playing then
		local pre_wwise_event, post_wwise_event = nil
		local dialogue = {}
		local wwise_route = WwiseRouting[wwise_route_key]

		self:set_last_query_sound_event(sound_event)

		dialogue_system._dialog_sequence_events = dialogue_system:_create_sequence_events_table(pre_wwise_event, wwise_route, sound_event, post_wwise_event)
		dialogue.currently_playing_event_id = self:play_event(dialogue_system._dialog_sequence_events[1])
		local speaker_name = self:get_context().voice_template
		local unit = self._unit
		dialogue_system._playing_units[unit] = self
		dialogue.currently_playing_unit = unit
		dialogue.speaker_name = speaker_name
		dialogue.dialogue_timer = sound_event_duration
		dialogue.currently_playing_subtitle = subtitles_event
		dialogue.wwise_route = wwise_route_key
		dialogue.is_audible = true
		local dialogue_category = dialogue.category
		local category_setting = DialogueCategoryConfig[dialogue_category]
		dialogue_system._playing_dialogues[dialogue] = category_setting

		self:set_currently_playing_dialogue(dialogue)
		table.insert(dialogue_system._playing_dialogues_array, 1, dialogue)

		if not optional_keep_talking then
			local animation_event = "start_talking"

			dialogue_system:_trigger_face_animation_event(unit, animation_event)
		end

		local dialogue_system_subtitle = dialogue_system:dialogue_system_subtitle()

		dialogue_system_subtitle:add_playing_localized_dialogue(speaker_name, dialogue)

		if on_play_callback then
			local id = dialogue.currently_playing_event_id

			on_play_callback(id, rule_name)
		end
	end
end

DialogueExtension.get_selected_wwise_route = function (self, wwise_route, wwise_source_id)
	local selected_wwise_route = wwise_route

	if self._is_a_player and self._local_player and wwise_route.local_player_routing_key then
		local player_unit_spawn_manager = Managers.state.player_unit_spawn
		local player = player_unit_spawn_manager:owner(self._unit)

		if player:is_human_controlled() then
			selected_wwise_route = WwiseRouting[wwise_route.local_player_routing_key]
		end
	end

	if wwise_source_id ~= self._wwise_source_id and self._wwise_voice_switch_group then
		self._wwise_source_id = wwise_source_id

		self._dialogue_system_wwise:set_switch_and_vo_center(self._wwise_source_id, self._wwise_voice_switch_group, self._wwise_voice_switch_value, self._vo_center_percent)
	end

	return selected_wwise_route
end

DialogueExtension.store_in_memory = function (self, memory_name, argument_name, value)
	local target_memory = self["_" .. memory_name]
	target_memory[argument_name] = value
end

DialogueExtension.read_from_memory = function (self, memory_name, argument_name)
	local target_memory = self["_" .. memory_name]

	return target_memory[argument_name]
end

DialogueExtension.evaluate_rules = function (self, rules, seed)
	local results = {}

	for i = 1, #rules do
		local rule_name = rules[i]
		local dialogue_index = nil

		if seed then
			local _, random_n = math.next_random(seed, 1, self._vo_choice[rule_name].sound_events_n)
			dialogue_index = random_n
		else
			dialogue_index = math.random(1, self._vo_choice[rule_name].sound_events_n)
		end

		local sound_event, subtitles_event, sound_event_duration = self:get_dialogue_event(rule_name, dialogue_index)
		results[i] = {
			sound_event = sound_event,
			subtitles_event = subtitles_event,
			sound_event_duration = sound_event_duration
		}
	end

	return results
end

DialogueExtension.is_dialogue_disabled = function (self)
	if self._context.is_disabled_override == true then
		return false
	else
		return self._context.is_disabled
	end
end

DialogueExtension.set_dialogue_disabled = function (self, is_disabled)
	self._context.is_disabled = is_disabled
end

DialogueExtension.set_is_disabled_override = function (self, is_disabled_override)
	self._context.is_disabled_override = is_disabled_override
end

DialogueExtension.get_is_incapacitated = function (self)
	return self._is_incapacitated
end

DialogueExtension.get_incapacitate_time = function (self)
	return self._incapacitate_time
end

DialogueExtension.get_context = function (self)
	return self._context
end

DialogueExtension.get_faction = function (self)
	return self._faction
end

DialogueExtension.get_faction_memory = function (self)
	return self._faction_memory
end

DialogueExtension.set_faction_memory = function (self, faction_memory)
	self._faction_memory = faction_memory
end

DialogueExtension.set_faction_breed_name = function (self, faction_breed_name)
	self._faction_breed_name = faction_breed_name
end

DialogueExtension.get_user_memory = function (self)
	return self._user_memory
end

DialogueExtension.get_unit = function (self)
	return self._unit
end

DialogueExtension.get_profile_name = function (self)
	return self._vo_profile_name
end

DialogueExtension.get_status_extension = function (self)
	return self._status_extension
end

DialogueExtension.set_status_extension = function (self, status_extension)
	self._status_extension = status_extension
end

DialogueExtension.get_play_unit = function (self)
	return self._play_unit
end

DialogueExtension.get_voice_node = function (self)
	return self._voice_node
end

DialogueExtension.get_voice_switch_group = function (self)
	return self._wwise_voice_switch_group
end

DialogueExtension.get_voice_switch_value = function (self)
	return self._wwise_voice_switch_value
end

DialogueExtension.get_wwise_source_id = function (self)
	return self._wwise_source_id
end

DialogueExtension.set_wwise_source_id = function (self, source_id)
	self._wwise_source_id = source_id
end

DialogueExtension.get_vo_center_percent = function (self)
	return self._vo_center_percent
end

DialogueExtension.get_last_query_sound_event = function (self)
	return self._last_query_sound_event
end

DialogueExtension.set_last_query_sound_event = function (self, sound_event)
	self._last_query_sound_event = sound_event
end

DialogueExtension.get_currently_playing_dialogue = function (self)
	return self._currently_playing_dialogue
end

DialogueExtension.set_currently_playing_dialogue = function (self, currently_playing)
	self._currently_playing_dialogue = currently_playing
end

DialogueExtension.get_dialogue_timer = function (self)
	return self._dialogue_timer
end

DialogueExtension.set_dialogue_timer = function (self, timer)
	self._dialogue_timer = timer
end

DialogueExtension.set_wwise_route = function (self, wwise_route)
	self._wwise_route = wwise_route
end

DialogueExtension.get_local_player = function (self)
	return self._local_player
end

DialogueExtension.is_network_synced = function (self)
	return self._is_network_synced
end

DialogueExtension.is_a_player = function (self)
	return self._is_a_player
end

DialogueExtension.is_currently_playing_dialogue = function (self)
	return self._currently_playing_dialogue ~= nil
end

DialogueExtension.faction_name = function (self)
	return self._faction_breed_name
end

DialogueExtension.get_event_data_payload = function (self)
	table.clear(self._trigger_event_data_payload)

	return self._trigger_event_data_payload
end

DialogueExtension.development_temporal_do_not_use_archetype_name = function (self)
	if self._is_a_player then
		return string.sub(self._vo_profile_name, 1, -3)
	else
		return DialogueBreedSettings[self._context.breed_name].vo_class_name
	end
end

DialogueExtension.vo_class_name = function (self)
	if self._profile and self._is_a_player then
		return self._profile.archetype.name
	else
		return DialogueBreedSettings[self._context.breed_name].vo_class_name
	end
end

DialogueExtension.is_playing = function (self, id)
	local wwise_world = self._wwise_world
	local is_playing = WwiseWorld.is_playing(wwise_world, id)

	return is_playing
end

DialogueExtension.set_story_stage = function (self, story_stage)
	self._context.story_stage = story_stage
end

DialogueExtension.set_dynamic_smart_tag = function (self, smart_tag)
	self._dynamic_smart_tag = smart_tag
end

DialogueExtension.get_dynamic_smart_tag = function (self)
	return self._dynamic_smart_tag
end

return DialogueExtension
