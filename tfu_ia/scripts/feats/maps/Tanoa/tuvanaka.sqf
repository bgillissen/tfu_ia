/*
@filename: feats\maps\Tanoa\tuvanaka.sqf
Author:
	Ben
Description:
		run on server,
		call by feats\maps\serverPreInit.sqf,
		Tanoa Tuvanaka composition settings
*/

//------------------------------------------------------------ Base vehicle
//		poolName			markerName			delay	actions [action, conf]
BV = [["heliSmall", 		"BV_lb1",			20, 	[]],
      ["heliSmallArmed", 	"BV_lb2",			20, 	[]],
      ["heliMedium", 		"BV_bh1",			20, 	[]],
      ["heliMedEvac", 		"BV_bh2",			20, 	[]],
      ["planeCAS", 			"BV_cas",			20, 	[]],
      ["planeTransport",	"BV_c130",			20, 	[]],
      ["planeAA",			"BV_aa",			20, 	[]],
      ["uav",				"BV_uav1",			20, 	[]],
      ["carArmed", 			"BV_car1",			20, 	[]],
      ["car", 				"BV_car2",			20, 	[]],
      ["carArmed", 			"BV_car3",			20, 	[]],
      ["car", 				"BV_car4",			20, 	[]],
      ["apc", 				"BV_baseAPC",		20, 	[]],
      ["apc", 				"BV_fobAPC",		20, 	[]],
      ["tank", 				"BV_fobTank",		20, 	[]],
      ["carArmed", 			"BV_fobCar1",		20, 	[]],
      ["carArmed", 			"BV_fobCar2",		20, 	[]],
      ["heliBig", 			"BV_hb1",			20, 	[]],
      ["repair",			"BV_service1",		20, 	[]],
      ["fuel",				"BA_service2",		20, 	[]],
      ["landMedic",			"BA_landMedic",		-1, 	[]],
      ["repair",			"BA_landRepair",	-1, 	[]],
      ["repair",			"BA_planeRepair1",	-1, 	[]],
      ["fuel",				"BA_planeRepair2",	-1, 	[]],
      ["repair",			"BV_heliRepair",	-1, 	[]],
      ["sub",				"BV_sub1",			20,		[["paint", "#(argb,8,8,3)color(1,1,0,0.8)"]]],
      ["sub",				"BV_sub2",			20,		[["paint", "#(argb,8,8,3)color(1,1,0,0.8)"]]],
      ["boatSmall",			"BV_rhib1",			20,		[]],
      ["boatSmall",			"BV_rhib2",			20,		[]],
      ["boatSmall",			"BV_rhib3",			20,		[]],
      ["boatAttack",		"BV_boatAttack1",	20,		[]],
      ["boatAttack",		"BV_boatAttack2",	20,		[]],
      ["boatBig",			"BV_mkv",			20,		[]],
      ["quad",				"BVquad_1",			20,		[]],
      ["quad",				"BVquad_2",			20,		[]],
      ["quad",				"BVquad_3",			20,		[]],
      ["quad",				"BVquad_4",			20,		[]],
      ["quad",				"BVquad_5",			20,		[]],
      ["quad",				"BVquad_6",			20,		[]],
      ["quad",				"BVquad_7",			20,		[]],
      ["quad",				"BVquad_8",			20,		[]],
      ["quad",				"BVquad_9",			20,		[]],
      ["quad",				"BVquad_10",		20,		[]],
      ["quad",				"BVquad_11",		20,		[]],
      ["quad",				"BVquad_12",		20,		[]],
     ];

//------------------------------------------------------------ Base atmosphere
//	   type		varName			actions [action, conf]
BA = [["npc",	"BA_support",	[["support"]]],
      ["npc",	"BA_medic",		[["medic"]]],
      ["npc",	"BAinfVA_1",	[["arsenal"], ["vd"]]],
      ["npc",	"BAinfVA_2",	[["arsenal"], ["vd"]]],
      ["obj",	"BA_crewVA",	[["arsenal"], ["vd"]]],
      ["obj",	"BA_hPilotVA",	[["arsenal"], ["vd"]]],
      ["obj",	"BA_JPilotVA",	[["arsenal"], ["vd"]]],
      ["obj",	"BA_fobVA",		[["arsenal"], ["vd"]]],
      ["obj",	"BA_frVA",		[["arsenal"], ["vd"]]],
      ["obj",	"BA_portVA",	[["arsenal"], ["vd"]]],
      ["obj",	"BA_zeus",		[["curator"], ["billboard", "zeus"]]],
      ["obj",	"Bill_1",		[["billboard", "tfar"]]],
      ["obj",	"Bill_2",		[["billboard", "random"]]],
      ["obj",	"BAflag_1",		[["flag", "tfu"]]],
      ["obj",	"BAflag_3",		[["flag", "tfu"]]],
      ["obj",	"BAflag_4",		[["flag", "tfu"]]],
      ["obj",	"BAflag_5",		[["flag", "tfu"]]],
      ["obj",	"BAmarker_1",	[["markerColor"]]],
      ["obj",	"BAmarker_2",	[["markerColor"]]],
      ["obj",	"BAmarker_3",	[["markerColor"]]],
      ["obj",	"BAmarker_4",	[["markerColor"]]]
     ];