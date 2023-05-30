local spline_matrices = {
	[0] = {
		0.769824,
		0.295492,
		-0.565734,
		0,
		0.435394,
		0.404994,
		0.803998,
		0,
		0.466694,
		-0.865254,
		0.183119,
		0,
		0.277774,
		-0.00654,
		-0.036643,
		1
	},
	[0.0166666666667] = {
		0.750693,
		0.195284,
		-0.631129,
		0,
		0.535237,
		0.38023,
		0.754286,
		0,
		0.387274,
		-0.904041,
		0.180913,
		0,
		0.261,
		-0.019443,
		-0.066115,
		1
	},
	[0.0333333333333] = {
		0.674331,
		0.00448,
		-0.738416,
		0,
		0.698922,
		0.318831,
		0.640199,
		0,
		0.238298,
		-0.947801,
		0.211866,
		0,
		0.228573,
		-0.043407,
		-0.12085,
		1
	},
	[0.05] = {
		0.593185,
		-0.098772,
		-0.798984,
		0,
		0.787103,
		0.279635,
		0.549794,
		0,
		0.16912,
		-0.955012,
		0.243619,
		0,
		0.207335,
		-0.05631,
		-0.150322,
		1
	},
	[0.0666666666667] = {
		0.558548,
		-0.09299,
		-0.824243,
		0,
		0.808493,
		0.283109,
		0.515935,
		0,
		0.185374,
		-0.954569,
		0.233312,
		0,
		0.203433,
		-0.04115,
		-0.138957,
		1
	},
	[0.0833333333333] = {
		0.53909,
		-0.076021,
		-0.838811,
		0,
		0.814473,
		0.300703,
		0.496196,
		0,
		0.214512,
		-0.950683,
		0.224023,
		0,
		0.202885,
		-0.002099,
		-0.110544,
		1
	},
	[0.116666666667] = {
		0.529421,
		-0.010597,
		-0.848293,
		0,
		0.772896,
		0.418293,
		0.477141,
		0,
		0.349779,
		-0.90825,
		0.229643,
		0,
		0.198452,
		0.10913,
		-0.036672,
		1
	},
	[0.133333333333] = {
		0.562881,
		0.062859,
		-0.824144,
		0,
		0.682114,
		0.52778,
		0.506131,
		0,
		0.466781,
		-0.847052,
		0.2542,
		0,
		0.176101,
		0.176508,
		-0.008259,
		1
	},
	[0.15] = {
		0.618082,
		0.154077,
		-0.770866,
		0,
		0.509689,
		0.668017,
		0.54219,
		0,
		0.598491,
		-0.72802,
		0.334358,
		0,
		0.141596,
		0.257809,
		0.003106,
		1
	},
	[0.166666666667] = {
		0.644131,
		0.198418,
		-0.738732,
		0,
		0.289727,
		0.830523,
		0.475698,
		0,
		0.707922,
		-0.520443,
		0.477479,
		0,
		0.123714,
		0.342843,
		0.002657,
		1
	},
	[0.183333333333] = {
		0.490923,
		0.137838,
		-0.86023,
		0,
		-0.183246,
		0.981653,
		0.052718,
		0,
		0.851713,
		0.131753,
		0.507174,
		0,
		0.123789,
		0.443171,
		-0.000488,
		1
	},
	[0.1] = {
		0.530904,
		-0.04838,
		-0.84605,
		0,
		0.804424,
		0.342786,
		0.485181,
		0,
		0.26654,
		-0.938167,
		0.220905,
		0,
		0.202342,
		0.051207,
		-0.073608,
		1
	},
	[0.216666666667] = {
		0.467123,
		0.048762,
		-0.882847,
		0,
		-0.867448,
		0.218669,
		-0.446898,
		0,
		0.17126,
		0.97458,
		0.144443,
		0,
		-0.045704,
		0.609563,
		-0.069201,
		1
	},
	[0.233333333333] = {
		0.535925,
		0.053318,
		-0.84258,
		0,
		-0.833181,
		-0.127791,
		-0.538033,
		0,
		-0.136361,
		0.990367,
		-0.024063,
		0,
		-0.151915,
		0.601692,
		-0.138466,
		1
	},
	[0.25] = {
		0.464291,
		0.027145,
		-0.885267,
		0,
		-0.833352,
		-0.325096,
		-0.447032,
		0,
		-0.299932,
		0.945291,
		-0.128318,
		0,
		-0.226087,
		0.582218,
		-0.179023,
		1
	},
	[0.266666666667] = {
		0.389001,
		0.000955,
		-0.921237,
		0,
		-0.820116,
		-0.455146,
		-0.346773,
		0,
		-0.419628,
		0.890417,
		-0.176269,
		0,
		-0.29131,
		0.557891,
		-0.216252,
		1
	},
	[0.283333333333] = {
		0.389659,
		0.008015,
		-0.920924,
		0,
		-0.79168,
		-0.507991,
		-0.339394,
		0,
		-0.470542,
		0.861325,
		-0.191598,
		0,
		-0.357638,
		0.53168,
		-0.27048,
		1
	},
	[0.2] = {
		0.478968,
		0.074994,
		-0.874623,
		0,
		-0.710879,
		0.617681,
		-0.336335,
		0,
		0.515015,
		0.782845,
		0.349161,
		0,
		0.040781,
		0.538961,
		-0.032179,
		1
	},
	[0.316666666667] = {
		0.346795,
		-0.040955,
		-0.937046,
		0,
		-0.777828,
		-0.570839,
		-0.26292,
		0,
		-0.524134,
		0.82004,
		-0.22982,
		0,
		-0.430112,
		0.476171,
		-0.314071,
		1
	},
	[0.333333333333] = {
		0.240214,
		-0.160869,
		-0.957297,
		0,
		-0.792883,
		-0.601461,
		-0.097885,
		0,
		-0.56003,
		0.782538,
		-0.27203,
		0,
		-0.440602,
		0.448162,
		-0.316342,
		1
	},
	[0.35] = {
		0.116817,
		-0.271988,
		-0.955184,
		0,
		-0.794662,
		-0.60248,
		0.07437,
		0,
		-0.595707,
		0.75036,
		-0.286518,
		0,
		-0.449412,
		0.420847,
		-0.316667,
		1
	},
	[0.366666666667] = {
		-0.010699,
		-0.365135,
		-0.930893,
		0,
		-0.798109,
		-0.557733,
		0.227939,
		0,
		-0.602418,
		0.745393,
		-0.28545,
		0,
		-0.460198,
		0.394871,
		-0.29396,
		1
	},
	[0.383333333333] = {
		-0.142988,
		-0.459363,
		-0.876664,
		0,
		-0.792639,
		-0.477282,
		0.379375,
		0,
		-0.592687,
		0.749124,
		-0.295864,
		0,
		-0.469974,
		0.370877,
		-0.242016,
		1
	},
	[0.3] = {
		0.390297,
		0.015075,
		-0.920566,
		0,
		-0.777074,
		-0.530857,
		-0.338153,
		0,
		-0.493786,
		0.847327,
		-0.195478,
		0,
		-0.407791,
		0.504227,
		-0.307907,
		1
	},
	[0.416666666667] = {
		-0.333736,
		-0.558279,
		-0.759569,
		0,
		-0.72185,
		-0.366865,
		0.586807,
		0,
		-0.606261,
		0.744134,
		-0.280558,
		0,
		-0.487261,
		0.331415,
		-0.147468,
		1
	},
	[0.433333333333] = {
		-0.400459,
		-0.542275,
		-0.738627,
		0,
		-0.651,
		-0.398905,
		0.645813,
		0,
		-0.64485,
		0.739468,
		-0.193276,
		0,
		-0.496054,
		0.317728,
		-0.130703,
		1
	},
	[0.45] = {
		-0.468549,
		-0.501437,
		-0.72734,
		0,
		-0.549986,
		-0.478736,
		0.684344,
		0,
		-0.691359,
		0.720675,
		-0.051472,
		0,
		-0.505577,
		0.308554,
		-0.119466,
		1
	},
	[0.466666666667] = {
		-0.53214,
		-0.446649,
		-0.719257,
		0,
		-0.439755,
		-0.580136,
		0.685608,
		0,
		-0.723493,
		0.681136,
		0.112297,
		0,
		-0.514793,
		0.302991,
		-0.112649,
		1
	},
	[0.483333333333] = {
		-0.584273,
		-0.390136,
		-0.711632,
		0,
		-0.342871,
		-0.676104,
		0.652167,
		0,
		-0.735571,
		0.625042,
		0.261263,
		0,
		-0.522662,
		0.300135,
		-0.109149,
		1
	},
	[0.4] = {
		-0.253845,
		-0.530409,
		-0.808845,
		0,
		-0.765823,
		-0.40059,
		0.503034,
		0,
		-0.590829,
		0.747124,
		-0.304511,
		0,
		-0.478931,
		0.349511,
		-0.185097,
		1
	},
	[0.516666666667] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.533333333333] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.55] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.566666666667] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.583333333333] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.5] = {
		-0.618915,
		-0.345625,
		-0.705328,
		0,
		-0.276749,
		-0.74444,
		0.607634,
		0,
		-0.735088,
		0.571273,
		0.365093,
		0,
		-0.528146,
		0.299083,
		-0.107859,
		1
	},
	[0.616666666667] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.633333333333] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.65] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.666666666667] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.683333333333] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.6] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.716666666667] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.733333333333] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.75] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.766666666667] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.783333333333] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.7] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.816666666667] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.833333333333] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.85] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.866666666667] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.883333333333] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.8] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.916666666667] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.933333333333] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	},
	[0.9] = {
		-0.631431,
		-0.327594,
		-0.702835,
		0,
		-0.252484,
		-0.770129,
		0.585793,
		0,
		-0.733176,
		0.547342,
		0.403571,
		0,
		-0.530204,
		0.298933,
		-0.107675,
		1
	}
}

return spline_matrices