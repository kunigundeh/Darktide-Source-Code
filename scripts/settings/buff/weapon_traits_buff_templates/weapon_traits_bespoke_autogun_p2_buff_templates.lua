local BaseWeaponTraitBuffTemplates = require("scripts/settings/buff/weapon_traits_buff_templates/base_weapon_trait_buff_templates")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local CheckProcFunctions = require("scripts/settings/buff/validation_functions/check_proc_functions")
local ConditionalFunctions = require("scripts/settings/buff/validation_functions/conditional_functions")
local FireStepFunctions = require("scripts/settings/buff/fire_step_functions")
local keywords = BuffSettings.keywords
local stat_buffs = BuffSettings.stat_buffs
local proc_events = BuffSettings.proc_events
local templates = {
	weapon_trait_bespoke_autogun_p2_increase_power_on_close_kill_parent = table.clone(BaseWeaponTraitBuffTemplates.increase_power_on_close_kill_parent),
	weapon_trait_bespoke_autogun_p2_increase_power_on_close_kill_child = table.clone(BaseWeaponTraitBuffTemplates.increase_power_on_close_kill_child)
}
templates.weapon_trait_bespoke_autogun_p2_increase_power_on_close_kill_parent.child_buff_template = "weapon_trait_bespoke_autogun_p2_increase_power_on_close_kill_child"
templates.weapon_trait_bespoke_autogun_p2_increase_close_damage_on_close_kill_parent = table.clone(BaseWeaponTraitBuffTemplates.increase_close_damage_on_close_kill_parent)
templates.weapon_trait_bespoke_autogun_p2_increase_close_damage_on_close_kill_child = table.clone(BaseWeaponTraitBuffTemplates.increase_close_damage_on_close_kill_child)
templates.weapon_trait_bespoke_autogun_p2_increase_close_damage_on_close_kill_parent.child_buff_template = "weapon_trait_bespoke_autogun_p2_increase_close_damage_on_close_kill_child"
templates.weapon_trait_bespoke_autogun_p2_count_as_dodge_vs_ranged_on_close_kill = table.clone(BaseWeaponTraitBuffTemplates.count_as_dodge_vs_ranged_on_close_kill)
templates.weapon_trait_bespoke_autogun_p2_suppression_on_close_kill = table.clone(BaseWeaponTraitBuffTemplates.suppression_on_close_kill)
templates.weapon_trait_bespoke_autogun_p2_reload_speed_on_slide_parent = table.clone(BaseWeaponTraitBuffTemplates.reload_speed_on_close_kill_parent)
templates.weapon_trait_bespoke_autogun_p2_reload_speed_on_slide_child = table.clone(BaseWeaponTraitBuffTemplates.reload_speed_on_close_kill_child)
templates.weapon_trait_bespoke_autogun_p2_reload_speed_on_slide_parent.child_buff_template = "weapon_trait_bespoke_autogun_p2_reload_speed_on_slide_child"
templates.weapon_trait_bespoke_autogun_p2_increased_sprint_speed = table.clone(BaseWeaponTraitBuffTemplates.count_as_dodge_vs_ranged_while_sprinting)
templates.weapon_trait_bespoke_autogun_p2_increased_suppression_on_continuous_fire = table.merge({
	conditional_stat_buffs = {
		[stat_buffs.suppression_dealt] = 0.5,
		[stat_buffs.damage_vs_suppressed] = 0.06
	},
	continuous_fire_step_func = FireStepFunctions.suppression_continuous_fire_step_func
}, BaseWeaponTraitBuffTemplates.stacking_buff_on_continuous_fire)
templates.weapon_trait_bespoke_autogun_p2_movement_speed_on_continous_fire = table.merge({
	conditional_stat_buffs = {
		[stat_buffs.alternate_fire_movement_speed_reduction_modifier] = 0.5,
		[stat_buffs.weapon_action_movespeed_reduction_multiplier] = 0.5
	},
	continuous_fire_step_func = FireStepFunctions.movement_speed_continuous_fire_step_func
}, BaseWeaponTraitBuffTemplates.stacking_buff_on_continuous_fire)
templates.weapon_trait_bespoke_autogun_p2_toughness_on_continuous_fire = table.merge({
	toughness_fixed_percentage = 0.1,
	continuous_fire_step_func = FireStepFunctions.toughness_regen_continuous_fire_step_func
}, BaseWeaponTraitBuffTemplates.toughness_on_continuous_fire)

return templates
