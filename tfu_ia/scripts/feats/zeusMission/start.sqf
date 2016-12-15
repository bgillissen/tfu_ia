/*
@filename: feats\zeusMission\start.sqf
Author:
	Ben
Description:
	this script is executed on client side only by an action
	it set the value of the zeusMission global variable on the server to true
*/

{zeusMission = true;} remoteExec ["bis_fnc_call", 2, false]; 