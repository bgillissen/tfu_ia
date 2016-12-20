/*
@filename: onPlayerRespawn.sqf
Author:
	ben
Description:
	run on player side by game engine when player (re)spawn
	launch or spawn scripts required by features
*/

waitUntil {!isNull player};
waitUntil {player == player};

//features onRespawn (player side)(local)
[CTXT, "onRespawn", [player]] call core_fnc_featEvent;
//features onRespawn (server side)(remote)
["SERVER", "onRespawn", [player]] call core_fnc_featEvent;