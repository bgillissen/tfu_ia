/*
@filename: init.sqf
Author:
	Ben
Description:
	run on all context by game engine on mission start
	call init functions depending on the context
*/

//!!! you MUST comment ONLY the following line to disable debug
#define DEBUG

#include "core\debug.hpp"

if ( isMultiplayer ) exitWith {};

CTXT_SERVER = true;
CTXT_HEADLESS = false;
CTXT_PLAYER = true;

diag_log "init.sqf START --------------------------------------------------------------------------------------------------------";
call core_fnc_initServer;
call core_fnc_initPlayer;
diag_log "init.sqf END --------------------------------------------------------------------------------------------------------";