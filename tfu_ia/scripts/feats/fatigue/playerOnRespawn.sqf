/*
@filename: feats\fatigue\playerOnRespawn.sqf
Author:
	Ben
Description:
	run on player each time player (re)spawn.
	it enable or disable the fatigue system
*/

private _bool = [false, true] select (["fatigue"] core_fnc_getConf);

player enableFatigue _bool;