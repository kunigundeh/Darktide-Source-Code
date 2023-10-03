local BaseInteraction = require("scripts/extension_systems/interaction/interactions/base_interaction")
local PickupInteraction = require("scripts/extension_systems/interaction/interactions/pickup_interaction")
local AmmunitionInteraction = require("scripts/extension_systems/interaction/interactions/ammunition_interaction")
local AssistBaseInteraction = require("scripts/extension_systems/interaction/interactions/assist_base_interaction")
local ChestInteraction = require("scripts/extension_systems/interaction/interactions/chest_interaction")
local DecodingInteraction = require("scripts/extension_systems/interaction/interactions/decoding_interaction")
local DoorControlPanelInteraction = require("scripts/extension_systems/interaction/interactions/door_control_panel_interaction")
local GrenadeInteraction = require("scripts/extension_systems/interaction/interactions/grenade_interaction")
local HealthInteraction = require("scripts/extension_systems/interaction/interactions/health_interaction")
local HealthStationInteraction = require("scripts/extension_systems/interaction/interactions/health_station_interaction")
local LuggableInteraction = require("scripts/extension_systems/interaction/interactions/luggable_interaction")
local LuggableSocketInteraction = require("scripts/extension_systems/interaction/interactions/luggable_socket_interaction")
local MoveablePlatformInteraction = require("scripts/extension_systems/interaction/interactions/moveable_platform_interaction")
local PocketableInteraction = require("scripts/extension_systems/interaction/interactions/pocketable_interaction")
local PullUpInteraction = require("scripts/extension_systems/interaction/interactions/pull_up_interaction")
local RemoveNetInteraction = require("scripts/extension_systems/interaction/interactions/remove_net_interaction")
local RescueInteraction = require("scripts/extension_systems/interaction/interactions/rescue_interaction")
local ReviveInteraction = require("scripts/extension_systems/interaction/interactions/revive_interaction")
local ScanningInteraction = require("scripts/extension_systems/interaction/interactions/scanning_interaction")
local ScriptedScenarioInteraction = require("scripts/extension_systems/interaction/interactions/scripted_scenario_interaction")
local ServoSkullActivatorInteraction = require("scripts/extension_systems/interaction/interactions/servo_skull_activator_interaction")
local ServoSkullInteraction = require("scripts/extension_systems/interaction/interactions/servo_skull_interaction")
local SetupDecodingInteraction = require("scripts/extension_systems/interaction/interactions/setup_decoding_interaction")
local ViewInteraction = require("scripts/extension_systems/interaction/interactions/view_interaction")
local interactions = {
	ammunition = AmmunitionInteraction,
	assist_base = AssistBaseInteraction,
	base = BaseInteraction,
	body_shop = ViewInteraction,
	chest = ChestInteraction,
	contracts = ViewInteraction,
	crafting = ViewInteraction,
	decoding = DecodingInteraction,
	door_control_panel = DoorControlPanelInteraction,
	grenade = GrenadeInteraction,
	health = HealthInteraction,
	health_station = HealthStationInteraction,
	inbox = ViewInteraction,
	luggable = LuggableInteraction,
	luggable_socket = LuggableSocketInteraction,
	marks_vendor = ViewInteraction,
	mission_board = ViewInteraction,
	moveable_platform = MoveablePlatformInteraction,
	penances = ViewInteraction,
	pickup = PickupInteraction,
	pocketable = PocketableInteraction,
	premium_vendor = ViewInteraction,
	pull_up = PullUpInteraction,
	remove_net = RemoveNetInteraction,
	rescue = RescueInteraction,
	revive = ReviveInteraction,
	scanning = ScanningInteraction,
	servo_skull = ServoSkullInteraction,
	servo_skull_activator = ServoSkullActivatorInteraction,
	setup_decoding = SetupDecodingInteraction,
	training_ground = ViewInteraction,
	vendor = ViewInteraction,
	scripted_scenario = ScriptedScenarioInteraction,
	cosmetics_vendor = ViewInteraction
}

return settings("Interactions", interactions)
