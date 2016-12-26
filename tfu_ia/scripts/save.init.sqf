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

diag_log "START --------------------------------------------------------------------------------------------------------";
if ( isServer ) then { call core_fnc_initServer; };

if ( isDedicated ) then {
	if ( !isServer && !hasInterface ) then { call core_fnc_initHeadless; };
	if ( hasInterface && isDedicated ) then { call core_fnc_initPlayer; };
};
diag_log "END --------------------------------------------------------------------------------------------------------";