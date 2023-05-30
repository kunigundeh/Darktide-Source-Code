local mission_vo_dm_rise_ogryn_c = {
	mission_rise_first_objective_response = {
		randomize_indexes_n = 0,
		sound_events_n = 10,
		sound_events = {
			"loc_ogryn_c__guidance_starting_area_01",
			"loc_ogryn_c__guidance_starting_area_02",
			"loc_ogryn_c__guidance_starting_area_03",
			"loc_ogryn_c__guidance_starting_area_04",
			"loc_ogryn_c__guidance_starting_area_05",
			"loc_ogryn_c__guidance_starting_area_06",
			"loc_ogryn_c__guidance_starting_area_07",
			"loc_ogryn_c__guidance_starting_area_08",
			"loc_ogryn_c__guidance_starting_area_09",
			"loc_ogryn_c__guidance_starting_area_10"
		},
		sound_events_duration = {
			2.687979,
			2.8775,
			3.552531,
			2.388438,
			3.068083,
			4.558521,
			3.969979,
			3.13975,
			3.403104,
			3.747969
		},
		sound_event_weights = {
			0.1,
			0.1,
			0.1,
			0.1,
			0.1,
			0.1,
			0.1,
			0.1,
			0.1,
			0.1
		},
		randomize_indexes = {}
	},
	mission_rise_keep_coming_b = {
		randomize_indexes_n = 0,
		sound_events_n = 4,
		sound_events = {
			"loc_ogryn_c__event_survive_almost_done_01",
			"loc_ogryn_c__event_survive_almost_done_02",
			"loc_ogryn_c__event_survive_almost_done_03",
			"loc_ogryn_c__event_survive_almost_done_04"
		},
		sound_events_duration = {
			1.588365,
			2.627323,
			2.523708,
			1.358417
		},
		sound_event_weights = {
			0.25,
			0.25,
			0.25,
			0.25
		},
		randomize_indexes = {}
	},
	mission_rise_start_b_sergeant_branch = {
		randomize_indexes_n = 0,
		sound_events_n = 3,
		sound_events = {
			"loc_ogryn_c__region_habculum_01",
			"loc_ogryn_c__region_habculum_02",
			"loc_ogryn_c__region_habculum_03"
		},
		sound_events_duration = {
			1.880125,
			4.54024,
			3.445604
		},
		sound_event_weights = {
			0.3333333,
			0.3333333,
			0.3333333
		},
		randomize_indexes = {}
	},
	mission_rise_start_b_sergeant_branch_response = {
		randomize_indexes_n = 0,
		sound_events_n = 3,
		sound_events = {
			"loc_ogryn_c__zone_transit_01",
			"loc_ogryn_c__zone_transit_02",
			"loc_ogryn_c__zone_transit_03"
		},
		sound_events_duration = {
			4.882969,
			3.751333,
			3.65425
		},
		sound_event_weights = {
			0.3333333,
			0.3333333,
			0.3333333
		},
		randomize_indexes = {}
	}
}

return settings("mission_vo_dm_rise_ogryn_c", mission_vo_dm_rise_ogryn_c)
