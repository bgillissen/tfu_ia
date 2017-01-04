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

#ifdef DEBUG
diag_log "onPlayerRespawn.sqf START --------------------------------------------------------------------------------------------------------";
#endif

waitUntil {
	sleep 1;
#ifdef DEBUG
conWhite(">>>> onPlayerRespawn is waiting for server init to end");
#endif
	((missionNamespace getVariable "SERVER_INIT") isEqualTo false)
};
#ifdef DEBUG
conWhite(">>>> onPlayerRespawn server has init");
#endif
waitUntil {
	sleep 1;
#ifdef DEBUG
conWhite(">>>> onPlayerRespawn is waiting for player init to end");
#endif
	((missionNamespace getVariable "PLAYER_INIT") isEqualTo false)
};

#ifdef DEBUG
conWhite(">>>> start onPlayerRespawn");
#endif

waitUntil {!isNull player};
waitUntil {player == player};

//features onRespawn (player side)(local)
["PLAYER", "onRespawn", [player]] call core_fnc_featEvent;

//features onRespawn (server side)(remote)
["SERVER", "onRespawn", [player]] call core_fnc_featEvent;

#ifdef DEBUG
diag_log "onPlayerRespawn.sqf END --------------------------------------------------------------------------------------------------------";
#endif