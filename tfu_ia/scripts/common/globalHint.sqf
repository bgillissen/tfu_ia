/*
@filename: common\globalHint.sqf
Author:
	unknown, taken from ahoyworld I&A
Description:
	run on server
	used to ask players ro display a hint
*/

params ["_hint"];

[_hint]  remoteExec ["common_fnc_globalHintPlayer", PLAYER_SIDE, false];