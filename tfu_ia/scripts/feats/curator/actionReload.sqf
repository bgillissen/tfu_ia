/*
@filename: feats\curator\actionReload.sqf
Author:
	Ben
Description:
	this script is executed player side when player want to reload the curator list
*/

remoteExec("curator_fnc_srvReload", 2, false);