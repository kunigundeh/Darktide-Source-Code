local PARTICLE_2_NAME = "content/fx/particles/enemies/red_glowing_eyes"
local PARTICLE_2_NODE = "j_lefteye"
local PARTICLE_3_NAME = "content/fx/particles/enemies/red_glowing_eyes"
local PARTICLE_3_NODE = "j_righteye"
local resources = {
	eye_vfx = PARTICLE_2_NAME
}
local effect_template = {
	name = "glowing_eyes",
	resources = resources,
	start = function (template_data, template_context)
		template_data.next_trigger_t = 0
		local world = template_context.world
		local unit = template_data.unit
		local unit_position = POSITION_LOOKUP[unit]
		local node_2 = Unit.has_node(unit, PARTICLE_2_NODE) and Unit.node(unit, PARTICLE_2_NODE)

		if node_2 then
			local particle_2_id = World.create_particles(world, PARTICLE_2_NAME, unit_position)
			template_data.particle_2_id = particle_2_id

			World.link_particles(world, particle_2_id, unit, node_2, Matrix4x4.identity(), "stop")
		end

		local node_3 = Unit.has_node(unit, PARTICLE_3_NODE) and Unit.node(unit, PARTICLE_3_NODE)

		if node_3 then
			local particle_3_id = World.create_particles(world, PARTICLE_3_NAME, unit_position)
			template_data.particle_3_id = particle_3_id

			World.link_particles(world, particle_3_id, unit, node_3, Matrix4x4.identity(), "stop")
		end
	end,
	update = function (template_data, template_context, dt, t)
		return
	end,
	stop = function (template_data, template_context)
		local world = template_context.world
		local vfx_particle_2_id = template_data.particle_2_id

		if vfx_particle_2_id then
			World.stop_spawning_particles(world, vfx_particle_2_id)
		end

		local vfx_particle_3_id = template_data.particle_3_id

		if vfx_particle_3_id then
			World.stop_spawning_particles(world, vfx_particle_3_id)
		end
	end
}

return effect_template