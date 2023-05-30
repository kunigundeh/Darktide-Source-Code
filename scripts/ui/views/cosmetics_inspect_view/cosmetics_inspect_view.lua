local ContentBlueprints = require("scripts/ui/views/inventory_view/inventory_view_content_blueprints")
local Definitions = require("scripts/ui/views/cosmetics_inspect_view/cosmetics_inspect_view_definitions")
local CosmeticsInspectViewSettings = require("scripts/ui/views/cosmetics_inspect_view/cosmetics_inspect_view_settings")
local ItemSlotSettings = require("scripts/settings/item/item_slot_settings")
local ItemUtils = require("scripts/utilities/items")
local ScriptCamera = require("scripts/foundation/utilities/script_camera")
local ScriptWorld = require("scripts/foundation/utilities/script_world")
local UIFonts = require("scripts/managers/ui/ui_fonts")
local UIProfileSpawner = require("scripts/managers/ui/ui_profile_spawner")
local UIRenderer = require("scripts/managers/ui/ui_renderer")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")
local UIWidget = require("scripts/managers/ui/ui_widget")
local UIWidgetGrid = require("scripts/ui/widget_logic/ui_widget_grid")
local UIWorldSpawner = require("scripts/managers/ui/ui_world_spawner")
local ViewElementInputLegend = require("scripts/ui/view_elements/view_element_input_legend/view_element_input_legend")
local ViewElementPlayerPanel = require("scripts/ui/view_elements/view_element_player_panel/view_element_player_panel")
local MasterItems = require("scripts/backend/master_items")
local ItemGridViewBase = require("scripts/ui/views/item_grid_view_base/item_grid_view_base")
local UISettings = require("scripts/settings/ui/ui_settings")
local CosmeticsInspectView = class("CosmeticsInspectView", "BaseView")

CosmeticsInspectView.init = function (self, settings, context)
	self._context = context
	local is_in_debug = context.debug

	if not is_in_debug then
		local item = context.preview_item
		item = item and (item.gear and MasterItems.create_preview_item_instance(item) or table.clone_instance(item))
		self._preview_item = item
		local use_store_appearance = context.use_store_appearance

		if use_store_appearance then
			self:_apply_store_appearance()
		else
			self:_apply_default_appearance()
		end

		local slots = self._preview_item and self._preview_item.slots
		local slot_name = context.slot_name or slots and slots[1]
		self._selected_slot = slot_name and ItemSlotSettings[slot_name]
		self._initial_rotation = context.initial_rotation
		self._disable_rotation_input = context.disable_rotation_input
		self._animation_event_name_suffix = context.animation_event_name_suffix
		self._animation_event_variable_data = context.animation_event_variable_data
		self._disable_zoom = context.disable_zoom
		local profile = context.debug and Managers.player:local_player(1):profile() or context.profile
		self._preview_profile = profile
		self._gear_profile = context.debug and {} or table.clone_instance(profile)
		self._gear_profile.character_id = "cosmetics_view_preview_character"
		local loadout = context.debug and {
			slot_insignia = UISettings.insignia_default_texture
		} or self._gear_profile.loadout
		self._gear_profile.loadout = loadout

		if self._preview_item then
			loadout[slot_name] = self._preview_item
		end

		self._mannequin_loadout = self:_generate_mannequin_loadout(self._gear_profile, self._preview_item)

		if self._preview_item then
			self._mannequin_loadout[slot_name] = self._preview_item
		end

		self._mannequin_profile = table.clone_instance(self._gear_profile)
		self._mannequin_profile.loadout = self._mannequin_loadout
		local preview_with_gear = context.preview_with_gear

		if preview_with_gear then
			self._previewed_with_gear = true
		end

		self._presentation_profile = self._previewed_with_gear and self._gear_profile or self._mannequin_profile
		self._camera_zoomed_in = true
	end

	CosmeticsInspectView.super.init(self, Definitions, settings)

	self._pass_input = false
	self._pass_draw = false
	self._parent = context and context.parent
end

