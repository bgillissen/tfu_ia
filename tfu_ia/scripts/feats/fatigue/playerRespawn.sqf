/*
@filename: feats\fatigue\playerOnRespawn.sqf
Author:
	Ben
Description:
	run on player each time player (re)spawn.
	it enable or disable the fatigue system
*/

player enableFatigue ([false, true] select (["fatigue"] call core_fnc_getParam));