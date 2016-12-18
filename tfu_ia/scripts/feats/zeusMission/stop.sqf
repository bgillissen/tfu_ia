/*
@filename: feats\zeusMission\stop.sqf
Author:
	Ben
Description:
	this script is executed on client side
	it ask the server to set the value of zeusMission to false
*/

(false] remoteExecCall ["zeusMission_fnc_srvSet", 2, false];