CosmeticsInspectView._apply_default_appearance = function (self)
	local scenegraph_definition = Definitions.scenegraph_definition
	scenegraph_definition.corner_top_left = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			180,
			310
		},
		position = {
			0,
			0,
			62
		}
	}
	scenegraph_definition.corner_top_right = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			180,
			310
		},
		position = {
			0,
			0,
			62
		}
	}
	scenegraph_definition.corner_bottom_left = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			180,
			120
		},
		position = {
			0,
			0,
			62
		}
	}
	scenegraph_definition.corner_bottom_right = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			180,
			120
		},
		position = {
			0,
			0,
			62
		}
	}
	local widget_definitions = Definitions.widget_definitions
	widget_definitions.corner_top_left = UIWidget.create_definition({
		{
			pass_type = "texture",
			value = "content/ui/materials/frames/screen/metal_01_upper"
		}
	}, "corner_top_left")
	widget_definitions.corner_top_right = UIWidget.create_definition({
		{
			value = "content/ui/materials/frames/screen/metal_01_upper",
			pass_type = "texture_uv",
			style = {
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			}
		}
	}, "corner_top_right")
	widget_definitions.corner_bottom_left = UIWidget.create_definition({
		{
			pass_type = "texture",
			value = "content/ui/materials/frames/screen/metal_01_lower"
		}
	}, "corner_bottom_left")
	widget_definitions.corner_bottom_right = UIWidget.create_definition({
		{
			value = "content/ui/materials/frames/screen/metal_01_lower",
			pass_type = "texture_uv",
			style = {
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			}
		}
	}, "corner_bottom_right")
end

CosmeticsInspectView._apply_store_appearance = function (self)
	local scenegraph_definition = Definitions.scenegraph_definition
	scenegraph_definition.corner_top_left = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			84,
			224
		},
		position = {
			0,
			0,
			62
		}
	}
	scenegraph_definition.corner_top_right = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			84,
			224
		},
		position = {
			0,
			0,
			62
		}
	}
	scenegraph_definition.corner_bottom_left = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "left",
		size = {
			84,
			224
		},
		position = {
			0,
			0,
			62
		}
	}
	scenegraph_definition.corner_bottom_right = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "right",
		size = {
			84,
			224
		},
		position = {
			0,
			0,
			62
		}
	}
	local widget_definitions = Definitions.widget_definitions
	widget_definitions.corner_top_left = UIWidget.create_definition({
		{
			pass_type = "texture",
			value = "content/ui/materials/frames/screen/premium_upper_left"
		}
	}, "corner_top_left")
	widget_definitions.corner_top_right = UIWidget.create_definition({
		{
			value = "content/ui/materials/frames/screen/premium_upper_left",
			pass_type = "texture_uv",
			style = {
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			}
		}
	}, "corner_top_right")
	widget_definitions.corner_bottom_left = UIWidget.create_definition({
		{
			pass_type = "texture",
			value = "content/ui/materials/frames/screen/premium_lower_left"
		}
	}, "corner_bottom_left")
	widget_definitions.corner_bottom_right = UIWidget.create_definition({
		{
			pass_type = "texture",
			value = "content/ui/materials/frames/screen/premium_lower_right"
		}
	}, "corner_bottom_right")
end

CosmeticsInspectView.on_enter = function (self)
	CosmeticsInspectView.super.on_enter(self)
	self:_stop_previewing()
	self:_setup_input_legend()
	self:_setup_background_world()

	local context = self._context
	local use_store_appearance = context.use_store_appearance

	if use_store_appearance then
		local widgets_by_name = self._widgets_by_name
		local item_title = widgets_by_name.item_title
		item_title.style.text.material = "content/ui/materials/font_gradients/slug_font_gradient_gold"
	end

	self._spawn_player = context and not context.debug
end

CosmeticsInspectView._setup_input_legend = function (self)
	local context = self._context
	local preview_with_gear = context.preview_with_gear
	local use_store_appearance = context.use_store_appearance
	self._input_legend_element = self:_add_element(ViewElementInputLegend, "input_legend", 50)
	local legend_inputs = self._definitions.legend_inputs

	for i = 1, #legend_inputs do
		local legend_input = legend_inputs[i]
		local valid = true

		if preview_with_gear and legend_input.gear_toggle_option then
			valid = false
		end

		if legend_input.store_appearance_option and not use_store_appearance then
			valid = false
		end

		if valid then
			local on_pressed_callback = legend_input.on_pressed_callback and callback(self, legend_input.on_pressed_callback)

			self._input_legend_element:add_entry(legend_input.display_name, legend_input.input_action, legend_input.visibility_function, on_pressed_callback, legend_input.alignment)
		end
	end
end

