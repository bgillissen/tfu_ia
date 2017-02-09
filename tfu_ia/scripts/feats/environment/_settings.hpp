class environment {
	class setTime {
		rank = 4;
		class real {
			time[] = {};
			action = "Set time to GMT+1";
		};
		class midday {
			time[] = {11,59};
			action = "Set time to noon";
		};
		class night {
			time[] = {23,59};
			action = "Set time to midnight";
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
