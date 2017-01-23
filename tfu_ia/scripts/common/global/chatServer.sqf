/*
@filename: common\global\chatServer.sqf
Author:
	ben

Description:
	run on server
	used to send message globaly
*/

if ( !isServer ) exitwith {};

_this remoteExec ["global_fnc_chatPlayer", 0, false];