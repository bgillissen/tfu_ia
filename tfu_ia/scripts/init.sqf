/*
@filename: init.sqf
Author:
	Ben
Description:
	run on all context by game engine on mission start
	call init functions depending on the context
*/

#include "core\debug.hpp"

if ( isMultiplayer ) exitWith {};

CTXT_SERVER = true;
CTXT_HEADLESS = false;
CTXT_PLAYER = true;

#ifdef DEBUG
conWhite("init.sqf START --------------------------------------------------------------------------------------------------------");
#endif

call core_fnc_initServer;
call core_fnc_initPlayer;

#ifdef DEBUG
conWhite("init.sqf END --------------------------------------------------------------------------------------------------------");
#endif