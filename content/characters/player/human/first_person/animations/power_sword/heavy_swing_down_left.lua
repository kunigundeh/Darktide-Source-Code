local spline_matrices = {
	[0] = {
		0.994483,
		0.063304,
		-0.083638,
		0,
		0.01935,
		0.672959,
		0.739427,
		0,
		0.103094,
		-0.736966,
		0.668021,
		0,
		0.388986,
		0.010261,
		0.189376,
		1
	},
	[0.0166666666667] = {
		0.988054,
		0.084613,
		-0.128799,
		0,
		0.051073,
		0.608754,
		0.791713,
		0,
		0.145396,
		-0.788834,
		0.597161,
		0,
		0.373438,
		0.023907,
		0.19749,
		1
	},
	[0.0333333333333] = {
		0.978198,
		0.111947,
		-0.174917,
		0,
		0.089791,
		0.531486,
		0.842295,
		0,
		0.187258,
		-0.839637,
		0.509847,
		0,
		0.359315,
		0.036808,
		0.204735,
		1
	},
	[0.05] = {
		0.965153,
		0.143767,
		-0.218658,
		0,
		0.132735,
		0.451151,
		0.882522,
		0,
		0.225525,
		-0.880792,
		0.416347,
		0,
		0.345872,
		0.050262,
		0.210789,
		1
	},
	[0.0666666666667] = {
		0.949912,
		0.176921,
		-0.257617,
		0,
		0.175431,
		0.380327,
		0.908061,
		0,
		0.258634,
		-0.907772,
		0.33024,
		0,
		0.332336,
		0.065578,
		0.215743,
		1
	},
	[0.0833333333333] = {
		0.934076,
		0.207201,
		-0.29081,
		0,
		0.212352,
		0.332417,
		0.918916,
		0,
		0.28707,
		-0.920091,
		0.266503,
		0,
		0.317953,
		0.083969,
		0.220031,
		1
	},
	[0.116666666667] = {
		0.908683,
		0.241715,
		-0.340395,
		0,
		0.252251,
		0.331803,
		0.908997,
		0,
		0.332662,
		-0.911856,
		0.240531,
		0,
		0.2841,
		0.126224,
		0.233213,
		1
	},
	[0.133333333333] = {
		0.901568,
		0.243262,
		-0.35777,
		0,
		0.256026,
		0.366615,
		0.894452,
		0,
		0.34875,
		-0.898007,
		0.268247,
		0,
		0.26392,
		0.144805,
		0.245583,
		1
	},
	[0.15] = {
		0.896947,
		0.236726,
		-0.373426,
		0,
		0.239451,
		0.449923,
		0.860368,
		0,
		0.371684,
		-0.861122,
		0.346873,
		0,
		0.240753,
		0.176652,
		0.251941,
		1
	},
	[0.166666666667] = {
		0.893711,
		0.222297,
		-0.389697,
		0,
		0.187351,
		0.604331,
		0.774392,
		0,
		0.407651,
		-0.765093,
		0.49845,
		0,
		0.213299,
		0.236737,
		0.241649,
		1
	},
	[0.183333333333] = {
		0.896844,
		0.188547,
		-0.400151,
		0,
		0.053938,
		0.851245,
		0.521989,
		0,
		0.439046,
		-0.489726,
		0.753264,
		0,
		0.175871,
		0.35585,
		0.205046,
		1
	},
	[0.1] = {
		0.919603,
		0.230038,
		-0.318455,
		0,
		0.237548,
		0.320029,
		0.917144,
		0,
		0.312893,
		-0.919056,
		0.239654,
		0,
		0.302012,
		0.10654,
		0.22423,
		1
	},
	[0.216666666667] = {
		0.920326,
		0.120686,
		-0.372069,
		0,
		-0.260194,
		0.899125,
		-0.351956,
		0,
		0.292061,
		0.420725,
		0.858889,
		0,
		0.076432,
		0.599943,
		0.046672,
		1
	},
	[0.233333333333] = {
		0.925367,
		0.109562,
		-0.362894,
		0,
		-0.328492,
		0.709527,
		-0.62343,
		0,
		0.189179,
		0.696109,
		0.692563,
		0,
		0.026111,
		0.640062,
		-0.050599,
		1
	},
	[0.25] = {
		0.93076,
		0.098239,
		-0.352186,
		0,
		-0.355936,
		0.463793,
		-0.811299,
		0,
		0.08364,
		0.88048,
		0.466647,
		0,
		-0.019882,
		0.643341,
		-0.155442,
		1
	},
	[0.266666666667] = {
		0.932378,
		0.072137,
		-0.354215,
		0,
		-0.359985,
		0.09607,
		-0.927999,
		0,
		-0.032914,
		0.992757,
		0.115541,
		0,
		-0.06161,
		0.590919,
		-0.287563,
		1
	},
	[0.283333333333] = {
		0.931683,
		-0.000135,
		-0.363273,
		0,
		-0.304957,
		-0.543697,
		-0.781917,
		0,
		-0.197405,
		0.839281,
		-0.506595,
		0,
		-0.105494,
		0.418096,
		-0.484655,
		1
	},
	[0.2] = {
		0.909434,
		0.146023,
		-0.389367,
		0,
		-0.13017,
		0.989229,
		0.066953,
		0,
		0.394949,
		-0.010205,
		0.918646,
		0,
		0.127071,
		0.501828,
		0.136335,
		1
	},
	[0.316666666667] = {
		0.934922,
		-0.124132,
		-0.332433,
		0,
		-0.131777,
		-0.991279,
		-0.000457,
		0,
		-0.329477,
		0.044234,
		-0.943127,
		0,
		-0.144246,
		0.0905,
		-0.662455,
		1
	},
	[0.333333333333] = {
		0.924031,
		-0.175485,
		-0.339665,
		0,
		-0.111398,
		-0.973466,
		0.199885,
		0,
		-0.365729,
		-0.146862,
		-0.919061,
		0,
		-0.152753,
		-0.006872,
		-0.653957,
		1
	},
	[0.35] = {
		0.909338,
		-0.228624,
		-0.347614,
		0,
		-0.105022,
		-0.934569,
		0.339929,
		0,
		-0.402585,
		-0.272603,
		-0.873849,
		0,
		-0.16025,
		-0.084198,
		-0.63379,
		1
	},
	[0.366666666667] = {
		0.899109,
		-0.273155,
		-0.342036,
		0,
		-0.099158,
		-0.888184,
		0.448661,
		0,
		-0.426345,
		-0.36948,
		-0.82566,
		0,
		-0.16004,
		-0.14393,
		-0.611896,
		1
	},
	[0.383333333333] = {
		0.895961,
		-0.30039,
		-0.327138,
		0,
		-0.10648,
		-0.860379,
		0.498407,
		0,
		-0.43118,
		-0.41172,
		-0.802852,
		0,
		-0.156601,
		-0.176257,
		-0.599177,
		1
	},
	[0.3] = {
		0.937845,
		-0.07541,
		-0.338763,
		0,
		-0.185195,
		-0.93426,
		-0.304731,
		0,
		-0.293513,
		0.348528,
		-0.890156,
		0,
		-0.134511,
		0.219088,
		-0.633293,
		1
	},
	[0.416666666667] = {
		0.889468,
		-0.341784,
		-0.303365,
		0,
		-0.161842,
		-0.856385,
		0.490317,
		0,
		-0.42738,
		-0.387024,
		-0.817043,
		0,
		-0.152394,
		-0.204292,
		-0.591275,
		1
	},
	[0.433333333333] = {
		0.885116,
		-0.360751,
		-0.293986,
		0,
		-0.201111,
		-0.866206,
		0.45743,
		0,
		-0.419671,
		-0.345755,
		-0.839244,
		0,
		-0.149707,
		-0.208922,
		-0.593481,
		1
	},
	[0.45] = {
		0.87929,
		-0.380476,
		-0.286508,
		0,
		-0.253069,
		-0.882823,
		0.395701,
		0,
		-0.403491,
		-0.27543,
		-0.872544,
		0,
		-0.145815,
		-0.206675,
		-0.601254,
		1
	},
	[0.466666666667] = {
		0.873442,
		-0.396627,
		-0.282464,
		0,
		-0.301031,
		-0.895798,
		0.326996,
		0,
		-0.382726,
		-0.200581,
		-0.901825,
		0,
		-0.142316,
		-0.20076,
		-0.610322,
		1
	},
	[0.483333333333] = {
		0.868817,
		-0.407898,
		-0.280672,
		0,
		-0.33594,
		-0.902045,
		0.271034,
		0,
		-0.363733,
		-0.14119,
		-0.920741,
		0,
		-0.140089,
		-0.195554,
		-0.617157,
		1
	},
	[0.4] = {
		0.893071,
		-0.321421,
		-0.314823,
		0,
		-0.131324,
		-0.855491,
		0.500888,
		0,
		-0.430324,
		-0.405984,
		-0.806225,
		0,
		-0.154955,
		-0.192678,
		-0.593709,
		1
	},
	[0.516666666667] = {
		0.85939,
		-0.428275,
		-0.279337,
		0,
		-0.399293,
		-0.903355,
		0.156572,
		0,
		-0.319396,
		-0.023019,
		-0.947342,
		0,
		-0.135553,
		-0.184408,
		-0.630329,
		1
	},
	[0.533333333333] = {
		0.854664,
		-0.437432,
		-0.279649,
		0,
		-0.427623,
		-0.898559,
		0.098641,
		0,
		-0.29443,
		0.03528,
		-0.955022,
		0,
		-0.133241,
		-0.178516,
		-0.636646,
		1
	},
	[0.55] = {
		0.849994,
		-0.445881,
		-0.280535,
		0,
		-0.453611,
		-0.890275,
		0.040601,
		0,
		-0.267856,
		0.092743,
		-0.958985,
		0,
		-0.13089,
		-0.172425,
		-0.642778,
		1
	},
	[0.566666666667] = {
		0.845427,
		-0.453613,
		-0.281937,
		0,
		-0.477189,
		-0.878631,
		-0.017273,
		0,
		-0.239883,
		0.14914,
		-0.959277,
		0,
		-0.128496,
		-0.166138,
		-0.648722,
		1
	},
	[0.583333333333] = {
		0.841002,
		-0.460623,
		-0.283799,
		0,
		-0.498305,
		-0.863778,
		-0.074697,
		0,
		-0.210732,
		0.204239,
		-0.95597,
		0,
		-0.126055,
		-0.159663,
		-0.654473,
		1
	},
	[0.5] = {
		0.864125,
		-0.418427,
		-0.279654,
		0,
		-0.368702,
		-0.904548,
		0.214131,
		0,
		-0.342558,
		-0.081927,
		-0.935918,
		0,
		-0.137832,
		-0.190095,
		-0.62383,
		1
	},
	[0.616666666667] = {
		0.832718,
		-0.47249,
		-0.288677,
		0,
		-0.53304,
		-0.825157,
		-0.187039,
		0,
		-0.14983,
		0.309627,
		-0.938979,
		0,
		-0.121039,
		-0.146172,
		-0.665374,
		1
	},
	[0.633333333333] = {
		0.828916,
		-0.477367,
		-0.291582,
		0,
		-0.546664,
		-0.801807,
		-0.241379,
		0,
		-0.118566,
		0.35948,
		-0.92559,
		0,
		-0.118469,
		-0.139177,
		-0.670514,
		1
	},
	[0.65] = {
		0.825369,
		-0.481565,
		-0.294722,
		0,
		-0.557836,
		-0.776086,
		-0.294126,
		0,
		-0.087089,
		0.407169,
		-0.909191,
		0,
		-0.114437,
		-0.130788,
		-0.672038,
		1
	},
	[0.666666666667] = {
		0.822093,
		-0.48511,
		-0.298046,
		0,
		-0.566628,
		-0.748263,
		-0.345016,
		0,
		-0.055646,
		0.452516,
		-0.890018,
		0,
		-0.109331,
		-0.121407,
		-0.670724,
		1
	},
	[0.683333333333] = {
		0.819095,
		-0.488037,
		-0.301501,
		0,
		-0.573135,
		-0.718631,
		-0.393809,
		0,
		-0.024474,
		0.495368,
		-0.868338,
		0,
		-0.104213,
		-0.111993,
		-0.669038,
		1
	},
	[0.6] = {
		0.836755,
		-0.466913,
		-0.286064,
		0,
		-0.516926,
		-0.845888,
		-0.131383,
		0,
		-0.180634,
		0.257809,
		-0.949161,
		0,
		-0.123569,
		-0.153004,
		-0.660026,
		1
	},
	[0.716666666667] = {
		0.813938,
		-0.492198,
		-0.308619,
		0,
		-0.579825,
		-0.655196,
		-0.484274,
		0,
		0.036153,
		0.573114,
		-0.818678,
		0,
		-0.094065,
		-0.093264,
		-0.664784,
		1
	},
	[0.733333333333] = {
		0.811765,
		-0.493528,
		-0.312199,
		0,
		-0.580333,
		-0.622049,
		-0.525612,
		0,
		0.065201,
		0.607853,
		-0.791368,
		0,
		-0.089096,
		-0.084047,
		-0.662321,
		1
	},
	[0.75] = {
		0.809842,
		-0.494429,
		-0.315746,
		0,
		-0.579202,
		-0.588397,
		-0.564193,
		0,
		0.093169,
		0.639788,
		-0.762883,
		0,
		-0.084233,
		-0.074992,
		-0.659703,
		1
	},
	[0.766666666667] = {
		0.80815,
		-0.494959,
		-0.319234,
		0,
		-0.576642,
		-0.554575,
		-0.599942,
		0,
		0.119908,
		0.668927,
		-0.733594,
		0,
		-0.079505,
		-0.066146,
		-0.656982,
		1
	},
	[0.783333333333] = {
		0.80666,
		-0.495179,
		-0.32264,
		0,
		-0.572877,
		-0.520909,
		-0.632823,
		0,
		0.145294,
		0.695307,
		-0.703873,
		0,
		-0.074935,
		-0.057555,
		-0.65421,
		1
	},
	[0.7] = {
		0.816378,
		-0.490384,
		-0.30504,
		0,
		-0.577484,
		-0.687501,
		-0.44029,
		0,
		0.006196,
		0.535599,
		-0.84445,
		0,
		-0.099113,
		-0.102596,
		-0.667041,
		1
	},
	[0.816666666667] = {
		0.80423,
		-0.494841,
		-0.329161,
		0,
		-0.5626,
		-0.455363,
		-0.690018,
		0,
		0.191561,
		0.74012,
		-0.644614,
		0,
		-0.066361,
		-0.041332,
		-0.64872,
		1
	},
	[0.833333333333] = {
		0.803314,
		-0.494252,
		-0.332266,
		0,
		-0.55648,
		-0.424172,
		-0.714429,
		0,
		0.21217,
		0.75881,
		-0.615785,
		0,
		-0.062394,
		-0.033797,
		-0.646105,
		1
	},
	[0.85] = {
		0.802525,
		-0.493504,
		-0.335271,
		0,
		-0.550051,
		-0.39436,
		-0.736155,
		0,
		0.231078,
		0.775199,
		-0.587937,
		0,
		-0.058673,
		-0.026698,
		-0.643645,
		1
	},
	[0.866666666667] = {
		0.801787,
		-0.492713,
		-0.338188,
		0,
		-0.543572,
		-0.366125,
		-0.755303,
		0,
		0.248329,
		0.789421,
		-0.561379,
		0,
		-0.055221,
		-0.020072,
		-0.641388,
		1
	},
	[0.883333333333] = {
		0.801026,
		-0.491993,
		-0.341029,
		0,
		-0.537279,
		-0.339643,
		-0.771993,
		0,
		0.263987,
		0.801615,
		-0.5364,
		0,
		-0.052055,
		-0.013953,
		-0.639385,
		1
	},
	[0.8] = {
		0.805345,
		-0.495151,
		-0.325953,
		0,
		-0.568137,
		-0.487716,
		-0.662838,
		0,
		0.169232,
		0.718999,
		-0.674093,
		0,
		-0.070548,
		-0.049267,
		-0.651439,
		1
	},
	[0.916666666667] = {
		0.799135,
		-0.491202,
		-0.346558,
		0,
		-0.526107,
		-0.292542,
		-0.798518,
		0,
		0.290851,
		0.820451,
		-0.492206,
		0,
		-0.046637,
		-0.003378,
		-0.636333,
		1
	},
	[0.9] = {
		0.800167,
		-0.491453,
		-0.343813,
		0,
		-0.531391,
		-0.31507,
		-0.786355,
		0,
		0.278131,
		0.811914,
		-0.513263,
		0,
		-0.049189,
		-0.008377,
		-0.637684,
		1
	}
}

return spline_matrices