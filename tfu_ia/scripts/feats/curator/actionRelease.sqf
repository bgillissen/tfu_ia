/*
@filename: feats\curator\actionRelease.sqf
Author:
	Ben
Description:
	this script is executed on player side
	it ask the server to unassign the player from the curator module
*/

[player] remoteExec ("curator_fnc_release", 2, false);