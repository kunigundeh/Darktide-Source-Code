require("scripts/extension_systems/weapon/actions/action_ability_base")

local Attack = require("scripts/utilities/attack/attack")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local SpecialRulesSettings = require("scripts/settings/ability/special_rules_settings")
local Stagger = require("scripts/utilities/attack/stagger")
local Suppression = require("scripts/utilities/attack/suppression")
local TalentSettings = require("scripts/settings/talent/talent_settings_new")
local Toughness = require("scripts/utilities/toughness/toughness")
local Vo = require("scripts/utilities/vo")
local talent_settings_3 = TalentSettings.zealot_3
local proc_events = BuffSettings.proc_events
local special_rules = SpecialRulesSettings.special_rules
local ActionZealotChannel = class("ActionZealotChannel", "ActionAbilityBase")

ActionZealotChannel.init = function (self, action_context, action_params, action_settings)
	ActionZealotChannel.super.init(self, action_context, action_params, action_settings)

	local unit_data_extension = action_context.unit_data_extension
	self._weapon_action_component = unit_data_extension:read_component("weapon_action")
	self._unit_data_extension = unit_data_extension
	self._combat_ability_component = unit_data_extension:write_component("combat_ability")
	self._action_settings = action_settings
end

ActionZealotChannel.start = function (self, action_settings, t, time_scale, action_start_params)
	ActionZealotChannel.super.start(self, action_settings, t, time_scale, action_start_params)

	local locomotion_component = self._locomotion_component
	local locomotion_position = locomotion_component.position
	local player_position = locomotion_position
	local player_unit = self._player_unit
	self._combat_ability_component.active = true
	self._ability_extension = ScriptUnit.extension(player_unit, "ability_system")
	self._coherency_extension = ScriptUnit.extension(player_unit, "coherency_system")
	self._next_tick_t = t + 0
	self._num_ticks = 0
	self._add_buff_time = action_settings.add_buff_time
	self._end_anim_t = nil
	self._specialization_extension = ScriptUnit.extension(player_unit, "specialization_system")
	self._offensive_buff = self._specialization_extension:has_special_rule(special_rules.zealot_channel_grants_offensive_buff) and action_settings.offensive_buff
	self._defensive_buff = self._specialization_extension:has_special_rule(special_rules.zealot_channel_grants_defensive_buff) and action_settings.defensive_buff
	self._toughness_bonus_buff = action_settings.toughness_bonus_buff
	self._zealot_channel_staggers = self._specialization_extension:has_special_rule(special_rules.zealot_channel_staggers)
	local wwise_state = action_settings.wwise_state

	if wwise_state then
		Wwise.set_state(wwise_state.group, wwise_state.on_state)
	end

	local vo_tag = action_settings.vo_tag

	if vo_tag then
		Vo.play_combat_ability_event(player_unit, vo_tag)

		self._next_vo = t + 3
		self._vo_tag = vo_tag
	end

	local sound_event = action_settings.sound_event

	if sound_event and self._is_server then
		if type(sound_event) == "table" then
			for _, event_name in pairs(sound_event) do
				self._fx_extension:trigger_exclusive_wwise_event(event_name, player_position)
			end
		else
			self._fx_extension:trigger_exclusive_wwise_event(sound_event, player_position)
		end
	end

	local anim = action_settings.anim
	local anim_3p = action_settings.anim_3p or anim

	if anim then
		self:trigger_anim_event(anim, anim_3p)
	end

	if not self._is_server then
		return
	end

	local vfx = action_settings.vfx

	if vfx then
		local vfx_pos = player_position + Vector3.up()
		local rotation = self._first_person_component.rotation

		self._fx_extension:spawn_particles(vfx, vfx_pos, rotation)
	end

	local duration = action_settings.duration
	self._duration = t + duration
	local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
	local param_table = buff_extension:request_proc_event_param_table()

	if param_table then
		param_table.unit = player_unit

		buff_extension:add_proc_event(proc_events.on_combat_ability, param_table)
	end
