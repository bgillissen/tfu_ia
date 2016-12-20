/*
@filename: feats\curator\actionReload.sqf
Author:
	Ben
Description:
	this script is executed player side
	it ask the server to reload the allowed curator list
*/

remoteExec ("curator_fnc_reload", 2, false);