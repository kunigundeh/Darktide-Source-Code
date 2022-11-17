local spline_matrices = {
	[0] = {
		0.364574,
		0.720357,
		0.59006,
		0,
		-0.463562,
		-0.409167,
		0.785934,
		0,
		0.807587,
		-0.560061,
		0.184759,
		0,
		0.391777,
		-0.121781,
		-0.615828,
		1
	},
	{
		-0.533801,
		0.613908,
		0.581527,
		0,
		0.830868,
		0.508634,
		0.225722,
		0,
		-0.157212,
		0.603662,
		-0.781586,
		0,
		-0.022118,
		0.062868,
		-0.60953,
		1
	},
	[0.0166666666667] = {
		0.292979,
		0.610512,
		0.735825,
		0,
		-0.612739,
		-0.470896,
		0.634672,
		0,
		0.733972,
		-0.636814,
		0.236122,
		0,
		0.434292,
		-0.083834,
		-0.51398,
		1
	},
	[0.0333333333333] = {
		0.162491,
		0.47616,
		0.864215,
		0,
		-0.735786,
		-0.525097,
		0.427658,
		0,
		0.657431,
		-0.705369,
		0.265028,
		0,
		0.470478,
		-0.037966,
		-0.410114,
		1
	},
	[0.05] = {
		-0.01597,
		0.322943,
		0.946284,
		0,
		-0.81056,
		-0.558313,
		0.176859,
		0,
		0.585438,
		-0.764195,
		0.270681,
		0,
		0.498033,
		0.010621,
		-0.324474,
		1
	},
	[0.0666666666667] = {
		-0.243543,
		0.199409,
		0.94917,
		0,
		-0.810404,
		-0.579497,
		-0.086192,
		0,
		0.532854,
		-0.790202,
		0.302734,
		0,
		0.515004,
		0.05523,
		-0.254625,
		1
	},
	[0.0833333333333] = {
		-0.335725,
		0.115375,
		0.934867,
		0,
		-0.790892,
		-0.573604,
		-0.213231,
		0,
		0.511642,
		-0.810967,
		0.283823,
		0,
		0.536137,
		0.097463,
		-0.189418,
		1
	},
	[0.116666666667] = {
		-0.365748,
		-0.013287,
		0.930619,
		0,
		-0.779362,
		-0.542191,
		-0.314043,
		0,
		0.508746,
		-0.84015,
		0.187949,
		0,
		0.587821,
		0.198019,
		-0.041277,
		1
	},
	[0.133333333333] = {
		-0.36304,
		-0.04412,
		0.930729,
		0,
		-0.769733,
		-0.548699,
		-0.326252,
		0,
		0.525084,
		-0.834855,
		0.165239,
		0,
		0.60513,
		0.260127,
		0.014198,
		1
	},
	[0.15] = {
		-0.36569,
		-0.010721,
		0.930675,
		0,
		-0.772347,
		-0.554493,
		-0.309866,
		0,
		0.519375,
		-0.832119,
		0.194492,
		0,
		0.595621,
		0.304965,
		0.031572,
		1
	},
	[0.166666666667] = {
		-0.365171,
		0.015902,
		0.930805,
		0,
		-0.706405,
		-0.655953,
		-0.265928,
		0,
		0.606335,
		-0.754634,
		0.250768,
		0,
		0.57061,
		0.36584,
		0.018636,
		1
	},
	[0.183333333333] = {
		-0.374322,
		-0.062244,
		0.925207,
		0,
		-0.350912,
		-0.914036,
		-0.203465,
		0,
		0.858338,
		-0.400828,
		0.320302,
		0,
		0.50632,
		0.475212,
		-0.004467,
		1
	},
	[0.1] = {
		-0.366933,
		0.044283,
		0.929193,
		0,
		-0.781353,
		-0.556735,
		-0.282019,
		0,
		0.504825,
		-0.829509,
		0.238885,
		0,
		0.562698,
		0.14321,
		-0.113683,
		1
	},
	[0.216666666667] = {
		-0.246371,
		-0.168874,
		0.954349,
		0,
		0.568145,
		-0.822928,
		0.001052,
		0,
		0.785183,
		0.542468,
		0.298691,
		0,
		0.229889,
		0.647296,
		-0.074389,
		1
	},
	[0.233333333333] = {
		-0.13449,
		-0.125539,
		0.98293,
		0,
		0.833854,
		-0.550243,
		0.043816,
		0,
		0.53535,
		0.825513,
		0.178684,
		0,
		0.066384,
		0.699872,
		-0.092732,
		1
	},
	[0.25] = {
		-0.092094,
		-0.133286,
		0.98679,
		0,
		0.987923,
		-0.136241,
		0.073797,
		0,
		0.124605,
		0.981669,
		0.144223,
		0,
		-0.094765,
		0.707985,
		-0.116188,
		1
	},
	[0.266666666667] = {
		-0.237994,
		-0.140244,
		0.961088,
		0,
		0.902379,
		0.33409,
		0.272207,
		0,
		-0.359265,
		0.932049,
		0.047042,
		0,
		-0.360225,
		0.618917,
		-0.183321,
		1
	},
	[0.283333333333] = {
		-0.097004,
		-0.07968,
		0.992089,
		0,
		0.702044,
		0.701086,
		0.124952,
		0,
		-0.705496,
		0.708611,
		-0.01207,
		0,
		-0.476343,
		0.464216,
		-0.220442,
		1
	},
	[0.2] = {
		-0.337686,
		-0.157401,
		0.928005,
		0,
		0.158862,
		-0.981306,
		-0.108634,
		0,
		0.927756,
		0.110741,
		0.356379,
		0,
		0.383128,
		0.575579,
		-0.039084,
		1
	},
	[0.316666666667] = {
		0.029127,
		0.20279,
		0.978789,
		0,
		-0.222882,
		0.955869,
		-0.191409,
		0,
		-0.97441,
		-0.212579,
		0.07304,
		0,
		-0.536536,
		0.23375,
		-0.171624,
		1
	},
	[0.333333333333] = {
		-0.092837,
		0.252517,
		0.963128,
		0,
		-0.660764,
		0.707978,
		-0.249313,
		0,
		-0.74483,
		-0.659547,
		0.101128,
		0,
		-0.575622,
		0.202617,
		-0.133449,
		1
	},
	[0.35] = {
		-0.165002,
		0.264222,
		0.950243,
		0,
		-0.771675,
		0.565429,
		-0.291216,
		0,
		-0.614241,
		-0.78133,
		0.110596,
		0,
		-0.625745,
		0.193363,
		-0.110155,
		1
	},
	[0.366666666667] = {
		-0.221447,
		0.266742,
		0.937982,
		0,
		-0.812016,
		0.482183,
		-0.32883,
		0,
		-0.539992,
		-0.834475,
		0.109821,
		0,
		-0.641635,
		0.181876,
		-0.093128,
		1
	},
	[0.383333333333] = {
		-0.262463,
		0.267618,
		0.927089,
		0,
		-0.813471,
		0.455408,
		-0.361757,
		0,
		-0.519017,
		-0.849108,
		0.098171,
		0,
		-0.62653,
		0.166315,
		-0.084644,
		1
	},
	[0.3] = {
		0.068439,
		0.06888,
		0.995275,
		0,
		0.386532,
		0.917864,
		-0.090102,
		0,
		-0.919733,
		0.390872,
		0.036194,
		0,
		-0.503168,
		0.325444,
		-0.207001,
		1
	},
	[0.416666666667] = {
		-0.301757,
		0.270334,
		0.914255,
		0,
		-0.746225,
		0.529868,
		-0.402973,
		0,
		-0.593372,
		-0.80384,
		0.041838,
		0,
		-0.57325,
		0.124987,
		-0.102671,
		1
	},
	[0.433333333333] = {
		-0.288981,
		0.237661,
		0.927366,
		0,
		-0.690811,
		0.618872,
		-0.373868,
		0,
		-0.662775,
		-0.748675,
		-0.014663,
		0,
		-0.537157,
		0.099817,
		-0.129796,
		1
	},
	[0.45] = {
		-0.272725,
		0.203502,
		0.940323,
		0,
		-0.606019,
		0.722768,
		-0.332185,
		0,
		-0.747236,
		-0.660449,
		-0.073791,
		0,
		-0.496316,
		0.075847,
		-0.159809,
		1
	},
	[0.466666666667] = {
		-0.25715,
		0.166977,
		0.951836,
		0,
		-0.489668,
		0.826637,
		-0.277303,
		0,
		-0.833126,
		-0.537393,
		-0.130807,
		0,
		-0.452471,
		0.054698,
		-0.191886,
		1
	},
	[0.483333333333] = {
		-0.246406,
		0.128937,
		0.960552,
		0,
		-0.345641,
		0.914247,
		-0.211387,
		0,
		-0.905437,
		-0.384093,
		-0.180711,
		0,
		-0.407018,
		0.037566,
		-0.225037,
		1
	},
	[0.4] = {
		-0.288881,
		0.269142,
		0.918755,
		0,
		-0.790077,
		0.474952,
		-0.387555,
		0,
		-0.540672,
		-0.837844,
		0.075439,
		0,
		-0.602893,
		0.147277,
		-0.087033,
		1
	},
	[0.516666666667] = {
		-0.250929,
		0.061066,
		0.966077,
		0,
		-0.024099,
		0.997305,
		-0.069299,
		0,
		-0.967705,
		-0.040671,
		-0.248781,
		0,
		-0.315743,
		0.017154,
		-0.290277,
		1
	},
	[0.533333333333] = {
		-0.267802,
		0.039617,
		0.962659,
		0,
		0.120803,
		0.99265,
		-0.007245,
		0,
		-0.955871,
		0.114352,
		-0.27062,
		0,
		-0.272572,
		0.013087,
		-0.320527,
		1
	},
	[0.55] = {
		-0.29325,
		0.031106,
		0.95553,
		0,
		0.237163,
		0.970596,
		0.041188,
		0,
		-0.926152,
		0.238695,
		-0.292005,
		0,
		-0.233631,
		0.011944,
		-0.348303,
		1
	},
	[0.566666666667] = {
		-0.326378,
		0.037424,
		0.944498,
		0,
		0.317606,
		0.945463,
		0.072289,
		0,
		-0.890283,
		0.323571,
		-0.320465,
		0,
		-0.201422,
		0.012838,
		-0.373148,
		1
	},
	[0.583333333333] = {
		-0.366566,
		0.061835,
		0.928335,
		0,
		0.381871,
		0.91987,
		0.089516,
		0,
		-0.848412,
		0.387318,
		-0.360806,
		0,
		-0.174985,
		0.015595,
		-0.397371,
		1
	},
	[0.5] = {
		-0.243771,
		0.092243,
		0.965436,
		0,
		-0.185061,
		0.972751,
		-0.139669,
		0,
		-0.952013,
		-0.212712,
		-0.220058,
		0,
		-0.361065,
		0.025083,
		-0.258171,
		1
	},
	[0.616666666667] = {
		-0.452381,
		0.16501,
		0.876426,
		0,
		0.522558,
		0.845405,
		0.110558,
		0,
		-0.722692,
		0.507998,
		-0.468673,
		0,
		-0.129739,
		0.026481,
		-0.450247,
		1
	},
	[0.633333333333] = {
		-0.488873,
		0.2368,
		0.8396,
		0,
		0.592898,
		0.796185,
		0.12067,
		0,
		-0.639903,
		0.55679,
		-0.529632,
		0,
		-0.11,
		0.033643,
		-0.477778,
		1
	},
	[0.65] = {
		-0.516112,
		0.315552,
		0.796276,
		0,
		0.658618,
		0.740555,
		0.133417,
		0,
		-0.547586,
		0.5933,
		-0.590038,
		0,
		-0.091711,
		0.041207,
		-0.505141,
		1
	},
	[0.666666666667] = {
		-0.532276,
		0.395377,
		0.748571,
		0,
		0.716535,
		0.68131,
		0.149646,
		0,
		-0.450842,
		0.616031,
		-0.645947,
		0,
		-0.074688,
		0.048603,
		-0.531551,
		1
	},
	[0.683333333333] = {
		-0.537663,
		0.470417,
		0.699733,
		0,
		0.764375,
		0.622223,
		0.169024,
		0,
		-0.355878,
		0.625737,
		-0.694121,
		0,
		-0.0589,
		0.055322,
		-0.556171,
		1
	},
	[0.6] = {
		-0.410132,
		0.105345,
		0.905922,
		0,
		0.451116,
		0.886718,
		0.101118,
		0,
		-0.792645,
		0.450147,
		-0.411194,
		0,
		-0.151255,
		0.020291,
		-0.423244,
		1
	},
	[0.716666666667] = {
		-0.526957,
		0.587141,
		0.614476,
		0,
		0.826949,
		0.521076,
		0.211271,
		0,
		-0.196143,
		0.619471,
		-0.76012,
		0,
		-0.031449,
		0.065262,
		-0.596652,
		1
	},
	[0.733333333333] = {
		-0.519128,
		0.622319,
		0.585854,
		0,
		0.842847,
		0.48649,
		0.23008,
		0,
		-0.141829,
		0.613226,
		-0.77707,
		0,
		-0.020097,
		0.068022,
		-0.610899,
		1
	},
	[0.75] = {
		-0.513165,
		0.644761,
		0.56652,
		0,
		0.851946,
		0.462749,
		0.245053,
		0,
		-0.104156,
		0.608397,
		-0.786769,
		0,
		-0.010948,
		0.06962,
		-0.621202,
		1
	},
	[0.766666666667] = {
		-0.508634,
		0.660347,
		0.552479,
		0,
		0.857487,
		0.44629,
		0.256011,
		0,
		-0.077509,
		0.60396,
		-0.793237,
		0,
		-0.004333,
		0.07061,
		-0.628607,
		1
	},
	[0.783333333333] = {
		-0.505873,
		0.670188,
		0.543084,
		0,
		0.860485,
		0.436203,
		0.263235,
		0,
		-0.060478,
		0.600479,
		-0.79735,
		0,
		-5e-06,
		0.071098,
		-0.633456,
		1
	},
	[0.7] = {
		-0.534615,
		0.535613,
		0.653686,
		0,
		0.801117,
		0.567476,
		0.190217,
		0,
		-0.269068,
		0.625372,
		-0.73247,
		0,
		-0.044436,
		0.060967,
		-0.578147,
		1
	},
	[0.816666666667] = {
		-0.505616,
		0.67625,
		0.53576,
		0,
		0.861311,
		0.431611,
		0.26806,
		0,
		-0.049964,
		0.596991,
		-0.80069,
		0,
		0.002884,
		0.070897,
		-0.636807,
		1
	},
	[0.833333333333] = {
		-0.50768,
		0.673977,
		0.536671,
		0,
		0.859851,
		0.435421,
		0.266578,
		0,
		-0.05401,
		0.596794,
		-0.800575,
		0,
		0.002019,
		0.070342,
		-0.635954,
		1
	},
	[0.85] = {
		-0.510765,
		0.669056,
		0.539892,
		0,
		0.857432,
		0.442223,
		0.263152,
		0,
		-0.062689,
		0.59733,
		-0.799542,
		0,
		8e-06,
		0.069561,
		-0.633837,
		1
	},
	[0.866666666667] = {
		-0.5145,
		0.662118,
		0.544875,
		0,
		0.854218,
		0.451221,
		0.258286,
		0,
		-0.074843,
		0.59833,
		-0.797747,
		0,
		-0.002851,
		0.068612,
		-0.630772,
		1
	},
	[0.883333333333] = {
		-0.518526,
		0.6538,
		0.551069,
		0,
		0.850385,
		0.461623,
		0.252487,
		0,
		-0.08931,
		0.599542,
		-0.795345,
		0,
		-0.006263,
		0.067554,
		-0.627075,
		1
	},
	[0.8] = {
		-0.50492,
		0.675223,
		0.537708,
		0,
		0.861615,
		0.431596,
		0.267104,
		0,
		-0.051718,
		0.598164,
		-0.799703,
		0,
		0.002306,
		0.07117,
		-0.636081,
		1
	},
	[0.916666666667] = {
		-0.526179,
		0.635688,
		0.564833,
		0,
		0.841802,
		0.483445,
		0.240104,
		0,
		-0.120434,
		0.601816,
		-0.789502,
		0,
		-0.013572,
		0.065377,
		-0.619056,
		1
	},
	[0.933333333333] = {
		-0.529301,
		0.627309,
		0.571248,
		0,
		0.837678,
		0.493258,
		0.234503,
		0,
		-0.134666,
		0.602645,
		-0.786565,
		0,
		-0.016891,
		0.0644,
		-0.615375,
		1
	},
	[0.95] = {
		-0.531705,
		0.620374,
		0.576564,
		0,
		0.834186,
		0.501264,
		0.229932,
		0,
		-0.146367,
		0.603217,
		-0.784031,
		0,
		-0.019608,
		0.063603,
		-0.612344,
		1
	},
	[0.966666666667] = {
		-0.533251,
		0.61565,
		0.580188,
		0,
		0.831767,
		0.506658,
		0.226851,
		0,
		-0.154296,
		0.60355,
		-0.782253,
		0,
		-0.021444,
		0.063065,
		-0.610288,
		1
	},
	[0.983333333333] = {
		-0.533801,
		0.613908,
		0.581527,
		0,
		0.830868,
		0.508634,
		0.225722,
		0,
		-0.157212,
		0.603662,
		-0.781586,
		0,
		-0.022118,
		0.062868,
		-0.60953,
		1
	},
	[0.9] = {
		-0.522512,
		0.644759,
		0.557913,
		0,
		0.846153,
		0.472631,
		0.24626,
		0,
		-0.104908,
		0.600754,
		-0.792521,
		0,
		-0.009934,
		0.066453,
		-0.623063,
		1
	}
}

return spline_matrices