/*
@filename: common\globalHint.sqf
Author:
	unknown, taken from ahoyworld I&A
Description:
	run on server
	used to ask players ro display a hint
*/

_this  remoteExec ["common_fnc_globalHintPlayer", PLAYER_SIDE, false];