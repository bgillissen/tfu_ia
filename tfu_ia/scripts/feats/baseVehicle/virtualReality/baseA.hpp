class baseA {
	class cas {
		pool = "planeCAS";
		respawnDelay = 20;
		markers[] = {"BV_cas"};
		class actions {};
	};
	class c130 {
		pool = "planeTransport";
		respawnDelay = 20;
		markers[] = {"BV_c130"};
		class actions {};
	};
	class littlebird {
		pool = "heliSmall";
		respawnDelay = 20;
		markers[] = {"BV_lb1"};
		class actions {};
	};
	class pawnee {
		pool = "heliSmallArmed";
		respawnDelay = 20;
		markers[] = {"BV_lb2"};
		class actions {};
	};
	class blackhawk {
		pool = "heliMedium";
		respawnDelay = 20;
		markers[] = {"BV_bh1"};
		class actions {};
	};
	class medEvac {
		pool = "heliMedEvac";
		respawnDelay = 20;
		markers[] = {"BV_bh2"};
		class actions {};
	};
	class bigHeli {
		pool = "heliBig";
		respawnDelay = 20;
		markers[] = {"BV_hb1", "BV_hb2"};
		class actions {};
	};
	class cars {
		pool = "car";
		respawnDelay = 20;
		markers[] = {"BV_car2"};
		class actions {};
	};
	class armedCars {
		pool = "carArmed";
		respawnDelay = 20;
		markers[] = {"BV_car1"};
		class actions {};
	};
	class apcs {
		pool = "apc";
		respawnDelay = 20;
		markers[] = {"BV_apc1"};
		class actions {};
	};
	class tanks {
		pool = "tank";
		respawnDelay = 20;
		markers[] = {"BV_tank1"};
		class actions {};
	};
	class subs {
		pool = "sub";
		respawnDelay = 20;
		markers[] = {"BV_sub1"};
		class actions {
			/*class paint { color = "#(argb,8,8,3)color(0.98,0.68,0.22,1)"; };*/
			class paint { color = "#(argb,8,8,3)color(0.82,0.50,0.08,1)"; };
		};
	};
};
