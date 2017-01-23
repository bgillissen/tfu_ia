/*
@filename: common\global\chat.sqf
Description:
	run on player or server
	ask server to send a chat message globaly
*/


if ( !isServer ) exitWith {
	_this remoteExec ["global_fnc_chatServer", 2, false];
};

_this call global_fnc_chatServer;