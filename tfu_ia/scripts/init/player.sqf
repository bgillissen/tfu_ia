/*
@filename: init\player.sqf
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
[] call common_fnc_featInit;