local BaseWeaponTraitBuffTemplates = require("scripts/settings/buff/weapon_traits_buff_templates/base_weapon_trait_buff_templates")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local CheckProcFunctions = require("scripts/settings/buff/validation_functions/check_proc_functions")
local ConditionalFunctions = require("scripts/settings/buff/validation_functions/conditional_functions")
local Suppression = require("scripts/utilities/attack/suppression")
local keywords = BuffSettings.keywords
local stat_buffs = BuffSettings.stat_buffs
local proc_events = BuffSettings.proc_events
local templates = {
	weapon_trait_bespoke_laspistol_p1_hipfire_while_sprinting = table.clone(BaseWeaponTraitBuffTemplates.hipfire_while_sprinting),
	weapon_trait_bespoke_laspistol_p1_reload_speed_on_slide = table.clone(BaseWeaponTraitBuffTemplates.reload_speed_on_close_kill),
	weapon_trait_bespoke_laspistol_p1_reload_speed_on_slide_parent = table.clone(BaseWeaponTraitBuffTemplates.reload_speed_on_melee_kill_parent),
	weapon_trait_bespoke_laspistol_p1_reload_speed_on_slide_child = table.clone(BaseWeaponTraitBuffTemplates.reload_speed_on_melee_kill_child)
}
templates.weapon_trait_bespoke_laspistol_p1_reload_speed_on_slide_parent.child_buff_template = "weapon_trait_bespoke_laspistol_p1_reload_speed_on_slide_child"
templates.weapon_trait_bespoke_laspistol_p1_burninating_on_crit = table.clone(BaseWeaponTraitBuffTemplates.burninating_on_crit_ranged)
templates.weapon_trait_bespoke_laspistol_p1_allow_flanking_and_increased_damage_when_flanking = table.clone(BaseWeaponTraitBuffTemplates.allow_flanking_and_increased_damage_when_flanking)
templates.weapon_trait_bespoke_laspistol_p1_suppression_negation_on_weakspot = table.clone(BaseWeaponTraitBuffTemplates.suppression_negation_on_weakspot)
templates.weapon_trait_bespoke_laspistol_p1_count_as_dodge_vs_ranged_on_weakspot = table.clone(BaseWeaponTraitBuffTemplates.count_as_dodge_vs_ranged_on_weakspot)
templates.weapon_trait_bespoke_laspistol_p1_consecutive_hits_increases_close_damage_parent = table.clone(BaseWeaponTraitBuffTemplates.consecutive_hits_increases_close_damage_parent)
templates.weapon_trait_bespoke_laspistol_p1_consecutive_hits_increases_close_damage_child = table.clone(BaseWeaponTraitBuffTemplates.consecutive_hits_increases_close_damage_child)
templates.weapon_trait_bespoke_laspistol_p1_consecutive_hits_increases_close_damage_parent.child_buff_template = "weapon_trait_bespoke_laspistol_p1_consecutive_hits_increases_close_damage_child"
templates.weapon_trait_bespoke_laspistol_p1_toughness_on_crit_kills = table.clone(BaseWeaponTraitBuffTemplates.toughness_on_crit_kills)
templates.weapon_trait_bespoke_laspistol_p1_dodge_grants_critical_strike_chance = table.clone(BaseWeaponTraitBuffTemplates.dodge_grants_critical_strike_chance)
templates.weapon_trait_bespoke_laspistol_p1_chained_weakspot_hits_increases_crit_chance_parent = table.clone(BaseWeaponTraitBuffTemplates.chained_weakspot_hits_increases_crit_chance_ranged_parent)
templates.weapon_trait_bespoke_laspistol_p1_chained_weakspot_hits_increases_crit_chance_parent.child_buff_template = "weapon_trait_bespoke_laspistol_p1_chained_weakspot_hits_increases_crit_chance_child"
templates.weapon_trait_bespoke_laspistol_p1_chained_weakspot_hits_increases_crit_chance_child = table.clone(BaseWeaponTraitBuffTemplates.chained_weakspot_hits_increases_crit_chance_child)

return templates
