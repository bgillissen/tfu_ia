/*
@filename: initPlayerLocal.sqf
Author:
	Ben
Description:
	run on player by game engine on join
	call init functions
*/

//!!! you MUST comment ONLY the following line to disable debug
#define DEBUG

#include "core\debug.hpp"

if ( !isMultiplayer ) exitWith {};

CTXT_SERVER = false;
CTXT_HEADLESS = !hasInterface;
CTXT_PLAYER = hasInterface;

diag_log "initPlayerLocal.sqf START --------------------------------------------------------------------------------------------------------";
if ( CTXT_HEADLESS ) then {
	call core_fnc_initHeadless; 
} else {
	call core_fnc_initPlayer; 
};
diag_log "initPlayerLocal.sqf END --------------------------------------------------------------------------------------------------------";