require("scripts/managers/mutator/mutators/mutator_base")

local Component = require("scripts/utilities/component")
local LiquidArea = require("scripts/extension_systems/liquid_area/utilities/liquid_area")
local LiquidAreaTemplates = require("scripts/settings/liquid_area/liquid_area_templates")
local SpawnPointQueries = require("scripts/managers/main_path/utilities/spawn_point_queries")
local NavQueries = require("scripts/utilities/nav_queries")
local MainPathQueries = require("scripts/utilities/main_path_queries")
local MutatorToxicGasVolumes = class("MutatorToxicGasVolumes", "MutatorBase")

MutatorToxicGasVolumes.init = function (self, is_server, network_event_delegate, mutator_template, nav_world, level_seed)
	self._is_server = is_server
	self._network_event_delegate = network_event_delegate
	self._is_active = true
	self._buffs = {}
	self._template = mutator_template
	self._gas_clouds = {}
	self._nav_world = nav_world
	self._buff_affected_units = {}
	self._active_gas_clouds = {}
	self._seed = level_seed
	local extension_manager = Managers.state.extension
	local side_system = extension_manager:system("side_system")
	self._side_names = side_system:side_names()
	self._side_system = side_system

	if not self._is_server then
		return
	end

	self._in_fog_buff_template_name = "in_toxic_gas"
	self._leaving_fog_buff_template_name = "left_toxic_gas"
	self._broadphase_radius = 50
	local broadphase_system = extension_manager:system("broadphase_system")
	self._broadphase = broadphase_system.broadphase
end

MutatorToxicGasVolumes._activate_cloud = function (self, cloud)
	local liquid_area_template = LiquidAreaTemplates.toxic_gas
	local max_liquid = cloud.max_liquid
	local unit = LiquidArea.try_create(cloud.position:unbox(), Vector3(0, 0, 1), self._nav_world, liquid_area_template, nil, max_liquid)
	cloud.active = true
	cloud.liquid_unit = unit

	cloud.fog_component:set_volume_enabled(true)
end

MutatorToxicGasVolumes._deactivate_cloud = function (self, cloud)
	if ALIVE[cloud.liquid_unit] then
		Managers.state.unit_spawner:mark_for_deletion(cloud.liquid_unit)
	end

	cloud.active = false
	cloud.liquid_unit = nil

	cloud.fog_component:set_volume_enabled(false)
end

local CHANCE_TO_NOT_SPAWN_CLOUD = 0.25

MutatorToxicGasVolumes.on_spawn_points_generated = function (self, level, themes)
	local gas_clouds = self._gas_clouds
	local component_system = Managers.state.extension:system("component_system")
	local fog_units = component_system:get_units_from_component_name("ToxicGasFog")

	if #fog_units == 0 then
		return
	end

	local num_sections = 0

	for i = 1, #fog_units do
		local fog_unit = fog_units[i]
		local components = Component.get_components_by_name(fog_unit, "ToxicGasFog")

		for _, fog_component in ipairs(components) do
			local id = fog_component:get_data(fog_unit, "id")
			local section_id = fog_component:get_data(fog_unit, "section")
			local max_liquid = fog_component:get_data(fog_unit, "max_liquid")

			if not gas_clouds[section_id] then
				gas_clouds[section_id] = {}
			end

			if not gas_clouds[section_id][id] then
				gas_clouds[section_id][id] = {}
			end

			if num_sections < section_id then
				num_sections = section_id
			end

			local entry = {
				fog_unit = fog_unit,
				max_liquid = max_liquid
			}

			table.insert(gas_clouds[section_id][id], entry)
		end
	end

	local active_gas_clouds = {}
	local force_next_to_not_skip = false

	for i = 1, num_sections do
		repeat
			local max_section_id = #gas_clouds
			local random_section_id = self:_random(1, max_section_id)
			local section_entry = gas_clouds[random_section_id]
			local random_id = self:_random(1, #section_entry)
			local clouds = section_entry[random_id]
			local main_path_manager = Managers.state.main_path

			if not force_next_to_not_skip and math.random() < CHANCE_TO_NOT_SPAWN_CLOUD then
				force_next_to_not_skip = true
			else
				force_next_to_not_skip = false

				for j = 1, #clouds do
					local cloud = clouds[j]
					local cloud_unit = cloud.fog_unit
					local max_liquid = cloud.max_liquid
					local fog_components = Component.get_components_by_name(cloud_unit, "ToxicGasFog")
					local wanted_component = nil

					for _, fog_component in ipairs(fog_components) do
						wanted_component = fog_component
					end

					local position = Unit.local_position(cloud_unit, 1)
					local position_on_navmesh = NavQueries.position_on_mesh_with_outside_position(self._nav_world, nil, position, 1, 1, 1)

					if position_on_navmesh then
						local nav_spawn_points = main_path_manager:nav_spawn_points()
						local spawn_point_group_index = SpawnPointQueries.group_from_position(self._nav_world, nav_spawn_points, position_on_navmesh)

						if spawn_point_group_index then
							local start_index = main_path_manager:node_index_by_nav_group_index(spawn_point_group_index or 1)
							local end_index = start_index + 1
							local _, travel_distance, _, _, _ = MainPathQueries.closest_position_between_nodes(position_on_navmesh, start_index, end_index)
							local boxed_position = Vector3Box(position)
							active_gas_clouds[#active_gas_clouds + 1] = {
								cloud_unit = cloud_unit,
								travel_distance = travel_distance,
								position = boxed_position,
								max_liquid = max_liquid,
								fog_component = wanted_component
							}
						end
					end
				end

				table.remove(gas_clouds, random_section_id)
			end
		until true
	end

	self._active_gas_clouds = active_gas_clouds
end

MutatorToxicGasVolumes._random = function (self, ...)
	local seed, value = math.next_random(self._seed, ...)
	self._seed = seed

	return value
end

local TARGET_SIDE_ID = 1
local CLOUD_SPAWN_DISTANCE = 60

MutatorToxicGasVolumes.update = function (self, dt, t)
	if not self._is_server then
		return
	end

	local is_main_path_available = Managers.state.main_path:is_main_path_available()

	if not is_main_path_available then
		return
	end

	local main_path_manager = Managers.state.main_path
	local _, ahead_travel_distance = main_path_manager:ahead_unit(TARGET_SIDE_ID)

	if not ahead_travel_distance then
		return
	end

	local _, behind_travel_distance = main_path_manager:behind_unit(TARGET_SIDE_ID)
	local gas_clouds = self._active_gas_clouds

	for i = 1, #gas_clouds do
		repeat
			local gas_cloud = gas_clouds[i]
			local cloud_travel_distance = gas_cloud.travel_distance
			local ahead_travel_distance_diff = math.abs(ahead_travel_distance - cloud_travel_distance)
			local behind_travel_distance_diff = math.abs(behind_travel_distance - cloud_travel_distance)
			local is_between_ahead_and_behind = cloud_travel_distance < ahead_travel_distance and behind_travel_distance < cloud_travel_distance
			local should_activate = is_between_ahead_and_behind or ahead_travel_distance_diff < CLOUD_SPAWN_DISTANCE or behind_travel_distance_diff < CLOUD_SPAWN_DISTANCE
			local is_active = gas_cloud.active

			if should_activate and not is_active then
				self:_activate_cloud(gas_cloud)
			elseif not should_activate and is_active then
				self:_deactivate_cloud(gas_cloud)
			end
		until true
	end
end

return MutatorToxicGasVolumes
