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

params ["_from", "_msg"];

[PLAYER_SIDE, _from] sideChat _msg;