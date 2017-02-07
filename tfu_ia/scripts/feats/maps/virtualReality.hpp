class VR {
	keywords[] = {};
	headless = 3;
	class bases {
		class baseA {
			name = "Virtual Reality Base A";
			safeZone = 5;
			firingRange = 20;
			blacklist[] = {};
		};
		class baseB {
			name = "Virtual Reality Base B";
			safeZone = 5;
			firingRange = 20;
			blacklist[] = {};
		};
		class baseC {
			name = "Virtual Reality Base C";
			safeZone = 5;
			firingRange = 20;
			blacklist[] = {};
		};
	};
	class zones {
		class zoneA {
			consecutiveAOs = 3;
			aos[] = {"ao_1", "ao_2", "ao_3"};
			fobs[] = {"fob_1", "fob_2", "fob_3", "fob_4"};
		};
		class zoneB {
			consecutiveAOs = 3;
			aos[] = {"ao_4", "ao_5", "ao_6"};
			fobs[] = {"fob_5", "fob_6", "fob_7"};
		};
		class zoneC {
			consecutiveAOs = 1;
			aos[] = {"ao_7"};
			fobs[] = {};
		};
	};
};
