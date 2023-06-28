local BuffSettings = require("scripts/settings/buff/buff_settings")
local WeaponTweakTemplateSettings = require("scripts/settings/equipment/weapon_templates/weapon_tweak_template_settings")
local templates = {}

function _degrees_to_radians(degrees)
	return degrees * 0.0174532925
end

local stat_buffs = BuffSettings.stat_buffs
local proc_events = BuffSettings.proc_events
templates.weapon_trait_bespoke_autopistol_p1_stacking_crit_bonus_on_continuous_fire = {
	weapon_trait_bespoke_autopistol_p1_stacking_crit_bonus_on_continuous_fire = {
		{
			stat_buffs = {
				[stat_buffs.critical_strike_chance] = 0.02
			}
		},
		{
			stat_buffs = {
				[stat_buffs.critical_strike_chance] = 0.03
			}
		},
		{
			stat_buffs = {
				[stat_buffs.critical_strike_chance] = 0.04
			}
		},
		{
			stat_buffs = {
				[stat_buffs.critical_strike_chance] = 0.05
			}
		}
	}
}
templates.weapon_trait_bespoke_autopistol_p1_toughness_on_continuous_fire = {
	weapon_trait_bespoke_autopistol_p1_toughness_on_continuous_fire = {
		{
			toughness_fixed_percentage = 0.04
		}
	}
}
templates.weapon_trait_bespoke_autopistol_p1_power_bonus_on_continuous_fire = {
	weapon_trait_bespoke_autopistol_p1_power_bonus_on_continuous_fire = {
		{
			stat_buffs = {
				[stat_buffs.power_level_modifier] = 0.1
			}
		}
	}
}
templates.weapon_trait_bespoke_autopistol_p1_reload_speed_on_slide = {
	weapon_trait_bespoke_autopistol_p1_reload_speed_on_slide = {
		{
			active_duration = 2,
			stat_buffs = {
				[stat_buffs.reload_speed] = 0.14
			}
		},
		{
			active_duration = 2,
			stat_buffs = {
				[stat_buffs.reload_speed] = 0.16
			}
		},
		{
			active_duration = 2,
			stat_buffs = {
				[stat_buffs.reload_speed] = 0.18
			}
		},
		{
			active_duration = 2,
			stat_buffs = {
				[stat_buffs.reload_speed] = 0.2
			}
		}
	}
}
templates.weapon_trait_bespoke_autopistol_p1_suppression_on_close_kill = {
	weapon_trait_bespoke_autopistol_p1_suppression_on_close_kill = {
		{
			suppression_settings = {
				suppression_falloff = true,
				instant_aggro = true,
				distance = 5,
				suppression_value = 10
			}
		},
		{
			suppression_settings = {
				suppression_falloff = true,
				instant_aggro = true,
				distance = 6,
				suppression_value = 15
			}
		},
		{
			suppression_settings = {
				suppression_falloff = true,
				instant_aggro = true,
				distance = 7,
				suppression_value = 20
			}
		},
		{
			suppression_settings = {
				suppression_falloff = true,
				instant_aggro = true,
				distance = 8,
				suppression_value = 25
			}
		}
	}
}
templates.weapon_trait_bespoke_autopistol_p1_allow_flanking_and_increased_damage_when_flanking = {
	weapon_trait_bespoke_autopistol_p1_allow_flanking_and_increased_damage_when_flanking = {
		{
			stat_buffs = {
				[stat_buffs.flanking_damage] = 0.15
			}
		},
		{
			stat_buffs = {
				[stat_buffs.flanking_damage] = 0.2
			}
		},
		{
			stat_buffs = {
				[stat_buffs.flanking_damage] = 0.25
			}
		},
		{
			stat_buffs = {
				[stat_buffs.flanking_damage] = 0.3
			}
		}
	}
}
templates.weapon_trait_bespoke_autopistol_p1_followup_shots_ranged_damage = {
	weapon_trait_bespoke_autopistol_p1_followup_shots_ranged_damage = {
		{
			conditional_stat_buffs = {
				[stat_buffs.ranged_damage] = 0.06
			}
		},
		{
			conditional_stat_buffs = {
				[stat_buffs.ranged_damage] = 0.09
			}
		},
		{
			conditional_stat_buffs = {
				[stat_buffs.ranged_damage] = 0.12
			}
		},
		{
			conditional_stat_buffs = {
				[stat_buffs.ranged_damage] = 0.15
			}
		}
	}
}
templates.weapon_trait_bespoke_autopistol_p1_recoil_reduction_and_suppression_increase_on_close_kills = {
	weapon_trait_bespoke_autopistol_p1_recoil_reduction_and_suppression_increase_on_close_kills = {
		{
			proc_stat_buffs = {
				[stat_buffs.recoil_modifier] = -0.05,
				[stat_buffs.suppression_dealt] = 0.05
			}
		},
		{
			proc_stat_buffs = {
				[stat_buffs.recoil_modifier] = -0.1,
				[stat_buffs.suppression_dealt] = 0.1
			}
		},
		{
			proc_stat_buffs = {
				[stat_buffs.recoil_modifier] = -0.15,
				[stat_buffs.suppression_dealt] = 0.15
			}
		},
		{
			proc_stat_buffs = {
				[stat_buffs.recoil_modifier] = -0.2,
				[stat_buffs.suppression_dealt] = 0.2
			}
		}
	}
}
templates.weapon_trait_bespoke_autopistol_p1_stacking_power_bonus_on_staggering_enemies = {
	weapon_trait_bespoke_autopistol_p1_stacking_power_bonus_on_staggering_enemies_parent = {
		{
			max_stacks = 5,
			stat_buffs = {
				[stat_buffs.power_level_modifier] = 0.05
			}
		},
		{
			max_stacks = 5,
			stat_buffs = {
				[stat_buffs.power_level_modifier] = 0.1
			}
		},
		{
			max_stacks = 5,
			stat_buffs = {
				[stat_buffs.power_level_modifier] = 0.15
			}
		},
		{
			max_stacks = 5,
			stat_buffs = {
				[stat_buffs.power_level_modifier] = 0.2
			}
		}
	}
}

return templates
