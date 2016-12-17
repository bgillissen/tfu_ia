/*
@filename: initPlayerServer.sqf
Author:
	ben
Description:
	run on server side by game engine when player join
	launch or spawn scripts required by features
*/

param ["_player"];

[CTXT, "onJoin", [_player]] call common_fnc_featInit;