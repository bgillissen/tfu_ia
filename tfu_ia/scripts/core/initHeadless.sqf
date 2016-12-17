/*
@filename: init\headless.sqf
Author:
	Ben
Description:
	this script is executed once by main init on headless side only,
	it init the headless side features
*/

#define CTXT_SERVER false
#define CTXT_HEADLESS true
#define CTXT_PLAYER false
#define CTXT "HEADLESS"

waitUntil {!isNull player};
waitUntil {player == player};

//features init
[CTXT, "init"] call core_fnc_featEvents;