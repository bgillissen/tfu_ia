/*
@filename: feats\curator\actionRelease.sqf
Author:
	Ben
Description:
	this script is executed player side when a zeus drop his rights
*/

[player] remoteExec("curator_fnc_srvRelease", 2, false);