CosmeticsInspectView._set_preview_widgets_visibility = function (self, visible)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.item_title.content.visible = visible
	widgets_by_name.item_title_background.content.visible = visible
	widgets_by_name.item_restrictions.content.visible = visible
end

CosmeticsInspectView._stop_previewing = function (self)
	if self._weapon_preview then
		self._weapon_preview:stop_presenting()
	end

	if self._weapon_stats then
		self._weapon_stats:stop_presenting()
	end

	local visible = false

	self:_set_preview_widgets_visibility(visible)

	if self._spawned_prop_item_slot then
		local presentation_profile = self._presentation_profile
		local presentation_loadout = presentation_profile.loadout
		presentation_loadout[self._spawned_prop_item_slot] = nil
		self._spawned_prop_item_slot = nil
	end
end

CosmeticsInspectView._spawn_profile = function (self, profile, initial_rotation, disable_rotation_input)
	if self._profile_spawner then
		self._profile_spawner:destroy()

		self._profile_spawner = nil
	end

	local world = self._world_spawner:world()
	local camera = self._world_spawner:camera()
	local unit_spawner = self._world_spawner:unit_spawner()
	self._profile_spawner = UIProfileSpawner:new("CosmeticsInspectView", world, camera, unit_spawner)

	if disable_rotation_input then
		self._profile_spawner:disable_rotation_input()
	end

	local camera_position = ScriptCamera.position(camera)
	local spawn_position = Unit.world_position(self._spawn_point_unit, 1)
	local spawn_rotation = Unit.world_rotation(self._spawn_point_unit, 1)

	if initial_rotation then
		local character_initial_rotation = Quaternion.axis_angle(Vector3(0, 0, 1), initial_rotation)
		spawn_rotation = Quaternion.multiply(character_initial_rotation, spawn_rotation)
	end

	camera_position.z = 0

	self._profile_spawner:spawn_profile(profile, spawn_position, spawn_rotation)

	local selected_archetype = profile.archetype
	local archetype_name = selected_archetype.name
	local animation_duration = 0.01
	local world_spawner = self._world_spawner

	if archetype_name == "ogryn" then
		world_spawner:set_camera_position_axis_offset("x", -0.5, animation_duration, math.easeOutCubic)
		world_spawner:set_camera_position_axis_offset("y", -1.5, animation_duration, math.easeOutCubic)
		world_spawner:set_camera_position_axis_offset("z", 0.5, animation_duration, math.easeOutCubic)
	else
		world_spawner:set_camera_position_axis_offset("x", 0, animation_duration, math.easeOutCubic)
		world_spawner:set_camera_position_axis_offset("y", 0, animation_duration, math.easeOutCubic)
		world_spawner:set_camera_position_axis_offset("z", 0, animation_duration, math.easeOutCubic)
	end

	self._spawned_profile = profile
end

local ANIMATION_SLOTS_MAP = {
	slot_animation_emote_3 = true,
	slot_animation_end_of_round = true,
	slot_animation_emote_4 = true,
	slot_animation_emote_5 = true,
	slot_animation_emote_1 = true,
	slot_animation_emote_2 = true
}

