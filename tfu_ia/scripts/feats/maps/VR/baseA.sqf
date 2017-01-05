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
//												dmg		simu  simple
BA = [["npc",	["arsenal"],	"BA_leftVA",	[false, true, false], ""],
      ["npc",	["arsenal"], 	"BA_rightVA", 	[false, true, false], ""],
      ["npc",	["support"], 	"BA_support",	[false, true, false], ""],
      ["npc",	["medic"],		"BA_medic", 	[false, true, false], ""],
      ["obj",	["arsenal"], 	"BA_crewVA", 	[false, false, false], ""],
      ["obj",	["arsenal"], 	"BA_pilotVA", 	[false, false, false], ""],
      ["obj",	["arsenal"], 	"BA_fobVA",		[false, false, false], ""],
      ["obj",	["arsenal"], 	"BA_frVA",		[false, false, false], ""],
      ["obj",	["curator"],	"BA_screen",	[false, false, false], ""],
      ["obj",	["billboard"], 	"BA_leftBB", 	[false, false, false], "tfar"],
      ["obj",	["billboard"], 	"BA_rightBB", 	[false, false, false], "random"],
      ["obj",	["hos"], 		"BA_hos0", 		[false, false, false], ""],
      ["obj",	["hos"], 		"BA_hos1", 		[false, false, false], ""],
      ["obj",	["hos"], 		"BA_hos2", 		[false, false, false], ""],
      ["obj",	["hos"], 		"BA_hos3", 		[false, false, false], ""],
      ["obj",	["hos"], 		"BA_hos4", 		[false, false, false], ""],
      ["obj",	["hos"], 		"BA_hos5", 		[false, false, false], ""],
      ["obj",	["hos"], 		"BA_hos6", 		[false, false, false], ""]];
