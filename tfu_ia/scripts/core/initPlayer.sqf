/*
@filename: core\initPlayer.sqf
Author:
	Ben
Description:
	this script is executed once by main init on player side only,
	it init the player side features
*/

#ifndef INIT
#define INIT true
#define CTXT_SERVER false
#define CTXT_HEADLESS false
#define CTXT_PLAYER true
#define CTXT "PLAYER"
#endif

waitUntil {!isNull player};
waitUntil {player == player};

//features playerPreInit
[CTXT, "preInit"] call core_fnc_featEvents;

//features playerInit
[CTXT, "init"] call core_fnc_featEvents;

//features playerPostInit
[CTXT, "postInit"] call core_fnc_featEvents;