/*
@filename: feats\zeusMission\set.sqf
Author:
	Ben
Description:
	run on player
	it ask server to update the value of the zeusMission variable
*/

params ["_bool"];

missionNamespace setVariable ["zeusMission", _bool, true];