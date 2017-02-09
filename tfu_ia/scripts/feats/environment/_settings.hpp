class environment {
	class setTime {
		rank = 4;
		class real {
			time[] = {};
			action = "Set time to real world time";
		};
		class sunrise {
			time[] = {6,30};
			action = "Set time to sunrise";
		};
		class midday {
			time[] = {13,0};
			action = "Set time to midday";
		};
		class sunset {
			time[] = {18,30};
			action = "Set time to sunset";
		};
		class night {
			time[] = {23,0};
			action = "Set time to night";
		};
	};
	class clearFog {
		rank = 1;
		action = "clear fog";
	};
	class clearRain {
		rank = 2;
		action = "stop rain";
	};
};
