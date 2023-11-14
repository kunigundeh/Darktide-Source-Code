local grid_size = {
	690,
	350
}
grid_size = {
	690,
	640
}
local grid_width = grid_size[1]
local grid_height = grid_size[2]
local grid_blur_edge_size = {
	80,
	20
}
local mask_size = {
	grid_width + grid_blur_edge_size[1] * 2,
	grid_height + grid_blur_edge_size[2] * 2
}
local item_stats_grid_settings = nil
local padding = 12
local width = 530
local height = 920
item_stats_grid_settings = {
	scrollbar_width = 7,
	ignore_blur = true,
	title_height = 70,
	grid_spacing = {
		0,
		0
	},
	grid_size = {
		width - padding,
		height
	},
	mask_size = {
		width + 40,
		height
	},
	edge_padding = padding
}
local inventory_view_settings = {
	scrollbar_width = 7,
	wallet_sync_delay = 15,
	item_stats_grid_settings = item_stats_grid_settings,
	grid_spacing = {
		10,
		10
	},
	grid_size = grid_size,
	mask_size = mask_size
}

return settings("InventoryViewSettings", inventory_view_settings)