end

ActionZealotChannel.fixed_update = function (self, dt, t, time_in_action)
	if not self._is_server then
		if self._next_tick_t <= t then
			self._next_tick_t = self._next_tick_t + talent_settings_3.bolstering_prayer.tick_rate

			self:trigger_anim_event("raise", "raise")
		end

		return
	end

	local in_coherence_units = self._coherency_extension:in_coherence_units()

	if self._num_ticks == 0 then
		for in_coherence_unit, _ in pairs(in_coherence_units) do
			Toughness.replenish_percentage(in_coherence_unit, dt * talent_settings_3.bolstering_prayer.team_toughness * 1.75, false, "zealot_channel")
		end
	else
		for in_coherence_unit, _ in pairs(in_coherence_units) do
			Toughness.replenish_percentage(in_coherence_unit, dt * talent_settings_3.bolstering_prayer.team_toughness, false, "zealot_channel")
		end
	end

	if not self._end_anim_t and self._next_tick_t <= t then
		self._next_tick_t = self._next_tick_t + talent_settings_3.bolstering_prayer.tick_rate

		self:_on_channel_tick(in_coherence_units, t, time_in_action)

		self._num_ticks = self._num_ticks + 1
	end

	if self._end_anim_t and self._end_anim_t <= t then
		self._combat_ability_component.active = false
		self._end_anim_t = nil
	end

	if self._duration and self._duration <= t then
		self._end_anim_t = t + 0.5

		self:_use_ability_charge()

		self._duration = nil
	end

	if self._next_vo and self._next_vo <= t then
		local vo_tag = self._vo_tag

		Vo.play_combat_ability_event(self._player_unit, vo_tag)

		self._next_vo = nil
	end
end

local broadphase_results = {}
local SUPPRESSION_DECAY_DELAY = {
	3.2,
	3,
	5
}

ActionZealotChannel._on_channel_tick = function (self, in_coherence_units, t, time_in_action)
	for in_coherence_unit, _ in pairs(in_coherence_units) do
		local buff_extension = ScriptUnit.has_extension(in_coherence_unit, "buff_system")

		if buff_extension then
			buff_extension:add_internally_controlled_buff("bolstering_prayer_resist_death", t)
		end

		local toughness_percentage = talent_settings_3.bolstering_prayer.toughness_percentage

		Toughness.replenish_percentage(in_coherence_unit, toughness_percentage, false, "zealot_channel")

		local toughness_extension = ScriptUnit.has_extension(in_coherence_unit, "toughness_system")

		if toughness_extension and toughness_extension:current_toughness_percent() == 1 then
			buff_extension:add_internally_controlled_buff(self._toughness_bonus_buff, t)
		end

		local fx_extension = ScriptUnit.has_extension(in_coherence_unit, "fx_system")

		if fx_extension then
			fx_extension:spawn_exclusive_particle("content/fx/particles/screenspace/screen_buff_bolstering_prayer_proc", Vector3(0, 0, 1))
		end
	end

	if self._zealot_channel_staggers then
		local action_settings = self._action_settings
		time_in_action = math.min(time_in_action, 5)
		local radius_time_in_action_multiplier = action_settings.radius_time_in_action_multiplier or 0
		local radius = action_settings.radius + time_in_action * radius_time_in_action_multiplier
		local base_power_level = time_in_action > 0.5 and action_settings.power_level or 0

		self:_zealot_stagger(radius, base_power_level)
	end

	if self._add_buff_time < time_in_action then
		for in_coherence_unit, _ in pairs(in_coherence_units) do
			local buff_extension = ScriptUnit.has_extension(in_coherence_unit, "buff_system")

			if buff_extension then
				if self._offensive_buff then
					buff_extension:add_internally_controlled_buff(self._offensive_buff, t)
				end

				if self._defensive_buff then
					buff_extension:add_internally_controlled_buff(self._defensive_buff, t)
				end
			end
		end
	end

	self:trigger_anim_event("raise", "raise")

	local aggroed_minions = Managers.state.pacing:aggroed_minions()
	local player_position = POSITION_LOOKUP[self._player_unit]
	local action_settings = self._action_settings
	local damage_profile = action_settings.damage_profile

	for minion_unit, _ in pairs(aggroed_minions) do
		local enemy_breed = ScriptUnit.extension(minion_unit, "unit_data_system"):breed()

		if enemy_breed.suppress_config then
			local perception_extension = ScriptUnit.extension(minion_unit, "perception_system")

			if perception_extension:has_line_of_sight(self._player_unit) then
				Suppression.apply_suppression(minion_unit, self._player_unit, damage_profile, player_position)
				Suppression.apply_suppression_decay_delay(minion_unit, math.random_range(SUPPRESSION_DECAY_DELAY[1], SUPPRESSION_DECAY_DELAY[2]))
			end
		end
	end
