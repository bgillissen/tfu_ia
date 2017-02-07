class baseA {
	class support {
		class things {
			class BA_support { type = "npc";balo = "support"; };
		};
		class actions {
			class support {};
		};
	};
	class medic {
		class things {
			class BA_medic { type = "npc";balo = "medic"; };
		};
		class actions {
			class medic {};
		};
	};
	class arsenals {
		class things {
			class BA_leftVA { type = "npc";balo = "gear"; };
			class BA_rightVA { type = "npc";balo = "gear"; };
			class BA_crewVA { type = "obj"; };
			class BA_pilotVA { type = "obj"; };
			class BA_fobVA { type = "obj"; };
			class BA_frVA { type = "obj"; };
		};
		class actions {
			class arsenal { filtered = -1; };
			class viewDistance {};
		};
	};
	class zeus {
		class things {
			class BA_screen { type = "obj"; };
		};
		class actions {
			class curator {};
			class memberData {};
			class billboard {
				mode = "fixed";
				texture = "zeus";
			};
		};
	};
	class leftBillboard {
		class things {
			class BA_leftBB { type = "obj"; };
		};
		class actions {
			class billboard {
				mode = "fixed";
				texture = "tfar";
			};
		};
	};
	class rightBillboard {
		class things {
			class BA_rightBB { type = "obj"; };
		};
		class actions {
			class billboard { mode = "random"; };
		};
	};
	class flags {
		class things {
			class BA_flag { type = "obj"; };
		};
		class actions {
			class flag { texture = "tfu"; };
		};
	};
	class vehicles {
		class things {
			class BV_medic {
				type = "veh";
				pool = "landMedic";
			};
			class BV_landRepair {
				type = "veh";
				pool = "repair";
			};
			class BV_planeRepair1 {
				type = "veh";
				pool = "repair";
			};
			class BV_planeRepair2 {
				type = "veh";
				pool = "fuel";
			};
		};
		class actions {};
	};
};
