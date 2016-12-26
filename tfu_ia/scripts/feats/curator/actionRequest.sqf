/*
@filename: feats\curator\actionRelease.sqf
Author:
	Ben
Description:
	this script is executed player side
	it ask server the assign player to a curator module
*/

[player] remoteExec ["curator_fnc_request", 2, false];