CosmeticsInspectView._start_preview_item = function (self, item)
	self:_stop_previewing()

	local item_display_name = item.display_name

	if string.match(item_display_name, "unarmed") then
		return
	end

	local slots = item.slots or {}
	local item_name = item.name
	local gear_id = item.gear_id or item_name

	if item then
		local selected_slot = self._selected_slot
		local selected_slot_name = selected_slot and selected_slot.name
		local presentation_profile = self._presentation_profile
		local presentation_loadout = presentation_profile.loadout
		presentation_loadout[selected_slot_name] = item
		local animation_slot = ANIMATION_SLOTS_MAP[selected_slot_name]

		if animation_slot then
			local item_state_machine = item.state_machine
			local item_animation_event = item.animation_event
			local item_face_animation_event = self._previewed_with_gear and item.face_animation_event or nil
			local animation_event_name_suffix = self._animation_event_name_suffix
			local animation_event = item_animation_event

			if animation_event_name_suffix then
				animation_event = animation_event .. animation_event_name_suffix
			end

			self._profile_spawner:assign_state_machine(item_state_machine, animation_event, item_face_animation_event)

			local animation_event_variable_data = self._animation_event_variable_data

			if animation_event_variable_data then
				local index = animation_event_variable_data.index
				local value = animation_event_variable_data.value

				self._profile_spawner:assign_animation_variable(index, value)
			end

			local prop_item_key = item.prop_item
			local prop_item = prop_item_key and prop_item_key ~= "" and MasterItems.get_item(prop_item_key)

			if prop_item then
				local prop_item_slot = prop_item.slots[1]
				presentation_loadout[prop_item_slot] = prop_item

				self._profile_spawner:wield_slot(prop_item_slot)

				self._spawned_prop_item_slot = prop_item_slot
			end
		end

		self:_set_preview_widgets_visibility(true)

		local title_display_name_localized = item.display_name and Localize(item.display_name) or ""
		local item_type = item.item_type and Utf8.upper(item.item_type) or ""
		local item_type_localization_key = UISettings.item_type_localization_lookup[item_type]
		local item_type_display_name_localized = item_type_localization_key and Localize(item_type_localization_key) or "<undefined item_type>"
		local restrictions_text, present_restrictions_text = nil

		if item_type == "WEAPON_SKIN" then
			restrictions_text, present_restrictions_text = ItemUtils.weapon_skin_requirement_text(item)
		elseif item_type == "GEAR_UPPERBODY" or item_type == "GEAR_EXTRA_COSMETIC" or item_type == "GEAR_HEAD" or item_type == "GEAR_LOWERBODY" then
			restrictions_text, present_restrictions_text = ItemUtils.class_requirement_text(item)
		end

		self:_setup_item_texts(title_display_name_localized, item_type_display_name_localized, present_restrictions_text and restrictions_text)
	end
end

CosmeticsInspectView._setup_item_texts = function (self, display_name, sub_text, restrictions_text)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.item_title.content.text = display_name
	widgets_by_name.item_title.content.sub_text = sub_text
	local title_style = widgets_by_name.item_title.style.text
	local sub_title_style = widgets_by_name.item_title.style.sub_text
	local title_options = UIFonts.get_font_options_by_style(title_style)
	local sub_title_options = UIFonts.get_font_options_by_style(sub_title_style)
	local max_width = self._ui_scenegraph.item_title.size[1]
	local title_width, title_height = self:_text_size(widgets_by_name.item_title.content.text, title_style.font_type, title_style.font_size, {
		max_width,
		math.huge
	}, title_options)
	local sub_title_width, sub_title_height = self:_text_size(widgets_by_name.item_title.content.sub_text, sub_title_style.font_type, sub_title_style.font_size, {
		max_width,
		math.huge
	}, sub_title_options)
	local sub_title_margin = 10
	sub_title_style.offset[2] = sub_title_margin + title_height
	local margin_compensation = 5

	self:_set_scenegraph_size("item_title_background", nil, sub_title_height + sub_title_style.offset[2] + margin_compensation)
	self:_set_scenegraph_size("item_title", nil, sub_title_height + sub_title_style.offset[2] + margin_compensation)
	self:_setup_item_restrictions_text(restrictions_text)
end

CosmeticsInspectView._setup_item_restrictions_text = function (self, restrictions_text)
	local margin_compensation = 5
	local sub_title_margin = 10
	local max_width = self._ui_scenegraph.item_title.size[1]
	local widgets_by_name = self._widgets_by_name
	local item_restrictions_widget = widgets_by_name.item_restrictions
	local item_restrictions_content = item_restrictions_widget.content
	local item_restrictions_style = item_restrictions_widget.style

	if restrictions_text then
		item_restrictions_content.text = restrictions_text
		local restriction_title_style = item_restrictions_style.title
		local restriction_text_style = item_restrictions_style.text
		local restriction_title_options = UIFonts.get_font_options_by_style(restriction_title_style)
		local restriction_text_options = UIFonts.get_font_options_by_style(restriction_text_style)
		local restriction_title_width, restriction_title_height = self:_text_size(item_restrictions_content.title, restriction_title_style.font_type, restriction_title_style.font_size, {
			max_width,
			math.huge
		}, restriction_title_options)
		local restriction_text_width, title_restriction_text_height = self:_text_size(item_restrictions_content.text, restriction_text_style.font_type, restriction_text_style.font_size, {
			max_width,
			math.huge
		}, restriction_text_options)
		local text_height = restriction_title_height + title_restriction_text_height + sub_title_margin

		self:_set_scenegraph_size("item_restrictions_background", nil, text_height + margin_compensation * 2)
		self:_set_scenegraph_size("item_restrictions", nil, text_height)

		item_restrictions_style.text.offset[2] = restriction_title_height + sub_title_margin
		item_restrictions_content.visible = true
	else
		item_restrictions_content.visible = false
	end
