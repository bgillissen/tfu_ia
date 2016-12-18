/*
@filename: feats\zeusMission\start.sqf
Author:
	Ben
Description:
	this script is executed on client side
	it ask the server to set the value of zeusMission to true
*/

(true] remoteExecCall ["zeusMission_fnc_srvSet", 2, false]; 