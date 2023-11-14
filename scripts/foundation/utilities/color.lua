require("scripts/foundation/utilities/error")

if type(Color) ~= "table" then
	local metatable = {}

	metatable.__call = function (self, ...)
		return self.create(...)
	end

	metatable.__index = function (self, color_name)
		ferror("[Color] No color named %q defined in color.lua!", color_name)
	end

	local create_color_function = Color
	Color = {
		create = create_color_function
	}

	setmetatable(Color, metatable)
end

local color_definitions = {
	maroon = {
		255,
		128,
		0,
		0
	},
	dark_red = {
		255,
		139,
		0,
		0
	},
	brown = {
		255,
		127,
		51,
		0
	},
	firebrick = {
		255,
		178,
		34,
		34
	},
	crimson = {
		255,
		220,
		20,
		60
	},
	red = {
		255,
		255,
		0,
		0
	},
	tomato = {
		255,
		255,
		99,
		71
	},
	coral = {
		255,
		255,
		127,
		80
	},
	indian_red = {
		255,
		205,
		92,
		92
	},
	light_coral = {
		255,
		240,
		128,
		128
	},
	dark_salmon = {
		255,
		233,
		150,
		122
	},
	salmon = {
		255,
		250,
		128,
		114
	},
	light_salmon = {
		255,
		255,
		160,
		122
	},
	cheeseburger = {
		255,
		255,
		168,
		0
	},
	orange_red = {
		255,
		255,
		69,
		0
	},
	dark_orange = {
		255,
		255,
		140,
		0
	},
	orange = {
		255,
		255,
		165,
		0
	},
	gold = {
		255,
		255,
		215,
		0
	},
	dark_golden_rod = {
		255,
		184,
		134,
		11
	},
	golden_rod = {
		255,
		218,
		165,
		32
	},
	pale_golden_rod = {
		255,
		238,
		232,
		170
	},
	dark_khaki = {
		255,
		189,
		183,
		107
	},
	khaki = {
		255,
		240,
		230,
		140
	},
	olive = {
		255,
		128,
		128,
		0
	},
	yellow = {
		255,
		255,
		255,
		0
	},
	yellow_green = {
		255,
		154,
		205,
		50
	},
	online_green = {
		255,
		145,
		226,
		42
	},
	dark_olive_green = {
		255,
		85,
		107,
		47
	},
	olive_drab = {
		255,
		107,
		142,
		35
	},
	lawn_green = {
		255,
		124,
		252,
		0
	},
	chart_reuse = {
		255,
		127,
		255,
		0
	},
	green_yellow = {
		255,
		173,
		255,
		47
	},
	dark_green = {
		255,
		0,
		100,
		0
	},
	green = {
		255,
		0,
		128,
		0
	},
	forest_green = {
		255,
		34,
		139,
		34
	},
	lime = {
		255,
		0,
		255,
		0
	},
	lime_green = {
		255,
		50,
		205,
		50
	},
	light_green = {
		255,
		144,
		238,
		144
	},
	pale_green = {
		255,
		152,
		251,
		152
	},
	dark_sea_green = {
		255,
		143,
		188,
		143
	},
	medium_spring_green = {
		255,
		0,
		250,
		154
	},
	spring_green = {
		255,
		0,
		255,
		127
	},
	sea_green = {
		255,
		46,
		139,
		87
	},
	medium_aqua_marine = {
		255,
		102,
		205,
		170
	},
	medium_sea_green = {
		255,
		60,
		179,
		113
	},
	light_sea_green = {
		255,
		32,
		178,
		170
	},
	dark_slate_gray = {
		255,
		47,
		79,
		79
	},
	teal = {
		255,
		0,
		128,
		128
	},
	dark_cyan = {
		255,
		0,
		139,
		139
	},
	aqua = {
		255,
		0,
		255,
		255
	},
	cyan = {
		255,
		0,
		255,
		255
	},
	light_cyan = {
		255,
		224,
		255,
		255
	},
	dark_turquoise = {
		255,
		0,
		206,
		209
	},
	turquoise = {
		255,
		64,
		224,
		208
	},
	medium_turquoise = {
		255,
		72,
		209,
		204
	},
	pale_turquoise = {
		255,
		175,
		238,
		238
	},
	aqua_marine = {
		255,
		127,
		255,
		212
	},
	powder_blue = {
		255,
		176,
		224,
		230
	},
	cadet_blue = {
		255,
		95,
		158,
		160
	},
	steel_blue = {
		255,
		70,
		130,
		180
	},
	corn_flower_blue = {
		255,
		100,
		149,
		237
	},
	deep_sky_blue = {
		255,
		0,
		191,
		255
	},
	dodger_blue = {
		255,
		30,
		144,
		255
	},
	light_blue = {
		255,
		173,
		216,
		230
	},
	sky_blue = {
		255,
		135,
		206,
		235
	},
	light_sky_blue = {
		255,
		135,
		206,
		250
	},
	midnight_blue = {
		255,
		25,
		25,
		112
	},
	navy = {
		255,
		0,
		0,
		128
	},
	dark_blue = {
		255,
		0,
		0,
		139
	},
	medium_blue = {
		255,
		0,
		0,
		205
	},
	blue = {
		255,
		0,
		0,
		255
	},
	royal_blue = {
		255,
		65,
		105,
		225
	},
	blue_violet = {
		255,
		138,
		43,
		226
	},
	indigo = {
		255,
		75,
		0,
		130
	},
	dark_slate_blue = {
		255,
		72,
		61,
		139
	},
	slate_blue = {
		255,
		106,
		90,
		205
	},
	medium_slate_blue = {
		255,
		123,
		104,
		238
	},
	medium_purple = {
		255,
		147,
		112,
		219
	},
	dark_magenta = {
		255,
		139,
		0,
		139
	},
	dark_violet = {
		255,
		148,
		0,
		211
	},
	dark_orchid = {
		255,
		153,
		50,
		204
	},
	medium_orchid = {
		255,
		186,
		85,
		211
	},
	purple = {
		255,
		128,
		0,
		128
	},
	thistle = {
		255,
		216,
		191,
		216
	},
	plum = {
		255,
		221,
		160,
		221
	},
	violet = {
		255,
		238,
		130,
		238
	},
	magenta = {
		255,
		255,
		0,
		255
	},
	orchid = {
		255,
		218,
		112,
		214
	},
	medium_violet_red = {
		255,
		199,
		21,
		133
	},
	pale_violet_red = {
		255,
		219,
		112,
		147
	},
	deep_pink = {
		255,
		255,
		20,
		147
	},
	hot_pink = {
		255,
		255,
		105,
		180
	},
	light_pink = {
		255,
		255,
		182,
		193
	},
	pink = {
		255,
		255,
		192,
		203
	},
	antique_white = {
		255,
		250,
		235,
		215
	},
	beige = {
		255,
		245,
		245,
		220
	},
	bisque = {
		255,
		255,
		228,
		196
	},
	blanched_almond = {
		255,
		255,
		235,
		205
	},
	wheat = {
		255,
		245,
		222,
		179
	},
	corn_silk = {
		255,
		255,
		248,
		220
	},
	lemon_chiffon = {
		255,
		255,
		250,
		205
	},
	light_golden_rod_yellow = {
		255,
		250,
		250,
		210
	},
	light_yellow = {
		255,
		255,
		255,
		224
	},
	saddle_brown = {
		255,
		139,
		69,
		19
	},
	sienna = {
		255,
		160,
		82,
		45
	},
	chocolate = {
		255,
		210,
		105,
		30
	},
	peru = {
		255,
		205,
		133,
		63
	},
	sandy_brown = {
		255,
		244,
		164,
		96
	},
	burly_wood = {
		255,
		222,
		184,
		135
	},
	tan = {
		255,
		210,
		180,
		140
	},
	rosy_brown = {
		255,
		188,
		143,
		143
	},
	moccasin = {
		255,
		255,
		228,
		181
	},
	navajo_white = {
		255,
		255,
		222,
		173
	},
	peach_puff = {
		255,
		255,
		218,
		185
	},
	misty_rose = {
		255,
		255,
		228,
		225
	},
	lavender_blush = {
		255,
		255,
		240,
		245
	},
	linen = {
		255,
		250,
		240,
		230
	},
	old_lace = {
		255,
		253,
		245,
		230
	},
	papaya_whip = {
		255,
		255,
		239,
		213
	},
	sea_shell = {
		255,
		255,
		245,
		238
	},
	mint_cream = {
		255,
		245,
		255,
		250
	},
	slate_gray = {
		255,
		112,
		128,
		144
	},
	light_slate_gray = {
		255,
		119,
		136,
		153
	},
	light_steel_blue = {
		255,
		176,
		196,
		222
	},
	lavender = {
		255,
		230,
		230,
		250
	},
	floral_white = {
		255,
		255,
		250,
		240
	},
	alice_blue = {
		255,
		240,
		248,
		255
	},
	ghost_white = {
		255,
		248,
		248,
		255
	},
	honeydew = {
		255,
		240,
		255,
		240
	},
	ivory = {
		255,
		255,
		255,
		240
	},
	azure = {
		255,
		240,
		255,
		255
	},
	snow = {
		255,
		255,
		250,
		250
	},
	black = {
		255,
		0,
		0,
		0
	},
	dim_gray = {
		255,
		105,
		105,
		105
	},
	gray = {
		255,
		128,
		128,
		128
	},
	dark_gray = {
		255,
		169,
		169,
		169
	},
	silver = {
		255,
		192,
		192,
		192
	},
	light_gray = {
		255,
		211,
		211,
		211
	},
	gainsboro = {
		255,
		220,
		220,
		220
	},
	white_smoke = {
		255,
		245,
		245,
		245
	},
	white = {
		255,
		255,
		255,
		255
	},
	citadel_abaddon_black = {
		255,
		35,
		31,
		32
	},
	citadel_averland_sunset = {
		255,
		253,
		184,
		37
	},
	citadel_balthasar_gold = {
		255,
		164,
		117,
		82
	},
	citadel_bugmans_glow = {
		255,
		131,
		79,
		68
	},
	citadel_caledor_sky = {
		255,
		57,
		110,
		158
	},
	citadel_caliban_green = {
		255,
		0,
		64,
		31
	},
	citadel_castellan_green = {
		255,
		49,
		72,
		33
	},
	citadel_celestra_grey = {
		255,
		144,
		168,
		168
	},
	citadel_ceramite_white = {
		255,
		255,
		255,
		255
	},
	citadel_daemonette_hide = {
		255,
		105,
		102,
		132
	},
	citadel_death_guard_green = {
		255,
		132,
		138,
		102
	},
	citadel_deathworld_forest = {
		255,
		92,
		103,
		48
	},
	citadel_dryad_bark = {
		255,
		51,
		49,
		45
	},
	citadel_incubi_darkness = {
		255,
		11,
		71,
		74
	},
	citadel_jokaero_orange = {
		255,
		238,
		56,
		35
	},
	citadel_kantor_blue = {
		255,
		0,
		33,
		81
	},
	citadel_khorne_red = {
		255,
		106,
		0,
		1
	},
	citadel_leadbelcher = {
		255,
		136,
		141,
		143
	},
	citadel_macragge_blue = {
		255,
		13,
		64,
		127
	},
	citadel_mechanicus_standard_grey = {
		255,
		61,
		75,
		77
	},
	citadel_mephiston_red = {
		255,
		154,
		17,
		21
	},
	citadel_mournfang_brown = {
		255,
		100,
		9,
		9
	},
	citadel_naggaroth_night = {
		255,
		61,
		51,
		84
	},
	citadel_rakarth_flesh = {
		255,
		162,
		158,
		145
	},
	citadel_ratskin_flesh = {
		255,
		173,
		107,
		76
	},
	citadel_retributor_armour = {
		255,
		195,
		158,
		129
	},
	citadel_rhinox_hide = {
		255,
		73,
		52,
		53
	},
	citadel_screamer_pink = {
		255,
		124,
		22,
		69
	},
	citadel_screaming_bell = {
		255,
		193,
		111,
		69
	},
	citadel_steel_legion_drab = {
		255,
		94,
		81,
		52
	},
	citadel_stegadon_scale_green = {
		255,
		7,
		72,
		99
	},
	citadel_the_fang_grey = {
		255,
		67,
		97,
		116
	},
	citadel_thousand_sons_blue = {
		255,
		24,
		171,
		204
	},
	citadel_waaagh_flesh = {
		255,
		31,
		84,
		41
	},
	citadel_warplock_bronze = {
		255,
		146,
		125,
		123
	},
	citadel_xv88 = {
		255,
		114,
		73,
		30
	},
	citadel_zandri_dust = {
		255,
		158,
		145,
		92
	},
	citadel_administratum_grey = {
		255,
		148,
		155,
		149
	},
	citadel_ahriman_blue = {
		255,
		31,
		140,
		156
	},
	citadel_alaitoc_blue = {
		255,
		41,
		87,
		136
	},
	citadel_altdorf_guard_blue = {
		255,
		31,
		86,
		167
	},
	citadel_auric_armour_gold = {
		255,
		232,
		188,
		109
	},
	citadel_balor_brown = {
		255,
		139,
		89,
		16
	},
	citadel_baneblade_brown = {
		255,
		147,
		127,
		109
	},
	citadel_bestigor_flesh = {
		255,
		211,
		138,
		87
	},
	citadel_brass_scorpion = {
		255,
		183,
		136,
		95
	},
	citadel_cadian_fleshtone = {
		255,
		199,
		121,
		88
	},
	citadel_calgar_blue = {
		255,
		66,
		114,
		184
	},
	citadel_dark_reaper = {
		255,
		59,
		81,
		80
	},
	citadel_dawnstone = {
		255,
		112,
		117,
		110
	},
	citadel_deathclaw_brown = {
		255,
		179,
		104,
		83
	},
	citadel_doombull_brown = {
		255,
		93,
		0,
		9
	},
	citadel_elysian_green = {
		255,
		116,
		143,
		57
	},
	citadel_emperors_children = {
		255,
		185,
		66,
		120
	},
	citadel_eshin_grey = {
		255,
		74,
		79,
		82
	},
	citadel_evil_sunz_scarlet = {
		255,
		194,
		25,
		31
	},
	citadel_fenrisian_grey = {
		255,
		113,
		155,
		183
	},
	citadel_fire_dragon_bright = {
		255,
		245,
		134,
		82
	},
	citadel_flash_gitz_yellow = {
		255,
		255,
		242,
		0
	},
	citadel_flayed_one_flesh = {
		255,
		240,
		217,
		184
	},
	citadel_fulgurite_copper = {
		255,
		252,
		252,
		222
	},
	citadel_gehennas_gold = {
		255,
		219,
		166,
		116
	},
	citadel_genestealer_purple = {
		255,
		119,
		97,
		171
	},
	citadel_gorthor_brown = {
		255,
		101,
		71,
		65
	},
	citadel_hashut_copper = {
		255,
		183,
		118,
		71
	},
	citadel_hoeth_blue = {
		255,
		76,
		127,
		180
	},
	citadel_ironbreaker = {
		255,
		161,
		166,
		169
	},
	citadel_kabalite_green = {
		255,
		3,
		140,
		103
	},
	citadel_karak_stone = {
		255,
		187,
		150,
		98
	},
	citadel_kislev_flesh = {
		255,
		214,
		168,
		117
	},
	citadel_liberator_gold = {
		255,
		211,
		181,
		135
	},
	citadel_loren_forest = {
		255,
		80,
		112,
		45
	},
	citadel_lothern_blue = {
		255,
		52,
		162,
		207
	},
	citadel_moot_green = {
		255,
		82,
		178,
		68
	},
	citadel_nurgling_green = {
		255,
		132,
		156,
		99
	},
	citadel_ogryn_camo = {
		255,
		157,
		169,
		75
	},
	citadel_pallid_wych_flesh = {
		255,
		205,
		206,
		190
	},
	citadel_pink_horror = {
		255,
		144,
		48,
		93
	},
	citadel_runefang_steel = {
		255,
		195,
		202,
		206
	},
	citadel_runelord_brass = {
		255,
		182,
		168,
		154
	},
	citadel_russ_grey = {
		255,
		84,
		117,
		136
	},
	citadel_screaming_skull = {
		255,
		210,
		212,
		162
	},
	citadel_skarsnik_green = {
		255,
		95,
		147,
		112
	},
	citadel_skavenblight_dinge = {
		255,
		71,
		65,
		59
	},
	citadel_skrag_brown = {
		255,
		144,
		73,
		15
	},
	citadel_skullcrusher_brass = {
		255,
		241,
		199,
		142
	},
	citadel_slaanesh_grey = {
		255,
		142,
		140,
		151
	},
	citadel_sotek_green = {
		255,
		11,
		105,
		116
	},
	citadel_squig_orange = {
		255,
		170,
		79,
		68
	},
	citadel_stormhost_silver = {
		255,
		187,
		198,
		201
	},
	citadel_stormvermin_fur = {
		255,
		115,
		107,
		101
	},
	citadel_straken_green = {
		255,
		98,
		129,
		38
	},
	citadel_sybarite_green = {
		255,
		48,
		165,
		108
	},
	citadel_sycorax_bronze = {
		255,
		203,
		179,
		148
	},
	citadel_tallarn_sand = {
		255,
		166,
		118,
		16
	},
	citadel_tau_light_ochre = {
		255,
		191,
		110,
		29
	},
	citadel_teclis_blue = {
		255,
		49,
		126,
		193
	},
	citadel_temple_guard_blue = {
		255,
		51,
		154,
		141
	},
	citadel_thunderhawk_blue = {
		255,
		65,
		112,
		116
	},
	citadel_troll_slayer_orange = {
		255,
		243,
		109,
		45
	},
	citadel_tuskgor_fur = {
		255,
		136,
		54,
		54
	},
	citadel_ulthuan_grey = {
		255,
		199,
		224,
		217
	},
	citadel_ungor_flesh = {
		255,
		214,
		167,
		102
	},
	citadel_ushabti_bone = {
		255,
		187,
		187,
		127
	},
	citadel_warboss_green = {
		255,
		62,
		128,
		93
	},
	citadel_warpfiend_grey = {
		255,
		107,
		106,
		116
	},
	citadel_warpstone_glow = {
		255,
		30,
		115,
		49
	},
	citadel_wazdakka_red = {
		255,
		140,
		10,
		12
	},
	citadel_white_scar = {
		255,
		255,
		255,
		255
	},
	citadel_wild_rider_red = {
		255,
		234,
		47,
		40
	},
	citadel_xereus_purple = {
		255,
		71,
		31,
		95
	},
	citadel_yriel_yellow = {
		255,
		255,
		218,
		0
	},
	citadel_zamesi_desert = {
		255,
		221,
		160,
		38
	},
	citadel_agrax_earthshade = {
		255,
		90,
		87,
		63
	},
	citadel_athonian_camoshade = {
		255,
		109,
		142,
		68
	},
	citadel_bieltan_green = {
		255,
		27,
		161,
		105
	},
	citadel_carroburg_crimson = {
		255,
		168,
		42,
		112
	},
	citadel_casandora_yellow = {
		255,
		254,
		206,
		90
	},
	citadel_coelia_greenshade = {
		255,
		14,
		127,
		120
	},
	citadel_drakenhof_nightshade = {
		255,
		18,
		88,
		153
	},
	citadel_druchii_violet = {
		255,
		122,
		70,
		140
	},
	citadel_fuegan_orange = {
		255,
		199,
		126,
		77
	},
	citadel_nuln_oil = {
		255,
		20,
		16,
		14
	},
	citadel_reikland_fleshshade = {
		255,
		202,
		108,
		77
	},
	citadel_seraphim_sepia = {
		255,
		215,
		130,
		75
	},
	citadel_astorath_red = {
		255,
		221,
		72,
		43
	},
	citadel_changeling_pink = {
		255,
		244,
		175,
		205
	},
	citadel_chronus_blue = {
		255,
		114,
		168,
		209
	},
	citadel_eldar_flesh = {
		255,
		236,
		192,
		131
	},
	citadel_etherium_blue = {
		255,
		162,
		186,
		210
	},
	citadel_golden_griffon = {
		255,
		169,
		144,
		88
	},
	citadel_golgfag_brown = {
		255,
		194,
		128,
		79
	},
	citadel_hellion_green = {
		255,
		132,
		195,
		170
	},
	citadel_hexos_palesun = {
		255,
		255,
		242,
		0
	},
	citadel_imrik_blue = {
		255,
		103,
		174,
		208
	},
	citadel_kindleflame = {
		255,
		247,
		158,
		134
	},
	citadel_longbeard_grey = {
		255,
		206,
		206,
		175
	},
	citadel_lucius_lilac = {
		255,
		182,
		159,
		204
	},
	citadel_necron_compound = {
		255,
		130,
		139,
		142
	},
	citadel_niblet_green = {
		255,
		125,
		199,
		52
	},
	citadel_praxeti_white = {
		255,
		255,
		255,
		255
	},
	citadel_ryza_rust = {
		255,
		236,
		99,
		26
	},
	citadel_sigmarite = {
		255,
		202,
		173,
		118
	},
	citadel_skink_blue = {
		255,
		88,
		193,
		205
	},
	citadel_stormfang = {
		255,
		128,
		167,
		193
	},
	citadel_sylvaneth_bark = {
		255,
		172,
		130,
		98
	},
	citadel_terminatus_stone = {
		255,
		189,
		177,
		146
	},
	citadel_tyrant_skull = {
		255,
		205,
		197,
		134
	},
	citadel_underhive_ash = {
		255,
		192,
		189,
		129
	},
	citadel_verminlord_hide = {
		255,
		161,
		105,
		84
	},
	citadel_wrack_white = {
		255,
		252,
		251,
		25
	},
	citadel_baharroth_blue = {
		255,
		88,
		193,
		205
	},
	citadel_blue_horror = {
		255,
		162,
		186,
		210
	},
	citadel_dechala_lilac = {
		255,
		182,
		159,
		204
	},
	citadel_dorn_yellow = {
		255,
		255,
		242,
		0
	},
	citadel_fulgrim_pink = {
		255,
		244,
		175,
		205
	},
	citadel_gauss_blaster_green = {
		255,
		132,
		195,
		170
	},
	citadel_krieg_khaki = {
		255,
		192,
		189,
		129
	},
	citadel_lugganath_orange = {
		255,
		247,
		158,
		13
	},
	citadel_bloodletter = {
		255,
		243,
		115,
		85
	},
	citadel_guilliman_blue = {
		255,
		47,
		154,
		214
	},
	citadel_lamenters_yellow = {
		255,
		255,
		245,
		107
	},
	citadel_waywatcher_green = {
		255,
		109,
		192,
		10
	},
	ui_brown_light = {
		255,
		194,
		154,
		116
	},
	ui_brown_super_light = {
		255,
		255,
		242,
		230
	},
	ui_brown_medium = {
		255,
		156,
		87,
		22
	},
	ui_brown_dark = {
		255,
		93,
		58,
		27
	},
	ui_green_light = {
		255,
		74,
		199,
		60
	},
	ui_green_super_light = {
		255,
		249,
		255,
		152
	},
	ui_green_medium = {
		255,
		61,
		112,
		55
	},
	ui_grey_light = {
		255,
		152,
		152,
		152
	},
	ui_grey_medium = {
		255,
		102,
		102,
		102
	},
	ui_orange_light = {
		255,
		255,
		183,
		44
	},
	ui_orange_medium = {
		255,
		245,
		121,
		21
	},
	ui_orange_dark = {
		255,
		148,
		46,
		14
	},
	ui_red_light = {
		255,
		255,
		54,
		36
	},
	ui_red_super_light = {
		255,
		242,
		122,
		99
	},
	ui_red_medium = {
		255,
		158,
		28,
		16
	},
	ui_blue_light = {
		255,
		107,
		209,
		241
	},
	ui_chalk_grey = {
		255,
		102,
		102,
		102
	},
	ui_interaction_default = {
		255,
		91,
		121,
		82
	},
	ui_interaction_mission = {
		255,
		216,
		237,
		190
	},
	ui_interaction_pickup = {
		255,
		91,
		121,
		82
	},
	ui_interaction_critical = {
		255,
		246,
		69,
		69
	},
	ui_interaction_point_of_interest = {
		255,
		176,
		150,
		99
	},
	ui_input_color = {
		255,
		226,
		199,
		126
	},
	ui_health_default = {
		255,
		245,
		121,
		21
	},
	ui_health_critical = {
		255,
		245,
		121,
		21
	},
	ui_health_ghost = {
		255,
		251,
		195,
		86
	},
	ui_ability_purple = {
		255,
		102,
		38,
		98
	},
	ui_toughness_default = {
		255,
		108,
		187,
		196
	},
	ui_toughness_medium = {
		255,
		62,
		143,
		155
	},
	ui_toughness_buffed = {
		255,
		196,
		195,
		108
	},
	ui_highlight_color = {
		255,
		245,
		121,
		21
	},
	ui_corruption_default = {
		255,
		166,
		93,
		172
	},
	ui_corruption_medium = {
		255,
		130,
		66,
		170
	},
	ui_disabled_text_color = {
		255,
		60,
		60,
		60
	},
	ui_terminal = {
		255,
		226,
		199,
		126
	},
	ui_terminal_dark = {
		255,
		192,
		169,
		106
	},
	ui_terminal_highlight = {
		255,
		226,
		216,
		0
	},
	ui_difficulty_1 = {
		255,
		0,
		255,
		204
	},
	ui_difficulty_2 = {
		255,
		192,
		255,
		0
	},
	ui_difficulty_3 = {
		255,
		255,
		234,
		0
	},
	ui_difficulty_4 = {
		255,
		255,
		84,
		0
	},
	ui_difficulty_5 = {
		255,
		255,
		0,
		0
	},
	ui_hud_green_super_light = {
		255,
		216,
		237,
		190
	},
	ui_hud_green_light = {
		255,
		91,
		121,
		82
	},
	ui_hud_green_medium = {
		255,
		43,
		58,
		43
	},
	ui_hud_green_dark = {
		255,
		18,
		20,
		18
	},
	ui_hud_red_super_light = {
		255,
		240,
		201,
		201
	},
	ui_hud_red_light = {
		255,
		246,
		69,
		69
	},
	ui_hud_red_medium = {
		255,
		81,
		46,
		46
	},
	ui_hud_red_dark = {
		255,
		35,
		16,
		21
	},
	ui_hud_overcharge_low = {
		255,
		251,
		195,
		86
	},
	ui_hud_overcharge_medium = {
		255,
		245,
		121,
		21
	},
	ui_hud_overcharge_high = {
		255,
		246,
		69,
		69
	},
	ui_hud_yellow_super_light = {
		255,
		218,
		186,
		126
	},
	ui_hud_yellow_light = {
		255,
		121,
		106,
		77
	},
	ui_hud_yellow_medium = {
		255,
		63,
		56,
		43
	},
	item_rarity_1 = {
		255,
		152,
		152,
		152
	},
	item_rarity_2 = {
		255,
		74,
		177,
		85
	},
	item_rarity_3 = {
		255,
		76,
		132,
		196
	},
	item_rarity_4 = {
		255,
		143,
		94,
		196
	},
	item_rarity_5 = {
		255,
		208,
		136,
		48
	},
	item_rarity_6 = {
		255,
		198,
		52,
		53
	},
	item_rarity_dark_1 = {
		255,
		95,
		95,
		95
	},
	item_rarity_dark_2 = {
		255,
		42,
		99,
		48
	},
	item_rarity_dark_3 = {
		255,
		49,
		86,
		129
	},
	item_rarity_dark_4 = {
		255,
		83,
		55,
		114
	},
	item_rarity_dark_5 = {
		255,
		128,
		84,
		30
	},
	item_rarity_dark_6 = {
		255,
		119,
		31,
		31
	},
	ui_achievement_icon = {
		255,
		143,
		106,
		106
	},
	ui_achievement_icon_hover = {
		255,
		160,
		120,
		120
	},
	ui_achievement_icon_completed = {
		255,
		242,
		228,
		157
	},
	ui_achievement_icon_completed_hover = {
		255,
		255,
		245,
		163
	},
	ui_veteran = {
		255,
		100,
		172,
		28
	},
	ui_zealot = {
		255,
		204,
		26,
		28
	},
	ui_psyker = {
		255,
		59,
		102,
		150
	},
	ui_ogryn = {
		255,
		188,
		138,
		67
	},
	ui_veteran_text = {
		255,
		117,
		129,
		93
	},
	ui_zealot_text = {
		255,
		142,
		78,
		74
	},
	ui_psyker_text = {
		255,
		115,
		129,
		144
	},
	ui_ogryn_text = {
		255,
		137,
		118,
		87
	},
	player_slot_1 = {
		255,
		226,
		210,
		117
	},
	player_slot_2 = {
		255,
		180,
		88,
		108
	},
	player_slot_3 = {
		255,
		84,
		172,
		121
	},
	player_slot_4 = {
		255,
		126,
		153,
		230
	},
	player_slot_1_bright = {
		255,
		255,
		240,
		24
	},
	player_slot_2_bright = {
		255,
		224,
		54,
		82
	},
	player_slot_3_bright = {
		255,
		79,
		216,
		132
	},
	player_slot_4_bright = {
		255,
		96,
		138,
		255
	},
	text_default = {
		255,
		204,
		204,
		204
	},
	terminal_background = {
		100,
		49,
		56,
		49
	},
	terminal_background_dark = {
		100,
		0,
		0,
		0
	},
	terminal_background_selected = {
		100,
		167,
		129,
		64
	},
	terminal_background_gradient = {
		255,
		101,
		133,
		96
	},
	terminal_background_gradient_selected = {
		255,
		167,
		129,
		64
	},
	terminal_grid_background = {
		255,
		90,
		115,
		83
	},
	terminal_grid_background_gradient = {
		100,
		67,
		75,
		64
	},
	terminal_grid_background_icon = {
		30,
		67,
		75,
		64
	},
	terminal_frame = {
		255,
		60,
		78,
		57
	},
	terminal_frame_hover = {
		255,
		113,
		126,
		103
	},
	terminal_frame_selected = {
		150,
		167,
		129,
		64
	},
	terminal_corner = {
		255,
		121,
		136,
		109
	},
	terminal_corner_hover = {
		255,
		169,
		191,
		153
	},
	terminal_corner_selected = {
		255,
		250,
		189,
		73
	},
	terminal_icon = {
		255,
		216,
		229,
		207
	},
	terminal_icon_selected = {
		255,
		255,
		242,
		230
	},
	terminal_text_key_value = {
		255,
		239,
		193,
		82
	},
	terminal_text_header = {
		255,
		216,
		229,
		207
	},
	terminal_text_header_disabled = {
		255,
		64,
		64,
		64
	},
	terminal_text_header_selected = {
		255,
		255,
		242,
		230
	},
	terminal_text_body = {
		255,
		169,
		191,
		153
	},
	terminal_text_body_dark = {
		255,
		88,
		99,
		80
	},
	terminal_text_body_sub_header = {
		255,
		113,
		126,
		103
	},
	terminal_text_warning_dark = {
		255,
		200,
		140,
		20
	},
	terminal_text_warning_light = {
		255,
		255,
		170,
		30
	},
	legend_button_text = {
		255,
		204,
		204,
		204
	},
	legend_button_text_hover = {
		255,
		255,
		242,
		230
	}
}
local color_list = {}
local short_color_list = {}

for name, color in pairs(color_definitions) do
	Color[name] = function (alpha, as_array)
		alpha = alpha or color[1]

		if as_array then
			return {
				alpha,
				color[2],
				color[3],
				color[4]
			}
		else
			return Color(alpha, color[2], color[3], color[4])
		end
	end

	local index = #color_list + 1
	color_list[index] = name

	if index % 10 == 0 then
		short_color_list[index / 10] = name
	end
end

Color.list = color_list
Color.short_list = short_color_list

Color.lerp = function (from, to, t)
	local a1, r1, g1, b1 = Quaternion.to_elements(from)
	local a2, r2, g2, b2 = Quaternion.to_elements(to)
	local a, r, g, b = nil
	a = math.lerp(a1, a2, t)
	r = math.lerp(r1, r2, t)
	g = math.lerp(g1, g2, t)
	b = math.lerp(b1, b2, t)

	return Color(a, r, g, b)
end

if not COLORS_INITIALIZED then
	COLORS_INITIALIZED = true
end