end

ActionZealotChannel._zealot_stagger = function (self, radius, power_level)
	local action_settings = self._action_settings
	local unit = self._player_unit

	table.clear(broadphase_results)

	local side_system = Managers.state.extension:system("side_system")
	local side = side_system.side_by_unit[unit]
	local player_position = POSITION_LOOKUP[unit]
	local enemy_side_names = side:relation_side_names("enemy")
	local ai_target_units = side.ai_target_units
	local player_units = side.valid_enemy_player_units
	local broadphase_system = Managers.state.extension:system("broadphase_system")
	local broadphase = broadphase_system.broadphase
	local num_hits = broadphase:query(player_position, radius, broadphase_results, enemy_side_names)
	local damage_profile = action_settings.damage_profile

	for ii = 1, num_hits do
		repeat
			local enemy_unit = broadphase_results[ii]

			if not ai_target_units[enemy_unit] or player_units[enemy_unit] then
				break
			end

			local enemy_breed = ScriptUnit.extension(enemy_unit, "unit_data_system"):breed()
			local minion_position = POSITION_LOOKUP[enemy_unit]
			local attack_direction = Vector3.normalize(Vector3.flat(minion_position - player_position))

			if enemy_breed.suppress_config then
				Suppression.apply_suppression(enemy_unit, unit, damage_profile, player_position)
				Suppression.apply_suppression_decay_delay(enemy_unit, math.random_range(SUPPRESSION_DECAY_DELAY[1], SUPPRESSION_DECAY_DELAY[2]))
			else
				local hit_zone_name = "torso"

				Attack.execute(enemy_unit, damage_profile, "attack_direction", attack_direction, "power_level", power_level, "hit_zone_name", hit_zone_name, "attacking_unit", unit)
			end
		until true
	end

	local force_stagger_radius = action_settings.force_stagger_radius
	local force_stagger_duration = action_settings.force_stagger_duration

	if force_stagger_radius then
		num_hits = broadphase:query(player_position, force_stagger_radius, broadphase_results, enemy_side_names)

		for ii = 1, num_hits do
			repeat
				local enemy_unit = broadphase_results[ii]

				if not ai_target_units[enemy_unit] or player_units[enemy_unit] then
					break
				end

				local minion_position = POSITION_LOOKUP[enemy_unit]
				local attack_direction = Vector3.normalize(Vector3.flat(minion_position - player_position))

				Stagger.force_stagger(enemy_unit, "light", attack_direction, force_stagger_duration, 1, force_stagger_duration)
			until true
		end
	end
end

ActionZealotChannel.finish = function (self, reason, data, t, time_in_action, action_settings)
	ActionZealotChannel.super.finish(self, reason, data, t, time_in_action)

	local wwise_state = action_settings.wwise_state

	if wwise_state then
		Wwise.set_state(wwise_state.group, wwise_state.off_state)
	end

	self._combat_ability_component.active = false

	self:_use_ability_charge()
end

return ActionZealotChannel