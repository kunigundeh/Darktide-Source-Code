local OptionsUtilities = require("scripts/utilities/ui/options")
local SaveData = require("scripts/managers/save/save_data")
local UISoundEvents = require("scripts/settings/ui/ui_sound_events")
local DefaultViewInputSettings = require("scripts/settings/input/default_view_input_settings")
local InputUtils = require("scripts/managers/input/input_utils")

local function save_account_settings(location_name, settings_name, value)
	local player = Managers.player:local_player(1)
	local save_manager = Managers.save

	if player and save_manager then
		local account_data = save_manager:account_data()

		if location_name then
			account_data[location_name][settings_name] = value
		else
			account_data[settings_name] = value
		end

		save_manager:queue_save()

		return true
	end

	return false
end

local function get_account_settings(location_name, settings_name)
	local player = Managers.player:local_player(1)
	local save_manager = Managers.save

	if player and save_manager then
		local account_data = save_manager:account_data()

		if location_name then
			return account_data[location_name][settings_name]
		else
			return account_data[settings_name]
		end
	end
end

local function _is_same(current, new)
	if current == new then
		return true
	elseif type(current) == "table" and type(new) == "table" then
		for k, v in pairs(current) do
			if new[k] ~= v then
				return false
			end
		end

		for k, v in pairs(new) do
			if current[k] ~= v then
				return false
			end
		end

		return true
	else
		return false
	end
end

local function construct_interface_settings_boolean(template)
	local entry = {
		default_value = template.default_value,
		display_name = template.display_name,
		on_value_changed = template.on_value_changed,
		indentation_level = template.indentation_level,
		validation_function = template.validation_function,
		tooltip_text = template.tooltip_text,
		disable_rules = template.disable_rules,
		id = template.id
	}
	local id = template.id
	local save_location = template.save_location
	local default_value = template.default_value

	entry.get_function = function ()
		local old_value = get_account_settings(save_location, id)

		if old_value == nil then
			return default_value
		else
			return old_value
		end
	end

	entry.on_activated = function (new_value)
		local current_value = get_account_settings(save_location, id)

		if current_value == nil then
			current_value = default_value
		end

		if not _is_same(current_value, new_value) then
			save_account_settings(save_location, id, new_value)

			if entry.on_value_changed then
				entry.on_value_changed(new_value)
			end
		end
	end

	return entry
end

local function construct_interface_settings_percent_slider(template)
	local min_value = template.min_value or 0
	local max_value = template.max_value or 100
	local value_range = max_value - min_value
	local convertion_value = value_range / 100
	local step_size = template.step_size_value or 1
	local percent_step_size = step_size / convertion_value
	local default_value = ((template.default_value or min_value) - min_value) / convertion_value
	local id = template.id
	local save_location = template.save_location

	local function explode_value(percent_value)
		local exploded_value = min_value + percent_value * convertion_value
		exploded_value = math.round(exploded_value / step_size) * step_size

		return exploded_value
	end

	local on_value_changed = template.on_value_changed

	local function on_value_changed_function(percent_value)
		local exploded_value = explode_value(percent_value)

		save_account_settings(save_location, id, exploded_value)

		if on_value_changed then
			on_value_changed(exploded_value)
		end
	end

	local value_get_function = template.get_function or function ()
		local exploded_value = get_account_settings(save_location, id)

		if exploded_value == nil then
			exploded_value = default_value
		end

		local percent_value = (exploded_value - min_value) / convertion_value

		return percent_value
	end
	local format_value_function = template.format_value_function or function (current_value)
		local exploded_value = explode_value(current_value)
		local result = string.format("%d %%", exploded_value)

		return result
	end
	local params = {
		apply_on_drag = true,
		display_name = template.display_name,
		default_value = default_value,
		step_size_value = percent_step_size,
		value_get_function = value_get_function,
		on_value_changed_function = on_value_changed_function,
		format_value_function = format_value_function,
		indentation_level = template.indentation_level,
		validation_function = template.validation_function,
		tooltip_text = template.tooltip_text,
		disable_rules = template.disable_rules
	}

	return OptionsUtilities.create_percent_slider_template(params)
end

