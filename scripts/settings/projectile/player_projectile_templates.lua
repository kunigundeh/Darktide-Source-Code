local ArmorSettings = require("scripts/settings/damage/armor_settings")
local AttackingUnitResolver = require("scripts/utilities/attack/attacking_unit_resolver")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local DamageProfileTemplates = require("scripts/settings/damage/damage_profile_templates")
local DamageSettings = require("scripts/settings/damage/damage_settings")
local ExplosionTemplates = require("scripts/settings/damage/explosion_templates")
local LiquidAreaTemplates = require("scripts/settings/liquid_area/liquid_area_templates")
local ProjectileLocomotionTemplates = require("scripts/settings/projectile_locomotion/projectile_locomotion_templates")
local damage_types = DamageSettings.damage_types
local armor_types = ArmorSettings.types
local projectile_templates = {
	ogryn_gauntlet_grenade = {
		locomotion_template = ProjectileLocomotionTemplates.ogryn_gauntlet_grenade,
		damage = {
			fuse = {
				fuse_time = 0.75,
				explosion_template = ExplosionTemplates.default_gauntlet_grenade
			},
			impact = {
				damage_profile = DamageProfileTemplates.default_gauntlet_bfg,
				damage_type = damage_types.grenade_frag,
				explosion_template = ExplosionTemplates.default_gauntlet_grenade
			}
		},
		effects = {
			spawn = {
				vfx = {
					orphaned_policy = "destroy",
					link = true,
					particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
				},
				sfx = {
					looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
					looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
				}
			}
		}
	}
}

local function _ogryn_thumper_sticks_to_check(projectile_unit, hit_unit, hit_zone_name)
	local attacking_unit = AttackingUnitResolver.resolve(projectile_unit)
	local buff_extension = ScriptUnit.has_extension(attacking_unit, "buff_system")
	local has_keyword = buff_extension and buff_extension:has_keyword(BuffSettings.keywords.sticky_projectiles)

	return has_keyword
end

