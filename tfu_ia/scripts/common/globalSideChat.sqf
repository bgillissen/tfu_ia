/*
@filename: common\globalSideChat.sqf
Author:
	unknown, taken from ahoyworld I&A
Description:
	run on player
	ask server to send a sideChat message globaly
*/

params ["_from", "_msg"];

if ( !isServer ) exitWith {
	[PLAYER_SIDE, _from, _msg] remoteExec ["common_fnc_globalSideChatServer", 2, false];
};

[PLAYER_SIDE, _from, _msg] call common_fnc_globalSideChatServer;