local function construct_interface_settings_value_slider(template)
	local min_value = template.min_value or 0
	local max_value = template.max_value or 100
	local default_value = template.default_value or min_value
	local step_size_value = template.step_size_value
	local num_decimals = template.num_decimals
	local on_value_changed = template.on_value_changed
	local id = template.id
	local save_location = template.save_location

	local function on_value_changed_function(value)
		save_account_settings(save_location, id, value)

		if on_value_changed then
			on_value_changed(value)
		end
	end

	local function value_get_function()
		return get_account_settings(save_location, id) or default_value
	end

	local params = {
		min_value = min_value,
		max_value = max_value,
		display_name = template.display_name,
		default_value = default_value,
		num_decimals = num_decimals,
		step_size_value = step_size_value,
		value_get_function = value_get_function,
		on_value_changed_function = on_value_changed_function,
		apply_on_drag = template.apply_on_drag,
		indentation_level = template.indentation_level,
		validation_function = template.validation_function,
		id = template.id,
		tooltip_text = template.tooltip_text,
		disable_rules = template.disable_rules
	}

	return OptionsUtilities.create_value_slider_template(params)
end

local function construct_interface_settings_dropdown(template)
	local on_value_changed = template.on_value_changed
	local id = template.id
	local save_location = template.save_location

	local function value_get_function()
		return get_account_settings(save_location, id)
	end

	local options = {}

	for i = 1, #template.options do
		local value = template.options[i]
		options[#options + 1] = {
			id = value.name,
			value = value.name,
			display_name = value.display_name
		}
	end

	local function on_activated(value, template)
		save_account_settings(save_location, id, value)

		if on_value_changed then
			on_value_changed(value)
		end
	end

	local params = {
		display_name = template.display_name,
		get_function = value_get_function,
		options = options,
		on_activated = on_activated,
		indentation_level = template.indentation_level,
		validation_function = template.validation_function,
		id = template.id,
		tooltip_text = template.tooltip_text,
		disable_rules = template.disable_rules
	}

	return params
end

local function _aim_assist_options()
	local options = {
		{
			display_name = "loc_setting_aim_assist_off",
			name = "off"
		},
		{
			display_name = "loc_setting_aim_assist_old",
			name = "old"
		},
		{
			display_name = "loc_setting_aim_assist_new_slim",
			name = "new_slim"
		},
		{
			display_name = "loc_setting_aim_assist_new_full",
			name = "new_full"
		}
	}

	return options
end

