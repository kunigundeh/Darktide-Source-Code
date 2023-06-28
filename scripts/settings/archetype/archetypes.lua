local archetypes = {}

local function _fill_required_entries(archetype)
	return
end

local function _create_archetype_entry(path)
	local archetype_data = require(path)
	local archetype_name = archetype_data.name

	_fill_required_entries(archetype_data)

	local archetype_entry = archetype_data
	archetypes[archetype_name] = archetype_entry
end

_create_archetype_entry("scripts/settings/archetype/archetypes/veteran_archetype")
_create_archetype_entry("scripts/settings/archetype/archetypes/ogryn_archetype")
_create_archetype_entry("scripts/settings/archetype/archetypes/zealot_archetype")
_create_archetype_entry("scripts/settings/archetype/archetypes/psyker_archetype")

return settings("Archetypes", archetypes)
