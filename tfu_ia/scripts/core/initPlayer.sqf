/*
@filename: core\initPlayer.sqf
Author:
	Ben
Description:
	this script is executed once by main init on player side only,
	it init the player side features
*/

#define CTXT_SERVER false
#define CTXT_HEADLESS false
#define CTXT_PLAYER true
#define CTXT "PLAYER"

waitUntil {!isNull player};
waitUntil {player == player};

//features init
[CTXT, "init"] call core_fnc_featEvents;