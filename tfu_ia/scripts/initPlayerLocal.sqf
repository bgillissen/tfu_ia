/*
@filename: initPlayerLocal.sqf
Author:
	Ben
Description:
	run on player by game engine on join
	call init functions
*/

#include "core\debug.hpp"

if ( !isMultiplayer ) exitWith {};

CTXT_SERVER = false;
CTXT_HEADLESS = !hasInterface;
CTXT_PLAYER = hasInterface;

if ( CTXT_HEADLESS ) then {
	call core_fnc_initHeadless; 
} else {
	call core_fnc_initPlayer; 
};