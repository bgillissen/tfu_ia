class environment {
	class setTime {
		rank = 4;
		presets[] = {"real", "sunrise", "noon", "sunset", "midnight"};
		class actions {
			real = "Set time to GMT+1";
			sunrise = "Set time to sunrise";
			noon = "Set time to noon";
			sunset = "Set time to sunset";
			midnight "Set time to midnight";
		};
	};
	class clearFog {
		rank = 1;
		action = "Clear fog";
	};
	class clearRain {
		rank = 2;
		action = "Stop rain";
	};
};
