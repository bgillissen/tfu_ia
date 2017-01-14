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

BV = [["heliSmall", 		20, "BV_lb1"],
      ["heliSmallArmed", 	20, "BV_lb2"],
      ["heliMedium", 		20, "BV_bh1"],
      ["heliMedEvac", 		20, "BV_bh2"],
      ["planeCAS", 			20, "BV_cas"],
      ["planeTransport",	20, "BV_c130"],
      ["carArmed", 			20, "BV_car1"],
      ["carArmed", 			20, "BV_car2"]];

//------------------------------------------------------------ Base atmosphere

BA = [["npc",	["arsenal"],	"BA_leftVA",	""],
      ["npc",	["arsenal"], 	"BA_rightVA", 	""],
      ["npc",	["support"], 	"BA_support",	""],
      ["npc",	["medic"],		"BA_medic", 	""],
      ["obj",	["arsenal"], 	"BA_crewVA", 	""],
      ["obj",	["arsenal"], 	"BA_pilotVA", 	""],
      ["obj",	["arsenal"], 	"BA_fobVA",		""],
      ["obj",	["arsenal"], 	"BA_frVA",		""],
      ["obj",	["curator"],	"BA_screen",	""],
      ["obj",	["billboard"], 	"BA_leftBB", 	"tfar"],
      ["obj",	["billboard"], 	"BA_rightBB", 	"random"],
      ["obj",	["hos"], 		"BA_hos0", 		""],
      ["obj",	["hos"], 		"BA_hos1", 		""],
      ["obj",	["hos"], 		"BA_hos2", 		""],
      ["obj",	["hos"], 		"BA_hos3", 		""],
      ["obj",	["hos"], 		"BA_hos4", 		""],
      ["obj",	["hos"], 		"BA_hos5", 		""],
      ["obj",	["hos"], 		"BA_hos6", 		""]];
