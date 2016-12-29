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
      ["heliSmallArmed", 	20, "BV_lb2"]];

//------------------------------------------------------------ Base atmosphere

BA = [["npc",	["arsenal"],	"BA_leftVA",	[false, false, false]],
      ["npc",	["arsenal"], 	"BA_rightVA", 	[false, false, false]],
      ["npc",	["support"], 	"BA_support",	[false, false, false]],
      ["npc",	["medic"],		"BA_medic", 	[false, false, false]],
      ["obj",	["arsenal"], 	"BA_crewVA", 	[false, false, false]],
      ["obj",	["arsenal"], 	"BA_heliVA", 	[false, false, false]],
      ["obj",	["arsenal"], 	"BA_jetVA",		[false, false, false]],
      ["obj",	["arsenal"], 	"BA_fobVA",		[false, false, false]],
      ["obj",	["arsenal"], 	"BA_frVA",		[false, false, false]],
      ["obj",	["billboard"], 	"BA_leftBB", 	[false, true, false]],
      ["obj",	["billboard"], 	"BA_rightBB", 	[false, true, false]],
      ["obj",	["hos"], 		"BA_hos0", 		[false, true, false]],
      ["obj",	["hos"], 		"BA_hos1", 		[false, true, false]],
      ["obj",	["hos"], 		"BA_hos2", 		[false, true, false]],
      ["obj",	["hos"], 		"BA_hos3", 		[false, true, false]],
      ["obj",	["hos"], 		"BA_hos4", 		[false, true, false]],
      ["obj",	["hos"], 		"BA_hos5", 		[false, true, false]],
      ["obj",	["hos"], 		"BA_hos6", 		[false, true, false]]];
