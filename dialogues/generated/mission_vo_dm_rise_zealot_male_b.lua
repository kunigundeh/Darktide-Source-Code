local mission_vo_dm_rise_zealot_male_b = {
	mission_rise_first_objective_response = {
		randomize_indexes_n = 0,
		sound_events_n = 10,
		sound_events = {
			"loc_zealot_male_b__guidance_starting_area_01",
			"loc_zealot_male_b__guidance_starting_area_02",
			"loc_zealot_male_b__guidance_starting_area_03",
			"loc_zealot_male_b__guidance_starting_area_04",
			"loc_zealot_male_b__guidance_starting_area_05",
			"loc_zealot_male_b__guidance_starting_area_06",
			"loc_zealot_male_b__guidance_starting_area_07",
			"loc_zealot_male_b__guidance_starting_area_08",
			"loc_zealot_male_b__guidance_starting_area_09",
			"loc_zealot_male_b__guidance_starting_area_10"
		},
		sound_events_duration = {
			1.607604,
			1.4465,
			3.353021,
			3.354813,
			4.893125,
			4.905875,
			3.656563,
			4.080854,
			4.515563,
			3.091354
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
			"loc_zealot_male_b__event_survive_almost_done_01",
			"loc_zealot_male_b__event_survive_almost_done_02",
			"loc_zealot_male_b__event_survive_almost_done_03",
			"loc_zealot_male_b__event_survive_almost_done_04"
		},
		sound_events_duration = {
			2.982063,
			3.71425,
			2.196604,
			3.219458
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
			"loc_zealot_male_b__region_habculum_01",
			"loc_zealot_male_b__region_habculum_02",
			"loc_zealot_male_b__region_habculum_03"
		},
		sound_events_duration = {
			4.635458,
			6.237438,
			2.444396
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
			"loc_zealot_male_b__zone_transit_01",
			"loc_zealot_male_b__zone_transit_02",
			"loc_zealot_male_b__zone_transit_03"
		},
		sound_events_duration = {
			3.507083,
			4.100729,
			4.620688
		},
		sound_event_weights = {
			0.3333333,
			0.3333333,
			0.3333333
		},
		randomize_indexes = {}
	}
}

return settings("mission_vo_dm_rise_zealot_male_b", mission_vo_dm_rise_zealot_male_b)
