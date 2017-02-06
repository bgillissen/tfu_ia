/*
@filename: feats\maps\VR\baseA.sqf
Author:
	Ben
Description:
		run on server,
		call by feats\maps\serverPreInit.sqf,
		Virtual Reality baseA composition settings
*/

//------------------------------------------------------------ Base vehicle
//		poolName			markerName			delay	actions [action, conf]
BV = [["heliSmall", 		"BV_lb1",			20, 	[]],
      ["heliSmallArmed", 	"BV_lb2",			20, 	[]],
      ["heliMedium", 		"BV_bh1",			20, 	[]],
      ["heliMedEvac", 		"BV_bh2",			20, 	[]],
      ["planeCAS", 			"BV_cas",			20, 	[]],
      ["planeTransport",	"BV_c130",			20, 	[]],
      ["carArmed", 			"BV_car1",			20, 	[]],
      ["car", 				"BV_car2",			20, 	[]],
      ["heliBig", 			"BV_hb1",			20, 	[]],
      ["heliBig", 			"BV_hb2",			20, 	[]],
      ["apc", 				"BV_apc1",			20, 	[]],
      ["tank", 				"BV_tank1",			20, 	[]],
      ["landMedic",			"BV_medic",			-1, 	[]],
      ["repair",			"BV_landRepair",	-1, 	[]],
      ["repair",			"BV_planeRepair1",	-1, 	[]],
      ["fuel",				"BV_planeRepair2",	-1, 	[]],
      ["repair",			"BV_heliRepair",	-1, 	[]],
      ["sub",				"BV_sub1",			20,		[["paint", "#(argb,8,8,3)color(1,1,0,0.8)"]]]
     ];

//------------------------------------------------------------ Base atmosphere
//	   type		varName			actions [action, conf]
BA = [["npc",	"BA_leftVA",	[["arsenal"], ["vd"]]],
      ["npc",	"BA_rightVA",	[["arsenal"], ["vd"]]],
      ["npc",	"BA_support",	[["support"]]],
      ["npc",	"BA_medic",		[["medic"]]],
      ["obj",	"BA_crewVA",	[["arsenal"], ["vd"]]],
      ["obj",	"BA_pilotVA",	[["arsenal"], ["vd"]]],
      ["obj",	"BA_fobVA",		[["arsenal"], ["vd"]]],
      ["obj",	"BA_frVA",		[["arsenal"], ["vd"]]],
      ["obj",	"BA_screen",	[["curator"], ["billboard", "zeus"]]],
      ["obj",	"BA_leftBB",	[["billboard", "tfar"]]],
      ["obj",	"BA_rightBB",	[["billboard", "random"]]],
      ["obj",	"BA_flag",		[["flag", "tfu"]]]
     ];