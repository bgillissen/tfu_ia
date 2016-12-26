/*
@filename: core\initHeadless.sqf
Author:
	Ben
Description:
	this script is executed once by main init on headless side only,
	it init the headless side features
*/

CTXT_SERVER = false;
CTXT_HEADLESS = true;
CTXT_PLAYER = false;
CTXT = "HEADLESS";

waitUntil {!isNull player};
waitUntil {player == player};

//features headlessPreInit call/spawn
[CTXT, "preInit"] call core_fnc_featEvent;

//features headlessInit call/spawn
[CTXT, "init"] call core_fnc_featEvent;

//features headlessPostInit
[CTXT, "postInit"] call core_fnc_featEvent;