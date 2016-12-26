/*
@filename: onPlayerRespawn.sqf
Author:
	ben
Description:
	run on player side by game engine when player (re)spawn
	launch or spawn feature's scripts linked to onRespawn event
*/

#define DEBUG
#include "core\debug.hpp"

CTXT_SERVER = !isMultiplayer;
CTXT_HEADLESS = false;
CTXT_PLAYER = true;

waitUntil {
	sleep 1;
#ifdef DEBUG
	diag_log ">>>> onPlayerRespawn is waiting for server init end ";
#endif
	((missionNamespace getVariable "SERVER_INIT") isEqualTo false)
};
waitUntil {
	sleep 1;
#ifdef DEBUG
	diag_log ">>>> onPlayerRespawn is waiting for player init end";
#endif
	((missionNamespace getVariable "PLAYER_INIT") isEqualTo false)
};
#ifdef DEBUG
diag_log ">>>> start onPlayerRespawn";
#endif

waitUntil {!isNull player};
waitUntil {player == player};

//features onRespawn (player side)(local)
["PLAYER", "onRespawn", [player]] call core_fnc_featEvent;
//features onRespawn (server side)(remote)
["SERVER", "onRespawn", [player]] call core_fnc_featEvent;