end

CosmeticsInspectView._generate_mannequin_loadout = function (self, profile, item)
	local presentation_profile = profile
	local loadout = profile.loadout
	local gender_name = presentation_profile.gender
	local archetype = presentation_profile.archetype
	local breed_name = archetype.breed
	local new_loadout = {}
	local slots = item and item.slots
	local first_slot_name = slots and slots[1]
	local required_breed_item_names_per_slot = UISettings.item_preview_required_slot_items_set_per_slot_by_breed_and_gender[breed_name]
	local required_gender_item_names_per_slot = required_breed_item_names_per_slot and required_breed_item_names_per_slot[gender_name]

	if required_gender_item_names_per_slot then
		local required_items = required_gender_item_names_per_slot

		if required_items then
			for slot_name, slot_item_name in pairs(required_items) do
				local item_definition = MasterItems.get_item(slot_item_name)

				if item_definition then
					local slot_item = table.clone(item_definition)
					new_loadout[slot_name] = slot_item
				end
			end
		end
	end

	return new_loadout
end

CosmeticsInspectView.cb_on_weapon_swap_pressed = function (self)
	local wield_slot = self._wielded_slot
	wield_slot = wield_slot == "slot_primary" and "slot_secondary" or "slot_primary"
	self._wielded_slot = wield_slot

	self:_update_presentation_wield_item()
end

CosmeticsInspectView._has_wielded_slot = function (self)
	return self._wielded_slot ~= nil
end

CosmeticsInspectView._can_swap_weapon = function (self)
	if self:_has_wielded_slot() then
		local presentation_profile = self._presentation_profile
		local loadout = presentation_profile.loadout

		if loadout.slot_primary and loadout.slot_secondary then
			return true
		end
	end

	return false
end

CosmeticsInspectView._update_presentation_wield_item = function (self)
	if not self._profile_spawner then
		return
	end

	local wield_slot = self._wielded_slot
	local presentation_profile = self._presentation_profile
	local loadout = presentation_profile.loadout
	local slot_item = loadout[wield_slot]

	self._profile_spawner:wield_slot(wield_slot)

	local item_inventory_animation_event = slot_item and slot_item.inventory_animation_event or "inventory_idle_default"

	if item_inventory_animation_event then
		self._profile_spawner:assign_animation_event(item_inventory_animation_event)
	end
end

CosmeticsInspectView.cb_on_preview_with_gear_toggled = function (self, id, input_pressed, instant)
	self._previewed_with_gear = not self._previewed_with_gear
	self._presentation_profile = self._previewed_with_gear and self._gear_profile or self._mannequin_profile
	self._spawn_player = true
end

CosmeticsInspectView.cb_on_camera_zoom_toggled = function (self, id, input_pressed, instant)
	self._camera_zoomed_in = not self._camera_zoomed_in

	if self._camera_zoomed_in then
		self:_play_sound(UISoundEvents.apparel_zoom_in)
	else
		self:_play_sound(UISoundEvents.apparel_zoom_out)
	end

	self:_trigger_zoom_logic(instant)
end

CosmeticsInspectView._can_zoom = function (self)
	return not self._disable_zoom
end

CosmeticsInspectView._trigger_zoom_logic = function (self, instant, optional_slot_name)
	local selected_slot = self._selected_slot
	local selected_slot_name = optional_slot_name or selected_slot and selected_slot.name
	local func_ptr = math.easeCubic
	local world_spawner = self._world_spawner
	local duration = instant and 0 or 1

	if self._camera_zoomed_in then
		self:_set_camera_item_slot_focus(selected_slot_name, duration, func_ptr)
	else
		world_spawner:set_camera_position_axis_offset("x", 0, duration, func_ptr)
		world_spawner:set_camera_position_axis_offset("y", 0, duration, func_ptr)
		world_spawner:set_camera_position_axis_offset("z", 0, duration, func_ptr)
		world_spawner:set_camera_rotation_axis_offset("x", 0, duration, func_ptr)
		world_spawner:set_camera_rotation_axis_offset("y", 0, duration, func_ptr)
		world_spawner:set_camera_rotation_axis_offset("z", 0, duration, func_ptr)
	end
end

