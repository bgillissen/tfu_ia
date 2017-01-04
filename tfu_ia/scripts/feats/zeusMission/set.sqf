/*
@filename: feats\zeusMission\set.sqf
Author:
	Ben
Description:
	run on player
	it ask server to update the value of the zeusMission variable
*/
params ["_thing", "_caller", "_id", "_arg"];

missionNamespace setVariable ["zeusMission", _arg, true];