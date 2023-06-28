local BackendUtilities = require("scripts/foundation/managers/backend/utilities/backend_utilities")
local Interface = {}
local Account = class("Account")

Account.init = function (self)
	return
end

Account.get_boon_inventory = function (self)
	return BackendUtilities.make_account_title_request("account", BackendUtilities.url_builder("boons")):next(function (data)
		return data.body
	end)
end

Account.set_has_created_first_character = function (self, value)
	return self:set_data("core", {
		has_created_first_character = value
	})
end

Account.get_has_created_first_character = function (self)
	return self:get_data("core", "has_created_first_character")
end

Account.set_has_completed_onboarding = function (self, value)
	return self:set_data("core", {
		has_completed_onboarding = value
	})
end

Account.get_has_completed_onboarding = function (self)
	return self:get_data("core", "has_completed_onboarding")
end

Account.set_selected_character = function (self, character_id)
	return self:set_data("core", {
		selected_character = character_id
	})
end

Account.get_selected_character = function (self)
	return self:get_data("core", "selected_character")
end

Account.get = function (self)
	return BackendUtilities.make_account_title_request("account", BackendUtilities.url_builder("")):next(function (data)
		return data.body
	end)
end

Account.set_data = function (self, section, data)
	return BackendUtilities.make_account_title_request("account", BackendUtilities.url_builder("/data/"):path(section), {
		method = "PUT",
		body = {
			data = data
		}
	}):next(function (data)
		return nil
	end)
end

local function _same_path(...)
	local desired_path = {
		...
	}

	return function (entry)
		local real_path = entry.typePath

		return table.array_equals(real_path, desired_path)
	end
end

Account.get_data = function (self, section, part, ...)
	local same_path = _same_path(section, ...)

	return BackendUtilities.make_account_title_request("account", BackendUtilities.url_builder("/data/"):path(section)):next(function (data)
		local entries = data.body.data
		local index = table.index_of_condition(entries, same_path)
		local entry = entries[index]

		if entry and part then
			return entry.value[part]
		else
			return entry
		end
	end)
end

Account.rename_account = function (self, requested_name)
	return BackendUtilities.make_account_title_request("account", BackendUtilities.url_builder("/name/"):path(requested_name), {
		method = "PUT"
	})
end

implements(Account, Interface)

return Account
