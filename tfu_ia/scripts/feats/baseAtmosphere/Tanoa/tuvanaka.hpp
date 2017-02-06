class tuvanaka {
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
			class BAinfVA_1 { type = "npc";balo = "gear"; };
			class BAinfVA_2 { type = "npc";balo = "gear"; };
			class BA_crewVA { type = "obj"; };
			class BA_hPilotVA { type = "obj"; };
			class BA_jPilotVA { type = "obj"; };
			class BA_fobVA { type = "obj"; };
			class BA_frVA { type = "obj"; };
			class BA_portVA { type = "obj"; };
		};
		class actions {
			class arsenal {
				filtered = -1;
			};
			class viewDistance {};
		};
	};
	class zeus {
		class things {
			class BA_zeus { type = "obj"; };
		};
		class actions {
			class curator {};
			class billboard {
				mode = "fixed";
				texture = "zeus";
			};
		};
	};
	class rightBillboard {
		class things {
			class Bill_1 { type = "obj"; };
		};
		class actions {
			class billboard {
				mode = "fixed";
				texture = "tfar";
			};
		};
	};
	class leftBillboard {
		class things {
			class Bill_2 { type = "obj"; };
		};
		class actions {
			class billboard { mode = "random"; };
			class dateBillboard {
				class xmas {
					texture = "xmas";
					start[] = {18, 12};
					end[] = {25, 12};
				};
			};
		};
	};
	class flags {
		class things {
			class BAflag_1 { type = "obj"; };
			class BAflag_3 { type = "obj"; };
			class BAflag_4 { type = "obj"; };
			class BAflag_5 { type = "obj"; };
		};
		class actions {
			class flag { texture = "tfu"; };
		};
	};
	class markers {
		class things {
			class BAmarker_1 { type = "marker"; };
			class BAmarker_2 { type = "marker"; };
			class BAmarker_3 { type = "marker"; };
			class BAmarker_4 { type = "marker"; };
		};
		class actions {};
	};
	class vehicles {
		class things {
			class BA_landMedic {
				type = "veh";
				pool = "landMedic";
			};
			class BA_landRepair {
				type = "veh";
				pool = "repair";
			};
			class BA_planeRepair1 {
				type = "veh";
				pool = "repair";
			};
			class BA_planeRepair2 {
				type = "veh";
				pool = "fuel";
			};
		};
		class actions {};
	};
};
