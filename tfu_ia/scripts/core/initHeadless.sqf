/*
@filename: core\initHeadless.sqf
Author:
	Ben
Description:
	this script is executed once by main init on headless side only,
	it init the headless side features
*/

#include "debug.hpp"

missionNamespace setVariable ["HEADLESS_INIT", true, false];

//features headlessPreInit call/spawn
["HEADLESS", "preInit"] call core_fnc_featEvent;

waitUntil {
	sleep 1;
#ifdef DEBUG
conWhite(">>>> core_fnc_initHeadless is waiting for server to init");
#endif
	((missionNamespace getVariable "SERVER_INIT") isEqualTo false)
};
#ifdef DEBUG
conWhite(">>>> start core_fnc_initHeadless");
#endif

waitUntil {!isNull player};
waitUntil {player == player};


//features headlessInit call/spawn
["HEADLESS", "init"] call core_fnc_featEvent;

//features headlessPostInit
["HEADLESS", "postInit"] call core_fnc_featEvent;

missionNamespace setVariable ["HEADLESS_INIT", false, false];