/*
@filename: core\initServer.sqf
Author:
	Ben
Description:
	run on server
*/

#include "debug.hpp"

missionNamespace setVariable ["SERVER_INIT", true, true];

if ( isNil "PARAMETERS" ) then { PARAMETERS = []; };

//features server preInit
["SERVER", "preInit"] call core_fnc_featEvent;

//features server init
["SERVER", "init"] call core_fnc_featEvent;

//features leave eventHandler
if ( isNil "FEH_leave" ) then {
	FEH_leave = addMissionEventHandler ["HandleDisconnect", {
		["SERVER", "leave", _this] call core_fnc_featEvent;
		["PLAYER", "leave", _this] call core_fnc_featEvent;
	}];
};

//features server postInit
["SERVER", "postInit"] call core_fnc_featEvent;

publicVariable "PARAMETERS";

missionNamespace setVariable ["SERVER_INIT", false, true];