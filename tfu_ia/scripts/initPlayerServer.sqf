/*
@filename: initPlayerServer.sqf
Author:
	ben
Description:
	run on server side by game engine when player join
	launch or spawn scripts required by features
*/

params ["_player"];

#include "core\debug.hpp"

if ( !isMultiplayer ) exitWith {};

CTXT_SERVER = true;
CTXT_HEADLESS = false;
CTXT_PLAYER = false;

#ifdef DEBUG
conWhite ("initPlayerServer.sqf START --------------------------------------------------------------------------------------------------------");
#endif

["SERVER", "onJoin", [_player]] call core_fnc_featEvent;

#ifdef DEBUG
conWhite("initPlayerServer.sqf END --------------------------------------------------------------------------------------------------------");
#endif