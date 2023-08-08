local BossPatrols = require("scripts/managers/pacing/monster_pacing/boss_patrols")
local PerceptionSettings = require("scripts/settings/perception/perception_settings")
local AggroStates = PerceptionSettings.aggro_states
local monster_pacing_template = {
	name = "renegade_monsters",
	resistance_templates = {
		{
			num_spawns = {
				witches = 0,
				monsters = {
					0,
					1
				}
			},
			boss_patrols = {
				breed_lists = {
					renegade = BossPatrols.renegade_boss_patrols,
					cultist = BossPatrols.cultist_boss_patrols
				},
				sound_events = {
					renegade = {
						stop = "wwise/events/minions/stop_minion_group_sfx_elite_patrole_traitor",
						start = "wwise/events/minions/play_minion_group_sfx_elite_patrole_traitor"
					},
					cultist = {
						stop = "wwise/events/minions/stop_minion_group_sfx_elite_patrole_cultist",
						start = "wwise/events/minions/play_minion_group_sfx_elite_patrole_cultist"
					}
				},
				num_boss_patrols_range = {
					0,
					1
				}
			},
			breed_names = {
				monsters = {
					"chaos_plague_ogryn",
					"chaos_beast_of_nurgle",
					"chaos_spawn"
				},
				witches = {
					"chaos_daemonhost"
				}
			},
			aggro_states = {
				chaos_plague_ogryn = AggroStates.aggroed,
				chaos_beast_of_nurgle = AggroStates.aggroed,
				chaos_spawn = AggroStates.aggroed
			},
			pause_pacing_on_spawn = {
				chaos_plague_ogryn = {
					hordes = 60,
					trickle_hordes = 40,
					specials = 50
				},
				chaos_beast_of_nurgle = {
					hordes = 60,
					trickle_hordes = 40,
					specials = 20
				},
				chaos_spawn = {
					hordes = 60,
					trickle_hordes = 40,
					specials = 50
				}
			},
			despawn_distance_when_passive = {
				chaos_daemonhost = 65
			}
		},
		{
			num_spawns = {
				monsters = {
					0,
					1
				},
				witches = {
					0,
					1
				}
			},
			boss_patrols = {
				breed_lists = {
					renegade = BossPatrols.renegade_boss_patrols,
					cultist = BossPatrols.cultist_boss_patrols
				},
				sound_events = {
					renegade = {
						stop = "wwise/events/minions/stop_minion_group_sfx_elite_patrole_traitor",
						start = "wwise/events/minions/play_minion_group_sfx_elite_patrole_traitor"
					},
					cultist = {
						stop = "wwise/events/minions/stop_minion_group_sfx_elite_patrole_cultist",
						start = "wwise/events/minions/play_minion_group_sfx_elite_patrole_cultist"
					}
				},
				num_boss_patrols_range = {
					0,
					2
				}
			},
			breed_names = {
				monsters = {
					"chaos_plague_ogryn",
					"chaos_beast_of_nurgle",
					"chaos_spawn"
				},
				witches = {
					"chaos_daemonhost"
				}
			},
			aggro_states = {
				chaos_plague_ogryn = AggroStates.aggroed,
				chaos_beast_of_nurgle = AggroStates.aggroed,
				chaos_spawn = AggroStates.aggroed
			},
			pause_pacing_on_spawn = {
				chaos_plague_ogryn = {
					hordes = 30,
					trickle_hordes = 20,
					specials = 20
				},
				chaos_beast_of_nurgle = {
					hordes = 30,
					trickle_hordes = 20,
					specials = 20
				},
				chaos_spawn = {
					hordes = 30,
					trickle_hordes = 20,
					specials = 20
				}
			},
			despawn_distance_when_passive = {
				chaos_daemonhost = 65
			}
		},
		{
			num_spawns = {
				monsters = {
					0,
					2
				},
				witches = {
					0,
					1
				}
			},
			boss_patrols = {
				breed_lists = {
					renegade = BossPatrols.renegade_boss_patrols,
					cultist = BossPatrols.cultist_boss_patrols
				},
				sound_events = {
					renegade = {
						stop = "wwise/events/minions/stop_minion_group_sfx_elite_patrole_traitor",
						start = "wwise/events/minions/play_minion_group_sfx_elite_patrole_traitor"
					},
					cultist = {
						stop = "wwise/events/minions/stop_minion_group_sfx_elite_patrole_cultist",
						start = "wwise/events/minions/play_minion_group_sfx_elite_patrole_cultist"
					}
				},
				num_boss_patrols_range = {
					1,
					2
				}
			},
			breed_names = {
				monsters = {
					"chaos_plague_ogryn",
					"chaos_beast_of_nurgle",
					"chaos_spawn"
				},
				witches = {
					"chaos_daemonhost"
				}
			},
			aggro_states = {
				chaos_plague_ogryn = AggroStates.aggroed,
				chaos_beast_of_nurgle = AggroStates.aggroed,
				chaos_spawn = AggroStates.aggroed
			},
			pause_pacing_on_spawn = {
				chaos_plague_ogryn = {
					specials = 15
				},
				chaos_beast_of_nurgle = {
					specials = 15
				},
				chaos_spawn = {
					specials = 15
				}
			},
			despawn_distance_when_passive = {
				chaos_daemonhost = 65
			}
		},
		{
			num_spawns = {
				monsters = {
					1,
					2
				},
				witches = {
					0,
					2
				}
			},
			boss_patrols = {
				breed_lists = {
					renegade = BossPatrols.renegade_boss_patrols,
					cultist = BossPatrols.cultist_boss_patrols
				},
				sound_events = {
					renegade = {
						stop = "wwise/events/minions/stop_minion_group_sfx_elite_patrole_traitor",
						start = "wwise/events/minions/play_minion_group_sfx_elite_patrole_traitor"
					},
					cultist = {
						stop = "wwise/events/minions/stop_minion_group_sfx_elite_patrole_cultist",
						start = "wwise/events/minions/play_minion_group_sfx_elite_patrole_cultist"
					}
				},
				num_boss_patrols_range = {
					1,
					2
				}
			},
			breed_names = {
				monsters = {
					"chaos_plague_ogryn",
					"chaos_beast_of_nurgle",
					"chaos_spawn"
				},
				witches = {
					"chaos_daemonhost"
				}
			},
			aggro_states = {
				chaos_plague_ogryn = AggroStates.aggroed,
				chaos_beast_of_nurgle = AggroStates.aggroed,
				chaos_spawn = AggroStates.aggroed
			},
			pause_pacing_on_spawn = {},
			despawn_distance_when_passive = {
				chaos_daemonhost = 65
			}
		},
		{
			num_spawns = {
				monsters = {
					1,
					2
				},
				witches = {
					0,
					2
				}
			},
			boss_patrols = {
				breed_lists = {
					renegade = BossPatrols.renegade_boss_patrols,
					cultist = BossPatrols.cultist_boss_patrols
				},
				sound_events = {
					renegade = {
						stop = "wwise/events/minions/stop_minion_group_sfx_elite_patrole_traitor",
						start = "wwise/events/minions/play_minion_group_sfx_elite_patrole_traitor"
					},
					cultist = {
						stop = "wwise/events/minions/stop_minion_group_sfx_elite_patrole_cultist",
						start = "wwise/events/minions/play_minion_group_sfx_elite_patrole_cultist"
					}
				},
				num_boss_patrols_range = {
					1,
					2
				}
			},
			breed_names = {
				monsters = {
					"chaos_plague_ogryn",
					"chaos_beast_of_nurgle",
					"chaos_spawn"
				},
				witches = {
					"chaos_daemonhost"
				}
			},
			aggro_states = {
				chaos_plague_ogryn = AggroStates.aggroed,
				chaos_beast_of_nurgle = AggroStates.aggroed,
				chaos_spawn = AggroStates.aggroed
			},
			pause_pacing_on_spawn = {},
			despawn_distance_when_passive = {
				chaos_daemonhost = 65
			}
		}
	}
}

return monster_pacing_template
