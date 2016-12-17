/*
@filename: feats\curator\actionRelease.sqf
Author:
	Ben
Description:
	this script is executed player side when player want to ascend
*/

[player] remoteExec("curator_fnc_srvRequest", 2, false);