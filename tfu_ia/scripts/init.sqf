/*
@filename: init.sqf
Author:
	Ben
Description:
	run on all context by game engine on mission start
	call init functions depending on the context
*/

if ( isMultiplayer ) exitWith {};

CTXT_SERVER = true;
CTXT_HEADLESS = false;
CTXT_PLAYER = true;

[] spawn core_fnc_initServer;
[] spawn core_fnc_initPlayer;