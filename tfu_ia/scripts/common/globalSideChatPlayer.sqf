/*
@filename: common\globalSideChatServer.sqf
Credit:
	unknown, taken from ahoyworld I&A
Author:
	ben

Description:
	run on player
	show a side chat message
*/

params ["_side", "_from", "_msg"];

[_side, _from] sideChat _msg;