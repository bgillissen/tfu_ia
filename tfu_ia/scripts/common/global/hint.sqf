/*
@filename: common\global\hint.sqf
Description:
	run on server
	used to ask players to display a hint
*/

_this remoteExec ["global_fnc_hintPlayer", 0, false];