/*
@filename: feats\fatigue\playerOnRespawn.sqf
Author:
	Ben
Description:
	called on player side each time player (re)spawn.
	it enable or disable the fatigue system following the fatigue mission parameter
*/

player enableFatigue (PARAMS_Fatigue == 1);