CosmeticsInspectView.on_exit = function (self)
	if self._world_spawner then
		self._world_spawner:set_camera_blur(0, 0)
	end

	if self._profile_spawner then
		self._profile_spawner:destroy()

		self._profile_spawner = nil
	end

	if self._world_spawner then
		self._world_spawner:destroy()

		self._world_spawner = nil
	end

	CosmeticsInspectView.super.on_exit(self)
end

CosmeticsInspectView._handle_back_pressed = function (self)
	local view_name = "cosmetics_inspect_view"

	Managers.ui:close_view(view_name)
end

CosmeticsInspectView.cb_on_close_pressed = function (self)
	self:_handle_back_pressed()
end

CosmeticsInspectView.update = function (self, dt, t, input_service)
	if self._spawn_player and self._spawn_point_unit and self._default_camera_unit then
		local context = self._context
		local profile = self._presentation_profile
		local initial_rotation = self._initial_rotation
		local disable_rotation_input = self._disable_rotation_input

		self:_spawn_profile(profile, initial_rotation, disable_rotation_input)

		self._spawn_player = false
		local selected_slot = self._selected_slot
		local selected_slot_name = selected_slot and selected_slot.name

		self:_trigger_zoom_logic(true, selected_slot_name)

		if self._preview_item then
			self:_start_preview_item(self._preview_item)
		else
			self:_set_preview_widgets_visibility(true)

			local display_name = context.display_name
			local sub_display_name = context.sub_display_name
			local restrictions_text = context.restrictions_text

			self:_setup_item_texts(display_name, sub_display_name, restrictions_text)
		end

		local restrictions_text = context.restrictions_text

		if restrictions_text then
			self:_setup_item_restrictions_text(restrictions_text)
		end

		local wield_slot = context.wield_slot

		if wield_slot then
			self._wielded_slot = wield_slot

			self._profile_spawner:wield_slot(wield_slot)
		end

		local state_machine = context.state_machine

		if state_machine then
			local animation_event = context.animation_event
			local face_animation_event = context.face_animation_event

			self._profile_spawner:assign_state_machine(state_machine, animation_event, face_animation_event)
		end
	end

	local profile_spawner = self._profile_spawner

	if profile_spawner then
		profile_spawner:update(dt, t, input_service)
	end

	local world_spawner = self._world_spawner

	if world_spawner then
		world_spawner:update(dt, t)
	end

	return CosmeticsInspectView.super.update(self, dt, t, input_service)
end

CosmeticsInspectView._get_weapon_spawn_position_normalized = function (self)
	self:_force_update_scenegraph()

	local scale = nil
	local pivot_world_position = self:_scenegraph_world_position("weapon_pivot", scale)
	local parent_world_position = self:_scenegraph_world_position("weapon_viewport", scale)
	local viewport_width, viewport_height = self:_scenegraph_size("weapon_viewport", scale)
	local scale_x = (pivot_world_position[1] - parent_world_position[1]) / viewport_width
	local scale_y = 1 - (pivot_world_position[2] - parent_world_position[2]) / viewport_height

	return scale_x, scale_y
end

CosmeticsInspectView.on_resolution_modified = function (self, scale)
	CosmeticsInspectView.super.on_resolution_modified(self, scale)
end

CosmeticsInspectView._setup_background_world = function (self)
	local profile = self._preview_profile
	local archetype = profile and profile.archetype
	local breed_name = profile and archetype.breed or ""
	local default_camera_event_id = "event_register_cosmetics_preview_default_camera_" .. breed_name

	self[default_camera_event_id] = function (instance, camera_unit)
		if instance._context then
			instance._context.camera_unit = camera_unit
		end

		instance._default_camera_unit = camera_unit
		local viewport_name = CosmeticsInspectViewSettings.viewport_name
		local viewport_type = CosmeticsInspectViewSettings.viewport_type
		local viewport_layer = CosmeticsInspectViewSettings.viewport_layer
		local shading_environment = CosmeticsInspectViewSettings.shading_environment

		instance._world_spawner:create_viewport(camera_unit, viewport_name, viewport_type, viewport_layer, shading_environment)
		instance:_unregister_event(default_camera_event_id)
	end

	self:_register_event(default_camera_event_id)

	self._item_camera_by_slot_id = {}

	for slot_name, slot in pairs(ItemSlotSettings) do
		if slot.slot_type == "gear" then
			local item_camera_event_id = "event_register_cosmetics_preview_item_camera_" .. breed_name .. "_" .. slot_name

			self[item_camera_event_id] = function (instance, camera_unit)
				instance._item_camera_by_slot_id[slot_name] = camera_unit

				instance:_unregister_event(item_camera_event_id)
			end

			self:_register_event(item_camera_event_id)
		end
	end

	self:_register_event("event_register_cosmetics_preview_character_spawn_point")

	local world_name = CosmeticsInspectViewSettings.world_name
	local world_layer = CosmeticsInspectViewSettings.world_layer
	local world_timer_name = CosmeticsInspectViewSettings.timer_name
	self._world_spawner = UIWorldSpawner:new(world_name, world_layer, world_timer_name, self.view_name)
	local level_name = CosmeticsInspectViewSettings.level_name

	self._world_spawner:spawn_level(level_name)