projectile_templates.ogryn_thumper_grenade_hip_fire = {
	locomotion_template = ProjectileLocomotionTemplates.ogryn_thumper_grenade,
	sticks_to_tags = {
		monster = true,
		ogryn = true
	},
	sticks_to_func = _ogryn_thumper_sticks_to_check,
	damage = {
		fuse = {
			min_lifetime = 0.5,
			fuse_time = 1.5,
			impact_triggered = true,
			explosion_template = ExplosionTemplates.ogryn_thumper_grenade_instant
		},
		impact = {
			first_impact_activated = true,
			damage_profile = DamageProfileTemplates.thumper_grenade_impact,
			damage_type = damage_types.ogryn_bullet_bounce,
			explosion_template = ExplosionTemplates.ogryn_thumper_grenade_instant,
			speed_to_charge_settings = {
				charge_min = 0,
				max_speed = 60,
				charge_max = 1
			}
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "stop",
				link = true,
				particle_name = "content/fx/particles/weapons/rifles/ogryn_thumper/ogryn_thumper_projectile_smoke_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
			}
		}
	}
}
projectile_templates.ogryn_thumper_grenade_aim = {
	locomotion_template = ProjectileLocomotionTemplates.ogryn_thumper_grenade_aimed,
	sticks_to_tags = {
		monster = true,
		ogryn = true
	},
	sticks_to_func = _ogryn_thumper_sticks_to_check,
	damage = {
		fuse = {
			min_lifetime = 0.5,
			fuse_time = 1.5,
			impact_triggered = true,
			explosion_template = ExplosionTemplates.ogryn_thumper_grenade_instant
		},
		impact = {
			first_impact_activated = true,
			damage_profile = DamageProfileTemplates.thumper_grenade_impact,
			damage_type = damage_types.ogryn_bullet_bounce,
			explosion_template = ExplosionTemplates.ogryn_thumper_grenade_instant
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "stop",
				link = true,
				particle_name = "content/fx/particles/weapons/rifles/ogryn_thumper/ogryn_thumper_projectile_smoke_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
			}
		}
	}
}
projectile_templates.ogryn_grenade_frag = {
	locomotion_template = ProjectileLocomotionTemplates.ogryn_frag_grenade,
	damage = {
		fuse = {
			fuse_time = 2,
			min_lifetime = 0.6,
			impact_fuse_time = 0.9,
			impact_triggered = true,
			explosion_template = ExplosionTemplates.ogryn_grenade_frag
		},
		impact = {
			damage_profile = DamageProfileTemplates.ogryn_grenade_impact,
			damage_type = damage_types.grenade_frag_ogryn
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "destroy",
				link = true,
				particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
			}
		}
	}
}
projectile_templates.frag_grenade = {
	locomotion_template = ProjectileLocomotionTemplates.grenade,
	damage = {
		fuse = {
			fuse_time = 1.7,
			explosion_template = ExplosionTemplates.frag_grenade
		},
		impact = {
			damage_profile = DamageProfileTemplates.frag_grenade_impact,
			damage_type = damage_types.grenade_frag
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "destroy",
				link = true,
				particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
			}
		}
	}
}
projectile_templates.fire_grenade = {
	locomotion_template = ProjectileLocomotionTemplates.grenade,
	damage = {
		fuse = {
			fuse_time = 1.7,
			explosion_template = ExplosionTemplates.fire_grenade,
			liquid_area_template = LiquidAreaTemplates.fire_grenade
		},
		impact = {
			damage_profile = DamageProfileTemplates.fire_grenade_impact,
			damage_type = damage_types.grenade_fire
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "destroy",
				link = true,
				particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
			}
		}
	}
}
projectile_templates.krak_grenade = {
	locomotion_template = ProjectileLocomotionTemplates.krak_grenade,
	sticks_to_armor_types = {
		[armor_types.resistant] = true,
		[armor_types.armored] = true,
		[armor_types.super_armor] = true
	},
	damage = {
		fuse = {
			fuse_time = 2,
			impact_triggered = true,
			max_lifetime = 2,
			sticky_fuse_time = 2,
			explosion_template = ExplosionTemplates.krak_grenade,
			default_explosion_normal = Vector3Box(0, 0, -1)
		},
		impact = {
			damage_profile = DamageProfileTemplates.krak_grenade_impact,
			damage_type = damage_types.grenade_krak
		}
	},
	split_settings = {
		split_angle = math.pi * 0.05
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "destroy",
				link = true,
				particle_name = "content/fx/particles/weapons/grenades/krak_grenade/krak_grenade_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
			}
		},
		target_aquired = {
			sfx = {
				event_name = "wwise/events/weapon/play_krak_detected"
			}
		},
		stick = {
			sfx = {
				event_name = "wwise/events/weapon/play_krak_stuck"
			}
		},
		build_up_start = {
			sfx = {
				event_name = "wwise/events/weapon/play_krak_build_up"
			}
		},
		build_up_stop = {
			sfx = {
				event_name = "wwise/events/weapon/stop_krak_build_up"
			}
		},
		fuse = {
			sfx = {
				event_name = "wwise/events/weapon/play_krak_build_up"
			}
		}
	}
}
projectile_templates.shock_grenade = {
	locomotion_template = ProjectileLocomotionTemplates.grenade,
	damage = {
		fuse = {
			fuse_time = 1.5,
			explosion_template = ExplosionTemplates.shock_grenade
		},
		impact = {
			damage_profile = DamageProfileTemplates.frag_grenade_impact,
			damage_type = damage_types.grenade_frag
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "destroy",
				link = true,
				particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
			}
		}
	}
}
projectile_templates.ogryn_grenade_box_cluster_grenade = {
	locomotion_template = ProjectileLocomotionTemplates.grenade,
	damage = {
		fuse = {
			fuse_time = 2,
			skip_reset = true,
			explosion_template = ExplosionTemplates.ogryn_box_cluster_frag
		},
		impact = {
			damage_profile = DamageProfileTemplates.frag_grenade_impact,
			damage_type = damage_types.grenade_frag_ogryn
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "destroy",
				link = true,
				particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
			}
		}
	}
}
projectile_templates.ogryn_grenade_box = {
	locomotion_template = ProjectileLocomotionTemplates.ogryn_grenade_box,
	damage = {
		fuse = {
			fuse_time = 2,
			impact_triggered = true
		},
		impact = {
			delete_on_impact = true,
			damage_profile = DamageProfileTemplates.ogryn_grenade_box_impact,
			damage_type = damage_types.ogryn_grenade_box
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "destroy",
				link = true,
				particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
			}
		}
	}
}
projectile_templates.ogryn_grenade_friend_rock = {
	play_vce = true,
	locomotion_template = ProjectileLocomotionTemplates.ogryn_friendly_rock,
	damage = {
		fuse = {
			fuse_time = 2,
			impact_triggered = true
		},
		impact = {
			delete_on_impact = true,
			damage_profile = DamageProfileTemplates.ogryn_friendly_rock_impact,
			damage_type = damage_types.ogryn_friend_rock
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "destroy",
				link = true,
				particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
			}
		}
	}
}
projectile_templates.zealot_throwing_knives = {
	play_vce = true,
	locomotion_template = ProjectileLocomotionTemplates.zealot_throwing_knife_projectile,
	sticks_to_armor_types = {},
	damage = {
		use_suppression = true,
		impact = {
			delete_on_impact = true,
			delete_on_hit_mass = true,
			damage_profile = DamageProfileTemplates.zealot_throwing_knives,
			damage_type = damage_types.throwing_knife_zealot,
			suppression_settings = {
				suppression_falloff = true,
				instant_aggro = true,
				distance = 5,
				suppression_value = 5
			}
		},
		fuse = {
			fuse_time = 1.5
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "stop",
				link = true,
				particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_zealot_throw_knife_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_zealot_throw_knife_loop"
			}
		}
	}
}
projectile_templates.psyker_throwing_knives = {
	psyker_smite = true,
	play_vce = true,
	locomotion_template = ProjectileLocomotionTemplates.psyker_throwing_knife_projectile,
	sticks_to_armor_types = {},
	damage = {
		use_suppression = true,
		impact = {
			delete_on_hit_mass = true,
			damage_profile = DamageProfileTemplates.psyker_throwing_knives,
			damage_type = damage_types.throwing_knife,
			suppression_settings = {
				suppression_falloff = true,
				instant_aggro = true,
				distance = 5,
				suppression_value = 5
			}
		},
		fuse = {
			fuse_time = 1.5,
			kill_at_lifetime = 2.5,
			impact_triggered = true,
			skip_reset = true
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "stop",
				link = true,
				particle_name = "content/fx/particles/abilities/psyker_throwing_knife_trail",
				particle_name_critical_strike = "content/fx/particles/abilities/psyker_throwing_knife_trail_critical_strike"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_throw_knife_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_throw_knife_loop"
			}
		}
	},
	unit_rotation_offset = QuaternionBox(0.5, 0, 0, -0.5)
}
projectile_templates.psyker_throwing_knives_piercing = table.clone_instance(projectile_templates.psyker_throwing_knives)
projectile_templates.psyker_throwing_knives_piercing.damage.impact.damage_profile = DamageProfileTemplates.psyker_throwing_knives_pierce
projectile_templates.psyker_throwing_knives_aimed = table.clone_instance(projectile_templates.psyker_throwing_knives)
projectile_templates.psyker_throwing_knives_aimed.damage.fuse.kill_at_lifetime = 3
projectile_templates.psyker_throwing_knives_aimed.damage.impact.damage_profile = DamageProfileTemplates.psyker_throwing_knives_aimed
projectile_templates.psyker_throwing_knives_aimed.locomotion_template = ProjectileLocomotionTemplates.psyker_throwing_knife_projectile_aimed
projectile_templates.psyker_throwing_knives_aimed_piercing = table.clone_instance(projectile_templates.psyker_throwing_knives)
projectile_templates.psyker_throwing_knives_aimed_piercing.damage.fuse.kill_at_lifetime = 3.5
projectile_templates.psyker_throwing_knives_aimed_piercing.damage.impact.damage_profile = DamageProfileTemplates.psyker_throwing_knives_aimed_pierce
projectile_templates.psyker_throwing_knives_aimed_piercing.locomotion_template = ProjectileLocomotionTemplates.psyker_throwing_knife_projectile_aimed
projectile_templates.force_staff_ball = {
	always_hidden = true,
	locomotion_template = ProjectileLocomotionTemplates.force_staff_ball,
	sticks_to_armor_types = {},
	damage = {
		use_suppression = true,
		impact = {
			delete_on_impact = true,
			delete_on_hit_mass = true,
			damage_profile = DamageProfileTemplates.force_staff_ball,
			damage_type = damage_types.force_staff_single_target,
			suppression_settings = {
				suppression_falloff = true,
				instant_aggro = true,
				distance = 5,
				suppression_value = 5
			}
		},
		fuse = {
			fuse_time = 5
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "destroy",
				link = true,
				particle_name = "content/fx/particles/abilities/psyker_smite_projectile_01"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_psyker_smite_fire_projectile",
				looping_stop_event_name = "wwise/events/weapon/stop_psyker_smite_fire_projectile"
			}
		}
	}
}
projectile_templates.force_staff_ball_heavy = {
	always_hidden = true,
	locomotion_template = ProjectileLocomotionTemplates.force_staff_ball_heavy,
	sticks_to_armor_types = {},
	damage = {
		impact = {
			delete_on_hit_mass = true,
			damage_profile = DamageProfileTemplates.default_force_staff_bfg,
			damage_type = damage_types.force_staff_bfg,
			suppression_settings = {
				suppression_falloff = true,
				instant_aggro = true,
				distance = 5,
				suppression_value = 5
			},
			explosion_template = ExplosionTemplates.force_staff_p4_demolition
		},
		fuse = {
			fuse_time = 2
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "destroy",
				link = true,
				use_charge_level = true,
				min_charge_level = 0.35,
				particle_name = "content/fx/particles/weapons/bfg_staff/psyker_bfg_projectile_01"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_psyker_smite_fire_projectile",
				looping_stop_event_name = "wwise/events/weapon/stop_psyker_smite_fire_projectile"
			}
		}
	}
}
projectile_templates.smoke_grenade = {
	locomotion_template = ProjectileLocomotionTemplates.grenade,
	damage = {
		fuse = {
			fuse_time = 1.5,
			explosion_template = ExplosionTemplates.smoke_grenade,
			spawn_unit = {
				unit_name = "content/characters/player/human/attachments_combat/smoke_fog/smoke_fog_volume",
				unit_template = "smoke_fog",
				unit_template_parameters = {
					outer_radius = 5.5,
					in_fog_buff_template_name = "in_smoke_fog",
					leaving_fog_buff_template_name = "left_smoke_fog",
					block_line_of_sight = true,
					duration = 15,
					inner_radius = 4.5
				}
			}
		},
		impact = {
			damage_profile = DamageProfileTemplates.frag_grenade_impact,
			damage_type = damage_types.grenade_frag
		}
	},
	split_settings = {
		split_angle = math.pi * 0.1
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "stop",
				link = true,
				particle_name = "content/fx/particles/weapons/grenades/smoke_grenade/smoke_grenade_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_grenade_projectile_loop_smoke",
				looping_stop_event_name = "wwise/events/weapon/stop_grenade_projectile_loop_smoke"
			}
		}
	}
}
projectile_templates.ogryn_grenade_box_cluster = {
	locomotion_template = ProjectileLocomotionTemplates.ogryn_grenade_box,
	damage = {
		fuse = {
			fuse_time = 2,
			impact_triggered = true
		},
		impact = {
			delete_on_impact = true,
			delete_on_hit_mass = true,
			damage_profile = DamageProfileTemplates.ogryn_grenade_box_cluster_impact,
			damage_type = damage_types.ogryn_grenade_box,
			cluster = {
				item = "content/items/weapons/player/grenade_frag",
				start_fuse_time = 0.8,
				number = 6,
				fuse_time_steps = {
					max = 0.5,
					min = 0.3
				},
				start_speed = {
					max = 8,
					min = 6
				},
				randomized_angular_velocity = math.pi / 10,
				projectile_template = projectile_templates.ogryn_grenade_box_cluster_grenade
			}
		}
	},
	effects = {
		spawn = {
			vfx = {
				orphaned_policy = "destroy",
				link = true,
				particle_name = "content/fx/particles/weapons/grenades/grenade_trail"
			},
			sfx = {
				looping_event_name = "wwise/events/weapon/play_player_combat_weapon_grenader_loop",
				looping_stop_event_name = "wwise/events/weapon/stop_player_combat_weapon_grenader_loop"
			}
		}
	}
}
projectile_templates.luggable = {
	locomotion_template = ProjectileLocomotionTemplates.luggable_battery,
	damage = {
		impact = {
			damage_profile = DamageProfileTemplates.luggable_battery
		}
	}
}

return projectile_templates
