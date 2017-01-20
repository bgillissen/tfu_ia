/*
@filename: common\globalSideChatServer.sqf
Credit:
	unknown, taken from ahoyworld I&A
Author:
	ben

Description:
	run on server
	used to send message on the side channel globaly
*/

if ( !isServer ) exitwith {};

params ["_side", "_from", "_msg"];

[_side, _from, _msg] remoteExec ["common_fnc_globalSideChatPlayer", _side, false];