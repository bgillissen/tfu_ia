/*
@filename: feats\zeusMission\stop.sqf
Author:
	Ben
Description:
	this script is executed on client side only by an action
	it set the value of the zeusMission global variable on the server to false
*/

{zeusMission = false;} remoteExec ["bis_fnc_call", 2, false];