local settings_definitions = {
	{
		group_name = "movement_settings",
		display_name = "loc_settings_menu_group_movement_settings",
		widget_type = "group_header"
	},
	{
		id = "hold_to_crouch",
		save_location = "input_settings",
		display_name = "loc_setting_hold_to_crouch",
		widget_type = "boolean"
	},
	{
		id = "stationary_dodge",
		save_location = "input_settings",
		display_name = "loc_setting_stationary_dodge",
		widget_type = "boolean"
	},
	{
		id = "diagonal_forward_dodge",
		save_location = "input_settings",
		display_name = "loc_setting_diagonal_forward_dodge",
		widget_type = "boolean"
	},
	{
		id = "hold_to_sprint",
		save_location = "input_settings",
		display_name = "loc_setting_hold_to_sprint",
		widget_type = "boolean"
	},
	{
		group_name = "mouse_settings",
		display_name = "loc_settings_menu_group_mouse_settings",
		widget_type = "group_header",
		validation_function = function ()
			return Managers.ui.using_cursor_navigation()
		end
	},
	{
		step_size_value = 0.1,
		display_name = "loc_input_setting_mouse_sensitivity",
		num_decimals = 1,
		max_value = 2,
		min_value = 0.1,
		widget_type = "value_slider",
		id = "mouse_look_scale",
		save_location = "input_settings",
		validation_function = function ()
			return Managers.ui.using_cursor_navigation()
		end
	},
	{
		save_location = "input_settings",
		display_name = "loc_input_setting_invert_mouse",
		id = "mouse_invert_look_y",
		widget_type = "boolean",
		validation_function = function ()
			return Managers.ui.using_cursor_navigation()
		end
	},
	{
		save_location = "input_settings",
		step_size_value = 0.1,
		display_name = "loc_input_com_wheel_delay",
		num_decimals = 1,
		id = "com_wheel_delay",
		max_value = 1,
		min_value = 0,
		widget_type = "value_slider"
	},
	{
		group_name = "controller_settings",
		display_name = "loc_settings_menu_group_controller_settings",
		widget_type = "group_header",
		validation_function = function ()
			return not Managers.ui.using_cursor_navigation()
		end
	},
	{
		display_name = "loc_xbox_controller_chat_button_description",
		shrink_to_fit = true,
		widget_type = "description",
		display_params = {
			input = "+"
		},
		validation_function = function ()
			return IS_XBS and not Managers.ui.using_cursor_navigation()
		end
	},
	{
		step_size_value = 0.1,
		display_name = "loc_setting_controller_look_scale",
		num_decimals = 1,
		max_value = 10,
		min_value = 0,
		widget_type = "value_slider",
		id = "controller_look_scale",
		save_location = "input_settings",
		validation_function = function ()
			return not Managers.ui.using_cursor_navigation()
		end
	},
	{
		step_size_value = 0.01,
		apply_on_drag = true,
		display_name = "loc_setting_controller_look_dead_zone",
		num_decimals = 2,
		max_value = 1,
		min_value = 0,
		widget_type = "value_slider",
		id = "controller_look_dead_zone",
		save_location = "input_settings",
		validation_function = function ()
			return not Managers.ui.using_cursor_navigation()
		end
	},
	{
		save_location = "input_settings",
		display_name = "loc_setting_controller_invert_look_y",
		id = "controller_invert_look_y",
		widget_type = "boolean",
		validation_function = function ()
			return not Managers.ui.using_cursor_navigation()
		end
	},
	{
		save_location = "input_settings",
		display_name = "loc_setting_controller_enable_acceleration",
		id = "controller_enable_acceleration",
		widget_type = "boolean",
		validation_function = function ()
			return not Managers.ui.using_cursor_navigation()
		end
	},
	{
		save_location = "input_settings",
		display_name = "loc_setting_controller_layout",
		id = "controller_layout",
		widget_type = "dropdown",
		options = Managers.input:get_input_layout_names(),
		on_value_changed = function (value)
			Managers.input:change_input_layout(value)
		end,
		validation_function = function ()
			return not Managers.ui.using_cursor_navigation()
		end
	},
	{
		save_location = "input_settings",
		display_name = "loc_setting_aim_assist",
		id = "controller_aim_assist",
		widget_type = "dropdown",
		options = _aim_assist_options(),
		tooltip_text = function ()
			local assist_title_1 = Localize("loc_setting_aim_assist_new_full")
			local assist_desc_1 = Localize("loc_setting_aim_assist_new_full_desc")
			local assist_title_2 = Localize("loc_setting_aim_assist_new_slim")
			local assist_desc_2 = Localize("loc_setting_aim_assist_new_slim_desc")
			local assist_title_3 = Localize("loc_setting_aim_assist_old")
			local assist_desc_3 = Localize("loc_setting_aim_assist_old_desc")
			local assist_title_4 = Localize("loc_setting_aim_assist_off")
			local assist_desc_4 = Localize("loc_setting_aim_assist_off_desc")

			return Localize("loc_setting_aim_assist_mouseover_text_format", false, {
				assist_title_1 = assist_title_1,
				assist_desc_1 = assist_desc_1,
				assist_title_2 = assist_title_2,
				assist_desc_2 = assist_desc_2,
				assist_title_3 = assist_title_3,
				assist_desc_3 = assist_desc_3,
				assist_title_4 = assist_title_4,
				assist_desc_4 = assist_desc_4
			})
		end,
		validation_function = function ()
			return not Managers.ui.using_cursor_navigation()
		end
	}
}
local template_functions = {
	boolean = construct_interface_settings_boolean,
	value_slider = construct_interface_settings_value_slider,
	percent_slider = construct_interface_settings_percent_slider,
	dropdown = construct_interface_settings_dropdown
}
local settings = {}

for i = 1, #settings_definitions do
	local definition = settings_definitions[i]
	local widget_type = definition.widget_type
	local template_function = template_functions[widget_type]

	if not definition.default_value then
		local save_location = definition.save_location
		local id = definition.id

		if save_location then
			definition.default_value = SaveData.default_account_data[save_location][id]
		else
			definition.default_value = SaveData.default_account_data[id]
		end
	end

	if template_function then
		settings[#settings + 1] = template_function(definition)
	else
		settings[#settings + 1] = definition
	end
end

return {
	icon = "content/ui/materials/icons/system/settings/category_gameplay",
	display_name = "loc_settings_menu_category_input",
	settings = settings
}
