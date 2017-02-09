class tuvanaka {
	class littlebird {
		pool = "heliSmall";
		respawnDelay = 20;
		markers[] = {"BV_lb"};
		class actions {};
	};
	class pawnee {
		pool = "heliSmallArmed";
		respawnDelay = 20;
		markers[] = {"BV_lbAttack"};
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
		markers[] = {"BV_hb1"};
		class actions {};
	};
	class cas {
		pool = "planeCAS";
		respawnDelay = 20;
		markers[] = {"BV_cas"};
		class actions {};
	};
	class aa {
		pool = "planeAA";
		respawnDelay = 20;
		markers[] = {"BV_aa"};
		class actions {};
	};
	class c130 {
		pool = "planeTransport";
		respawnDelay = 20;
		markers[] = {"BV_c130"};
		class actions {};
	};
	class uavs {
		pool = "uav";
		respawnDelay = 20;
		markers[] = {"BV_uav1"};
		class actions {};
	};
	class cars {
		pool = "car";
		respawnDelay = 20;
		markers[] = {"BV_car2", "BV_car4"};
		class actions {};
	};
	class armedCars {
		pool = "carArmed";
		respawnDelay = 20;
		markers[] = {"BV_car1", "BV_car3", "BV_fobCar1", "BV_fobCar2"};
		class actions {};
	};
	class apcs {
		pool = "apc";
		respawnDelay = 20;
		markers[] = {"BV_baseAPC", "BV_fobAPC"};
		class actions {};
	};
	class tanks {
		pool = "tank";
		respawnDelay = 20;
		markers[] = {"BV_fobTank"};
		class actions {};
	};
	class subs {
		pool = "sub";
		respawnDelay = 20;
		markers[] = {"BV_sub1", "BV_sub2"};
		class actions {
			class paint { color = "#(argb,8,8,3)color( 0.75,0.49,0.09,1)"; };
		};
	};
	class rhibs {
		pool = "boatSmall";
		respawnDelay = 20;
		markers[] = {"BV_rhib1", "BV_rhib2", "BV_rhib3"};
		class actions {};
	};
	class assaultBoats {
		pool = "boatAttack";
		respawnDelay = 20;
		markers[] = {"BV_boatAttack1", "BV_boatAttack2"};
		class actions {};
	};
	class mkv {
		pool = "boatBig";
		respawnDelay = 20;
		markers[] = {"BV_mkv"};
		class actions {};
	};
	class quads {
		pool = "quad";
		respawnDelay = 20;
		markers[] = {"BVquad_1", "BVquad_2", "BVquad_3", "BVquad_4", "BVquad_5", "BVquad_6",
					 "BVquad_7", "BVquad_8", "BVquad_9", "BVquad_10", "BVquad_11", "BVquad_12"};
		class actions {};
	};
	class repair {
		pool = "repair";
		respawnDelay = 20;
		markers[] = {"BV_service1"};
		class actions {};
	};
	class fuel {
		pool = "fuel";
		respawnDelay = 20;
		markers[] = {"BV_service2"};
		class actions {};
	};
};
