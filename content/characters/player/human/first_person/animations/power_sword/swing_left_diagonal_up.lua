local spline_matrices = {
	[0] = {
		0.816299,
		-0.428806,
		-0.387016,
		0,
		-0.56177,
		-0.745267,
		-0.359154,
		0,
		-0.134423,
		0.510591,
		-0.849251,
		0,
		-0.086798,
		0.027904,
		-0.661862,
		1
	},
	{
		0.839675,
		-0.225645,
		-0.493995,
		0,
		-0.415398,
		-0.852785,
		-0.316548,
		0,
		-0.349844,
		0.471002,
		-0.809794,
		0,
		-0.1241,
		-0.015235,
		-0.603132,
		1
	},
	[0.0166666666667] = {
		0.733018,
		-0.51575,
		-0.443494,
		0,
		-0.676376,
		-0.62178,
		-0.394848,
		0,
		-0.072113,
		0.589399,
		-0.804617,
		0,
		-0.048061,
		0.07572,
		-0.639223,
		1
	},
	[0.0333333333333] = {
		0.625474,
		-0.59403,
		-0.505876,
		0,
		-0.77986,
		-0.455615,
		-0.429224,
		0,
		0.024487,
		0.662981,
		-0.748236,
		0,
		-0.000942,
		0.124912,
		-0.617558,
		1
	},
	[0.05] = {
		0.486612,
		-0.653646,
		-0.579618,
		0,
		-0.859259,
		-0.238303,
		-0.452643,
		0,
		0.157743,
		0.718303,
		-0.677612,
		0,
		0.053369,
		0.175633,
		-0.595442,
		1
	},
	[0.0666666666667] = {
		0.314532,
		-0.676383,
		-0.666015,
		0,
		-0.892063,
		0.029224,
		-0.450965,
		0,
		0.324489,
		0.73597,
		-0.594184,
		0,
		0.113908,
		0.226893,
		-0.571529,
		1
	},
	[0.0833333333333] = {
		0.119491,
		-0.64007,
		-0.758968,
		0,
		-0.852274,
		0.325986,
		-0.4091,
		0,
		0.509266,
		0.695732,
		-0.506562,
		0,
		0.179124,
		0.276307,
		-0.544958,
		1
	},
	[0.116666666667] = {
		-0.230518,
		-0.361421,
		-0.903458,
		0,
		-0.533178,
		0.823593,
		-0.19343,
		0,
		0.813991,
		0.437115,
		-0.382555,
		0,
		0.309263,
		0.358741,
		-0.485353,
		1
	},
	[0.133333333333] = {
		-0.334924,
		-0.162347,
		-0.928154,
		0,
		-0.314774,
		0.947731,
		-0.052185,
		0,
		0.888112,
		0.274681,
		-0.36852,
		0,
		0.36428,
		0.390813,
		-0.454613,
		1
	},
	[0.15] = {
		-0.389631,
		0.029177,
		-0.920509,
		0,
		-0.118775,
		0.989559,
		0.081641,
		0,
		0.91328,
		0.141143,
		-0.382097,
		0,
		0.406981,
		0.420325,
		-0.423906,
		1
	},
	[0.166666666667] = {
		-0.414059,
		0.189453,
		-0.890316,
		0,
		0.024417,
		0.98006,
		0.197195,
		0,
		0.909922,
		0.059911,
		-0.410429,
		0,
		0.434956,
		0.451113,
		-0.392439,
		1
	},
	[0.183333333333] = {
		-0.430544,
		0.309546,
		-0.847829,
		0,
		0.103235,
		0.950074,
		0.294452,
		0,
		0.896646,
		0.039249,
		-0.441005,
		0,
		0.447051,
		0.485759,
		-0.358893,
		1
	},
	[0.1] = {
		-0.072776,
		-0.531587,
		-0.843871,
		0,
		-0.726925,
		0.607578,
		-0.320046,
		0,
		0.68285,
		0.590139,
		-0.430641,
		0,
		0.245864,
		0.320849,
		-0.515864,
		1
	},
	[0.216666666667] = {
		-0.539144,
		0.388554,
		-0.747228,
		0,
		-0.016508,
		0.882173,
		0.470636,
		0,
		0.842052,
		0.266076,
		-0.469203,
		0,
		0.394334,
		0.583925,
		-0.274119,
		1
	},
	[0.233333333333] = {
		-0.63827,
		0.315328,
		-0.702267,
		0,
		-0.257943,
		0.771919,
		0.581039,
		0,
		0.725312,
		0.552005,
		-0.411356,
		0,
		0.296333,
		0.645076,
		-0.208083,
		1
	},
	[0.25] = {
		-0.695656,
		0.18893,
		-0.693086,
		0,
		-0.547436,
		0.485306,
		0.681756,
		0,
		0.465163,
		0.853688,
		-0.234179,
		0,
		0.145724,
		0.699735,
		-0.116916,
		1
	},
	[0.266666666667] = {
		-0.684235,
		0.065362,
		-0.726326,
		0,
		-0.720011,
		0.097585,
		0.687067,
		0,
		0.115787,
		0.993079,
		-0.01971,
		0,
		-0.015514,
		0.712317,
		-0.026347,
		1
	},
	[0.283333333333] = {
		-0.612912,
		0.035245,
		-0.789365,
		0,
		-0.784206,
		-0.149456,
		0.602233,
		0,
		-0.096749,
		0.98814,
		0.119243,
		0,
		-0.145084,
		0.648972,
		0.039761,
		1
	},
	[0.2] = {
		-0.456947,
		0.386995,
		-0.800896,
		0,
		0.114045,
		0.918453,
		0.378731,
		0,
		0.882152,
		0.081722,
		-0.463819,
		0,
		0.442022,
		0.525961,
		-0.321968,
		1
	},
	[0.316666666667] = {
		-0.615277,
		-0.030961,
		-0.787703,
		0,
		-0.647172,
		-0.550705,
		0.527154,
		0,
		-0.450113,
		0.834125,
		0.318799,
		0,
		-0.31512,
		0.438823,
		0.124084,
		1
	},
	[0.333333333333] = {
		-0.684809,
		-0.136701,
		-0.715786,
		0,
		-0.431575,
		-0.71538,
		0.549521,
		0,
		-0.587179,
		0.685233,
		0.430902,
		0,
		-0.355235,
		0.317491,
		0.149353,
		1
	},
	[0.35] = {
		-0.694196,
		-0.227553,
		-0.68287,
		0,
		-0.209621,
		-0.843676,
		0.494236,
		0,
		-0.688587,
		0.48624,
		0.537977,
		0,
		-0.382371,
		0.205889,
		0.167644,
		1
	},
	[0.366666666667] = {
		-0.630451,
		-0.242621,
		-0.737337,
		0,
		0.002908,
		-0.950628,
		0.310318,
		0,
		-0.776223,
		0.193497,
		0.60003,
		0,
		-0.391814,
		0.111062,
		0.179234,
		1
	},
	[0.383333333333] = {
		-0.549635,
		-0.187452,
		-0.814102,
		0,
		0.182185,
		-0.977941,
		0.102175,
		0,
		-0.815297,
		-0.092158,
		0.571662,
		0,
		-0.38961,
		0.028732,
		0.174167,
		1
	},
	[0.3] = {
		-0.56329,
		0.030245,
		-0.825706,
		0,
		-0.780193,
		-0.348485,
		0.519477,
		0,
		-0.272035,
		0.936826,
		0.219895,
		0,
		-0.24943,
		0.550255,
		0.088432,
		1
	},
	[0.416666666667] = {
		-0.404149,
		0.020136,
		-0.914471,
		0,
		0.273156,
		-0.95148,
		-0.141672,
		0,
		-0.872954,
		-0.30705,
		0.37904,
		0,
		-0.399035,
		-0.106516,
		0.108271,
		1
	},
	[0.433333333333] = {
		-0.34282,
		0.098316,
		-0.934242,
		0,
		0.301356,
		-0.930437,
		-0.208498,
		0,
		-0.889752,
		-0.353017,
		0.289344,
		0,
		-0.387762,
		-0.140458,
		0.056433,
		1
	},
	[0.45] = {
		-0.283207,
		0.167314,
		-0.944351,
		0,
		0.323941,
		-0.910106,
		-0.258395,
		0,
		-0.902694,
		-0.379094,
		0.203549,
		0,
		-0.369227,
		-0.163354,
		-0.006578,
		1
	},
	[0.466666666667] = {
		-0.225672,
		0.226467,
		-0.947515,
		0,
		0.340985,
		-0.89272,
		-0.294584,
		0,
		-0.912579,
		-0.389568,
		0.12424,
		0,
		-0.347068,
		-0.177499,
		-0.073061,
		1
	},
	[0.483333333333] = {
		-0.17079,
		0.275696,
		-0.945951,
		0,
		0.352779,
		-0.879301,
		-0.319965,
		0,
		-0.919988,
		-0.388358,
		0.052917,
		0,
		-0.324889,
		-0.185092,
		-0.135349,
		1
	},
	[0.4] = {
		-0.476067,
		-0.086777,
		-0.875117,
		0,
		0.249529,
		-0.967549,
		-0.039803,
		0,
		-0.843265,
		-0.237316,
		0.482272,
		0,
		-0.396645,
		-0.048052,
		0.148301,
		1
	},
	[0.516666666667] = {
		-0.07246,
		0.345815,
		-0.935501,
		0,
		0.362632,
		-0.864637,
		-0.347708,
		0,
		-0.929111,
		-0.364437,
		-0.062752,
		0,
		-0.294735,
		-0.189165,
		-0.21664,
		1
	},
	[0.533333333333] = {
		-0.028085,
		0.370222,
		-0.928519,
		0,
		0.362556,
		-0.861861,
		-0.35461,
		0,
		-0.931539,
		-0.346599,
		-0.110021,
		0,
		-0.287957,
		-0.189253,
		-0.234939,
		1
	},
	[0.55] = {
		0.016521,
		0.390956,
		-0.920261,
		0,
		0.360231,
		-0.860905,
		-0.359273,
		0,
		-0.932717,
		-0.325571,
		-0.155058,
		0,
		-0.281257,
		-0.188654,
		-0.252791,
		1
	},
	[0.566666666667] = {
		0.061376,
		0.407999,
		-0.910917,
		0,
		0.355577,
		-0.861699,
		-0.361995,
		0,
		-0.93263,
		-0.301683,
		-0.197962,
		0,
		-0.274646,
		-0.187399,
		-0.270211,
		1
	},
	[0.583333333333] = {
		0.106473,
		0.421327,
		-0.900637,
		0,
		0.348519,
		-0.864135,
		-0.363049,
		0,
		-0.931235,
		-0.275234,
		-0.238848,
		0,
		-0.26813,
		-0.185513,
		-0.287218,
		1
	},
	[0.5] = {
		-0.119375,
		0.315291,
		-0.941457,
		0,
		0.359784,
		-0.870051,
		-0.336997,
		0,
		-0.925367,
		-0.37895,
		-0.009575,
		0,
		-0.306266,
		-0.188276,
		-0.18577,
		1
	},
	[0.616666666667] = {
		0.197228,
		0.436744,
		-0.877699,
		0,
		0.326943,
		-0.873334,
		-0.361105,
		0,
		-0.924234,
		-0.215738,
		-0.315037,
		0,
		-0.255399,
		-0.179952,
		-0.320052,
		1
	},
	[0.633333333333] = {
		0.242728,
		0.438783,
		-0.865189,
		0,
		0.312325,
		-0.879721,
		-0.358531,
		0,
		-0.918442,
		-0.183195,
		-0.350576,
		0,
		-0.249185,
		-0.176322,
		-0.33591,
		1
	},
	[0.65] = {
		0.288149,
		0.437015,
		-0.852049,
		0,
		0.295111,
		-0.887008,
		-0.355143,
		0,
		-0.910977,
		-0.149115,
		-0.384559,
		0,
		-0.243066,
		-0.172154,
		-0.351411,
		1
	},
	[0.666666666667] = {
		0.333332,
		0.43143,
		-0.838307,
		0,
		0.275293,
		-0.894948,
		-0.351116,
		0,
		-0.901723,
		-0.113741,
		-0.417084,
		0,
		-0.237035,
		-0.167472,
		-0.366569,
		1
	},
	[0.683333333333] = {
		0.378083,
		0.422033,
		-0.823979,
		0,
		0.252884,
		-0.903277,
		-0.346612,
		0,
		-0.890563,
		-0.077323,
		-0.448239,
		0,
		-0.231084,
		-0.162296,
		-0.381395,
		1
	},
	[0.6] = {
		0.151778,
		0.430917,
		-0.889536,
		0,
		0.338993,
		-0.868071,
		-0.362678,
		0,
		-0.928465,
		-0.2465,
		-0.277832,
		0,
		-0.261714,
		-0.183023,
		-0.303827,
		1
	},
	[0.716666666667] = {
		0.465375,
		0.391943,
		-0.793604,
		0,
		0.200505,
		-0.919987,
		-0.336783,
		0,
		-0.862104,
		-0.002391,
		-0.506725,
		0,
		-0.219367,
		-0.150558,
		-0.410085,
		1
	},
	[0.733333333333] = {
		0.507399,
		0.371394,
		-0.777568,
		0,
		0.170722,
		-0.927793,
		-0.331743,
		0,
		-0.84463,
		0.035578,
		-0.534167,
		0,
		-0.213569,
		-0.144048,
		-0.423967,
		1
	},
	[0.75] = {
		0.547931,
		0.347336,
		-0.761005,
		0,
		0.138715,
		-0.934855,
		-0.326809,
		0,
		-0.824942,
		0.073506,
		-0.560417,
		0,
		-0.207808,
		-0.137148,
		-0.437538,
		1
	},
	[0.766666666667] = {
		0.586638,
		0.319941,
		-0.743971,
		0,
		0.104655,
		-0.940901,
		-0.322107,
		0,
		-0.803058,
		0.1111,
		-0.585452,
		0,
		-0.202094,
		-0.129889,
		-0.450791,
		1
	},
	[0.783333333333] = {
		0.623228,
		0.289429,
		-0.726511,
		0,
		0.068772,
		-0.945679,
		-0.317746,
		0,
		-0.779011,
		0.148064,
		-0.609278,
		0,
		-0.196417,
		-0.122307,
		-0.463728,
		1
	},
	[0.7] = {
		0.42218,
		0.408852,
		-0.809076,
		0,
		0.22793,
		-0.911719,
		-0.341785,
		0,
		-0.877389,
		-0.040118,
		-0.478099,
		0,
		-0.2252,
		-0.15665,
		-0.395897,
		1
	},
	[0.816666666667] = {
		0.688975,
		0.220169,
		-0.690535,
		0,
		-0.007357,
		-0.950572,
		-0.310418,
		0,
		-0.724748,
		0.21895,
		-0.6533,
		0,
		-0.185139,
		-0.106328,
		-0.488661,
		1
	},
	[0.833333333333] = {
		0.717669,
		0.182091,
		-0.672156,
		0,
		-0.046965,
		-0.950355,
		-0.307602,
		0,
		-0.694798,
		0.252325,
		-0.673489,
		0,
		-0.179522,
		-0.098019,
		-0.500658,
		1
	},
	[0.85] = {
		0.74334,
		0.142227,
		-0.653619,
		0,
		-0.087135,
		-0.94822,
		-0.305428,
		0,
		-0.663215,
		0.28399,
		-0.692457,
		0,
		-0.173911,
		-0.08956,
		-0.51234,
		1
	},
	[0.866666666667] = {
		0.765873,
		0.100998,
		-0.63501,
		0,
		-0.127495,
		-0.944124,
		-0.303932,
		0,
		-0.630225,
		0.313734,
		-0.710202,
		0,
		-0.168304,
		-0.081001,
		-0.523707,
		1
	},
	[0.883333333333] = {
		0.785216,
		0.058845,
		-0.61642,
		0,
		-0.167671,
		-0.93808,
		-0.303136,
		0,
		-0.596089,
		0.341383,
		-0.726729,
		0,
		-0.162698,
		-0.072396,
		-0.534758,
		1
	},
	[0.8] = {
		0.657423,
		0.256067,
		-0.708678,
		0,
		0.031334,
		-0.948965,
		-0.313822,
		0,
		-0.75287,
		0.184108,
		-0.631895,
		0,
		-0.190768,
		-0.114439,
		-0.476351,
		1
	},
	[0.916666666667] = {
		0.814434,
		-0.026441,
		-0.579653,
		0,
		-0.246003,
		-0.920476,
		-0.303655,
		0,
		-0.525528,
		0.389904,
		-0.756172,
		0,
		-0.151505,
		-0.05527,
		-0.555903,
		1
	},
	[0.933333333333] = {
		0.824518,
		-0.068682,
		-0.561652,
		0,
		-0.283471,
		-0.9092,
		-0.30496,
		0,
		-0.489709,
		0.410657,
		-0.769121,
		0,
		-0.145932,
		-0.04685,
		-0.565995,
		1
	},
	[0.95] = {
		0.831822,
		-0.110084,
		-0.544017,
		0,
		-0.319393,
		-0.896533,
		-0.306947,
		0,
		-0.453939,
		0.42908,
		-0.780916,
		0,
		-0.14039,
		-0.038583,
		-0.575766,
		1
	},
	[0.966666666667] = {
		0.836588,
		-0.150266,
		-0.526822,
		0,
		-0.3535,
		-0.882724,
		-0.309574,
		0,
		-0.418519,
		0.445218,
		-0.791595,
		0,
		-0.134892,
		-0.030524,
		-0.585213,
		1
	},
	[0.983333333333] = {
		0.8391,
		-0.188888,
		-0.51013,
		0,
		-0.385566,
		-0.868044,
		-0.312793,
		0,
		-0.383733,
		0.459153,
		-0.801204,
		0,
		-0.129456,
		-0.022724,
		-0.594336,
		1
	},
	[0.9] = {
		0.801378,
		0.016216,
		-0.597938,
		0,
		-0.207293,
		-0.930157,
		-0.303047,
		0,
		-0.56109,
		0.366803,
		-0.742046,
		0,
		-0.157097,
		-0.0638,
		-0.54549,
		1
	},
	[1.01666666667] = {
		0.838653,
		-0.260275,
		-0.478454,
		0,
		-0.442847,
		-0.837249,
		-0.320782,
		0,
		-0.317093,
		0.480906,
		-0.817423,
		0,
		-0.118847,
		-0.008106,
		-0.611602,
		1
	},
	[1.03333333333] = {
		0.836388,
		-0.29256,
		-0.463533,
		0,
		-0.467796,
		-0.821741,
		-0.325435,
		0,
		-0.285695,
		0.489029,
		-0.824153,
		0,
		-0.113718,
		-0.001386,
		-0.619747,
		1
	},
	[1.05] = {
		0.83324,
		-0.322315,
		-0.449248,
		0,
		-0.490161,
		-0.806563,
		-0.330451,
		0,
		-0.255837,
		0.495549,
		-0.830047,
		0,
		-0.108735,
		0.00488,
		-0.627566,
		1
	},
	[1.06666666667] = {
		0.829565,
		-0.349393,
		-0.435598,
		0,
		-0.509886,
		-0.792006,
		-0.335773,
		0,
		-0.227679,
		0.500651,
		-0.835171,
		0,
		-0.103921,
		0.010648,
		-0.635062,
		1
	},
	[1.08333333333] = {
		0.825712,
		-0.373673,
		-0.422574,
		0,
		-0.526931,
		-0.778347,
		-0.34135,
		0,
		-0.201356,
		0.504523,
		-0.83959,
		0,
		-0.099299,
		0.015875,
		-0.642237,
		1
	},
	[1.11666666667] = {
		0.818777,
		-0.41346,
		-0.398316,
		0,
		-0.552892,
		-0.754748,
		-0.35308,
		0,
		-0.154644,
		0.50932,
		-0.846569,
		0,
		-0.090717,
		0.024542,
		-0.655634,
		1
	},
	[1.13333333333] = {
		0.816299,
		-0.428806,
		-0.387017,
		0,
		-0.561771,
		-0.745267,
		-0.359153,
		0,
		-0.134424,
		0.510591,
		-0.849251,
		0,
		-0.086798,
		0.027905,
		-0.661862,
		1
	},
	[1.1] = {
		0.822011,
		-0.395056,
		-0.410156,
		0,
		-0.541272,
		-0.765848,
		-0.347133,
		0,
		-0.17698,
		0.507353,
		-0.843369,
		0,
		-0.09489,
		0.02052,
		-0.649093,
		1
	}
}

return spline_matrices