end

CosmeticsInspectView.world_spawner = function (self)
	return self._world_spawner
end

CosmeticsInspectView.spawn_point_unit = function (self)
	return self._spawn_point_unit
end

CosmeticsInspectView.event_register_cosmetics_preview_character_spawn_point = function (self, spawn_point_unit)
	self:_unregister_event("event_register_cosmetics_preview_character_spawn_point")

	self._spawn_point_unit = spawn_point_unit

	if self._context then
		self._context.spawn_point_unit = spawn_point_unit
	end
end

CosmeticsInspectView._set_camera_item_slot_focus = function (self, slot_name, time, func_ptr)
	local world_spawner = self._world_spawner
	local slot_camera = self._item_camera_by_slot_id[slot_name] or self._default_camera_unit
	local camera_world_position = Unit.world_position(slot_camera, 1)
	local camera_world_rotation = Unit.world_rotation(slot_camera, 1)
	local boxed_camera_start_position = world_spawner:boxed_camera_start_position()
	local default_camera_world_position = Vector3.from_array(boxed_camera_start_position)

	world_spawner:set_camera_position_axis_offset("x", camera_world_position.x - default_camera_world_position.x, time, func_ptr)
	world_spawner:set_camera_position_axis_offset("y", camera_world_position.y - default_camera_world_position.y, time, func_ptr)
	world_spawner:set_camera_position_axis_offset("z", camera_world_position.z - default_camera_world_position.z, time, func_ptr)

	local boxed_camera_start_rotation = world_spawner:boxed_camera_start_rotation()
	local default_camera_world_rotation = boxed_camera_start_rotation:unbox()
	local default_camera_world_rotation_x, default_camera_world_rotation_y, default_camera_world_rotation_z = Quaternion.to_euler_angles_xyz(default_camera_world_rotation)
	local camera_world_rotation_x, camera_world_rotation_y, camera_world_rotation_z = Quaternion.to_euler_angles_xyz(camera_world_rotation)

	world_spawner:set_camera_rotation_axis_offset("x", camera_world_rotation_x - default_camera_world_rotation_x, time, func_ptr)
	world_spawner:set_camera_rotation_axis_offset("y", camera_world_rotation_y - default_camera_world_rotation_y, time, func_ptr)
	world_spawner:set_camera_rotation_axis_offset("z", camera_world_rotation_z - default_camera_world_rotation_z, time, func_ptr)
end

CosmeticsInspectView._set_camera_node_focus = function (self, node_name, time, func_ptr)
	if node_name then
		local profile_spawner = self._profile_spawner
		local world_spawner = self._world_spawner
		local base_world_position = profile_spawner:node_world_position(1)
		local node_world_position = profile_spawner:node_world_position(node_name)
		local target_position = node_world_position - base_world_position

		world_spawner:set_camera_position_axis_offset("x", target_position.x, time, func_ptr)
		world_spawner:set_camera_position_axis_offset("y", target_position.y, time, func_ptr)
		world_spawner:set_camera_position_axis_offset("z", target_position.z, time, func_ptr)
	end
end

CosmeticsInspectView._set_camera_position_axis_offset = function (self, axis, value, animation_time, func_ptr)
	self._world_spawner:set_camera_position_axis_offset(axis, value, animation_time, func_ptr)
end

CosmeticsInspectView._set_camera_rotation_axis_offset = function (self, axis, value, animation_time, func_ptr)
	self._world_spawner:set_camera_rotation_axis_offset(axis, value, animation_time, func_ptr)
end

return CosmeticsInspectView