/*
@filename: onPlayerRespawn.sqf
Author:
	ben
Description:
	run on player side by game engine when player (re)spawn
	launch or spawn feature's scripts linked to onRespawn event
*/

#include "core\debug.hpp"

CTXT_SERVER = isServer;
CTXT_HEADLESS = (!isDedicated && !hasInterface);
CTXT_PLAYER = hasInterface;

if ( !CTXT_PLAYER ) exitWith {};

waitUntil {
	((missionNamespace getVariable "SERVER_INIT") isEqualTo false)
};
#ifdef DEBUG
conWhite(">>>> onPlayerRespawn server has init");
#endif
waitUntil {
	((missionNamespace getVariable "PLAYER_INIT") isEqualTo false)
};

#ifdef DEBUG
conWhite(">>>> start onPlayerRespawn");
#endif

waitUntil {!isNull player};
waitUntil {player == player};

["PLAYER", "respawn", [player]] call core_fnc_featEvent;
["SERVER", "respawn", [player]] call core_fnc_featEvent;