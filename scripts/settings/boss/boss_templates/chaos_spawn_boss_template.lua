local Blackboard = require("scripts/extension_systems/blackboard/utilities/blackboard")
local ChaosSpawnSettings = require("scripts/settings/monster/chaos_spawn_settings")
local NavQueries = require("scripts/utilities/nav_queries")
local Trajectory = require("scripts/utilities/trajectory")
local LEAP_TRAJECTORY_CHECK_FREQUENCY = 0.2
local LINE_OF_SIGHT_COLLISION_FILTER = "filter_minion_line_of_sight_check"
local template = {
	name = "chaos_spawn",
	start = function (template_data, template_context)
		if not template_context.is_server then
			return
		end

		local unit = template_data.unit
		local blackboard = BLACKBOARDS[unit]
		template_data.behavior_component = Blackboard.write_component(blackboard, "behavior")
		template_data.perception_component = Blackboard.write_component(blackboard, "perception")
		template_data.traverse_logic = ScriptUnit.extension(unit, "navigation_system"):traverse_logic()
		template_data.next_leap_trajectory_check_t = 0
		template_data.leap_cooldown = 0
	end
}

template.update = function (template_data, template_context, dt, t)
	if not template_context.is_server then
		return
	end

	template_data.leap_cooldown = math.max(template_data.leap_cooldown - dt, 0)
	local unit = template_data.unit
	local perception_component = template_data.perception_component

	if template_data.leap_cooldown > 0 then
		if perception_component.target_changed then
			template_data.leap_cooldown = 0
		else
			return
		end
	end

	local behavior_component = template_data.behavior_component

	if not behavior_component.should_leap and behavior_component.move_state ~= "attacking" and template_data.next_leap_trajectory_check_t <= t then
		local target_position = POSITION_LOOKUP[perception_component.target_unit]

		if not target_position then
			return
		end

		local distance = perception_component.target_distance

		if distance < ChaosSpawnSettings.min_leap_distance or ChaosSpawnSettings.max_leap_distance < distance then
			return
		end

		local nav_world = template_context.nav_world
		local traverse_logic = template_data.traverse_logic
		target_position = NavQueries.position_on_mesh(nav_world, target_position, 1, 4, traverse_logic)

		if not target_position then
			return
		end

		local self_position = POSITION_LOOKUP[unit]
		local is_short_leap = distance <= ChaosSpawnSettings.short_leap_distance
		local towards_target_position = Vector3.normalize(target_position - self_position)
		local fwd_check_distance = is_short_leap and ChaosSpawnSettings.leap_short_fwd_check_distance or ChaosSpawnSettings.leap_fwd_check_distance
		local navmesh_position = self_position + towards_target_position * fwd_check_distance
		navmesh_position = NavQueries.position_on_mesh(nav_world, navmesh_position, 1, 4, traverse_logic)

		if not navmesh_position then
			return
		end

		local raycango = GwNavQueries.raycango(nav_world, self_position, navmesh_position, traverse_logic)

		if not raycango then
			template_data.next_leap_trajectory_check_t = t + LEAP_TRAJECTORY_CHECK_FREQUENCY

			return
		end

		local offset_target_position = target_position - towards_target_position * ChaosSpawnSettings.offset_in_front_of_target
		local offset_target_position_on_navmesh = NavQueries.position_on_mesh(nav_world, offset_target_position, 1, 4, traverse_logic)

		if not offset_target_position_on_navmesh then
			return
		end

		if not is_short_leap then
			local navmesh_to_offset_target_distance_sq = Vector3.distance_squared(navmesh_position, offset_target_position_on_navmesh)
			local min_leap_distance_sq = ChaosSpawnSettings.min_leap_distance * ChaosSpawnSettings.min_leap_distance

			if navmesh_to_offset_target_distance_sq < min_leap_distance_sq then
				return
			end
		end

		navmesh_position = navmesh_position + Vector3.up() * 0.5
		self_position = self_position + Vector3.up() * 0.5
		local to_navmesh_position = navmesh_position - self_position
		local direction = Vector3.normalize(to_navmesh_position)
		local ray_distance = Vector3.length(to_navmesh_position)
		local physics_world = template_context.physics_world
		local _, hit_position = PhysicsWorld.raycast(physics_world, self_position, direction, ray_distance, "closest", "collision_filter", LINE_OF_SIGHT_COLLISION_FILTER)

		if hit_position then
			return
		end

		local speed = ChaosSpawnSettings.leap_speed
		local gravity = ChaosSpawnSettings.leap_gravity
		local acceptable_accuracy = ChaosSpawnSettings.trajectory_acceptable_accuracy
		local angle_to_hit_target, est_pos = Trajectory.angle_to_hit_moving_target(navmesh_position, offset_target_position_on_navmesh, speed, Vector3(0, 0, 0), gravity, acceptable_accuracy)

		if not angle_to_hit_target then
			return
		end

		local _, time_in_flight = Trajectory.get_trajectory_velocity(navmesh_position, est_pos, gravity, speed, angle_to_hit_target)
		time_in_flight = math.min(time_in_flight, ChaosSpawnSettings.leap_max_time_in_flight)
		local debug = nil
		local num_sections = ChaosSpawnSettings.trajectory_num_sections
		local trajectory_collision_filter = ChaosSpawnSettings.trajectory_collision_filter
		local optional_extra_ray_check_down = Vector3(0, 0, 2)
		local optional_extra_ray_check_up = Vector3(0, 0, -0.3)
		local trajectory_is_ok = Trajectory.check_trajectory_collisions(physics_world, navmesh_position, est_pos, gravity, speed, angle_to_hit_target, num_sections, trajectory_collision_filter, time_in_flight, nil, debug, unit, optional_extra_ray_check_down, optional_extra_ray_check_up)

		if trajectory_is_ok then
			behavior_component.should_leap = true
			template_data.leap_cooldown = ChaosSpawnSettings.leap_cooldown
		end

		template_data.next_leap_trajectory_check_t = t + LEAP_TRAJECTORY_CHECK_FREQUENCY
	end
end

template.stop = function (template_data, template_context)
	return
end

return template
