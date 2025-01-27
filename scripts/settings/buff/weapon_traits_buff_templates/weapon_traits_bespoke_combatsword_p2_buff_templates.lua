local Ammo = require("scripts/utilities/ammo")
local AttackSettings = require("scripts/settings/damage/attack_settings")
local BaseWeaponTraitBuffTemplates = require("scripts/settings/buff/weapon_traits_buff_templates/base_weapon_trait_buff_templates")
local BuffSettings = require("scripts/settings/buff/buff_settings")
local BuffUtils = require("scripts/settings/buff/buff_utils")
local CheckProcFunctions = require("scripts/settings/buff/validation_functions/check_proc_functions")
local ConditionalFunctions = require("scripts/settings/buff/validation_functions/conditional_functions")
local DamageSettings = require("scripts/settings/damage/damage_settings")
local FixedFrame = require("scripts/utilities/fixed_frame")
local Health = require("scripts/utilities/health")
local PlayerUnitAction = require("scripts/extension_systems/visual_loadout/utilities/player_unit_action")
local PlayerUnitStatus = require("scripts/utilities/attack/player_unit_status")
local ReloadStates = require("scripts/extension_systems/weapon/utilities/reload_states")
local Sprint = require("scripts/extension_systems/character_state_machine/character_states/utilities/sprint")
local Suppression = require("scripts/utilities/attack/suppression")
local Toughness = require("scripts/utilities/toughness/toughness")
local ToughnessSettings = require("scripts/settings/toughness/toughness_settings")
local WarpCharge = require("scripts/utilities/warp_charge")
local attack_results = AttackSettings.attack_results
local attack_types = AttackSettings.attack_types
local damage_types = DamageSettings.damage_types
local keywords = BuffSettings.keywords
local stat_buffs = BuffSettings.stat_buffs
local proc_events = BuffSettings.proc_events
local replenish_types = ToughnessSettings.replenish_types
local templates = {
	weapon_trait_bespoke_combatsword_p2_increased_attack_cleave_on_multiple_hits = table.clone(BaseWeaponTraitBuffTemplates.increased_attack_cleave_on_multiple_hits),
	weapon_trait_bespoke_combatsword_p2_increased_melee_damage_on_multiple_hits = table.clone(BaseWeaponTraitBuffTemplates.increased_melee_damage_on_multiple_hits),
	weapon_trait_bespoke_combatsword_p2_chained_hits_increases_melee_cleave_parent = table.clone(BaseWeaponTraitBuffTemplates.chained_hits_increases_melee_cleave_parent)
}
templates.weapon_trait_bespoke_combatsword_p2_chained_hits_increases_melee_cleave_parent.child_buff_template = "weapon_trait_bespoke_combatsword_p2_chained_hits_increases_melee_cleave_child"
templates.weapon_trait_bespoke_combatsword_p2_chained_hits_increases_melee_cleave_child = table.clone(BaseWeaponTraitBuffTemplates.chained_hits_increases_melee_cleave_child)
templates.weapon_trait_bespoke_combatsword_p2_increase_power_on_hit_parent = table.clone(BaseWeaponTraitBuffTemplates.increase_power_on_hit_parent)
templates.weapon_trait_bespoke_combatsword_p2_increase_power_on_hit_parent.child_buff_template = "weapon_trait_bespoke_combatsword_p2_increase_power_on_hit_child"
templates.weapon_trait_bespoke_combatsword_p2_increase_power_on_hit_child = table.clone(BaseWeaponTraitBuffTemplates.increase_power_on_hit_child)
templates.weapon_trait_bespoke_combatsword_p2_infinite_melee_cleave_on_weakspot_kill = table.clone(BaseWeaponTraitBuffTemplates.infinite_melee_cleave_on_weakspot_kill)
templates.weapon_trait_bespoke_combatsword_p2_pass_past_armor_on_crit = table.clone(BaseWeaponTraitBuffTemplates.pass_past_armor_on_crit)
templates.weapon_trait_bespoke_combatsword_p2_rending_on_multiple_hits_parent = table.clone(BaseWeaponTraitBuffTemplates.rending_on_multiple_hits_parent)
templates.weapon_trait_bespoke_combatsword_p2_rending_on_multiple_hits_parent.child_buff_template = "weapon_trait_bespoke_combatsword_p2_rending_on_multiple_hits_child"
templates.weapon_trait_bespoke_combatsword_p2_rending_on_multiple_hits_child = table.clone(BaseWeaponTraitBuffTemplates.rending_on_multiple_hits_child)
templates.weapon_trait_bespoke_combatsword_p2_windup_increases_power_parent = table.clone(BaseWeaponTraitBuffTemplates.windup_increases_power_parent)
templates.weapon_trait_bespoke_combatsword_p2_windup_increases_power_parent.child_buff_template = "weapon_trait_bespoke_combatsword_p2_windup_increases_power_child"
templates.weapon_trait_bespoke_combatsword_p2_windup_increases_power_child = table.clone(BaseWeaponTraitBuffTemplates.windup_increases_power_child)
templates.weapon_trait_bespoke_combatsword_p2_increased_crit_chance_on_weakspot_kill = {
	allow_proc_while_active = true,
	predicted = false,
	class_name = "proc_buff",
	active_duration = 3,
	proc_events = {
		[proc_events.on_kill] = 1
	},
	proc_stat_buffs = {
		[stat_buffs.melee_critical_strike_chance] = 0.1
	},
	conditional_proc_func = ConditionalFunctions.is_item_slot_wielded,
	check_proc_func = CheckProcFunctions.on_weakspot_kill
}

return templates
