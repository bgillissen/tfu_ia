/*
@filename: core\initPlayer.sqf
Author:
	Ben
Description:
	this script is executed once by main init on player side only,
	it init the player side features
*/

#include "debug.hpp"

missionNamespace setVariable ["PLAYER_INIT", true, false];

//features playerPreInit
["PLAYER", "preInit"] call core_fnc_featEvent;

waitUntil {
	sleep 1;
#ifdef DEBUG
	conWhite(">>>> core_fnc_initPlayer is waiting for server init");
#endif
	((missionNamespace getVariable "SERVER_INIT") isEqualTo false)
};
#ifdef DEBUG
conWhite(">>>> core_fnc_initPlayer start");
#endif

waitUntil {!isNull player};
waitUntil {player isEqualTo player};

if ( isNil "FEH_join") then {
	["SERVER", "join", [player]] call core_fnc_featEvent;
	FEH_join = true;
};

["PLAYER", "init"] call core_fnc_featEvent;

if ( isNil "FEH_closeVA") then {
	//VAopen = false;
	//FEH_closeVA = ["FEH_closeVA", "onEachFrame", {_this call core_fnc_fehCloseVA;}, player] call BIS_fnc_addStackedEventHandler; 
	FEH_closeVA = [missionNamespace, "arsenalClosed", {["PLAYER", "closeVA"] call core_fnc_featEvent;}] call BIS_fnc_addScriptedEventHandler
};

if ( isNil "FEH_getIn") then {
	FEH_getIn = player addEventHandler ["GetInMan", {["PLAYER", "getIn", _this] call core_fnc_featEvent;}];
};

if ( isNil "FEH_switchSeat") then {
	FEH_switchSeat = player addEventHandler ["SeatSwitchedMan", {["PLAYER", "switchSeat", _this] call core_fnc_featEvent;}];
};

if ( isNil "FEH_getOut") then {
	FEH_getOut = player addEventHandler ["GetOutman", {["PLAYER", "getOut", _this] call core_fnc_featEvent;}];
};

if ( isNil "FEH_take") then {
	FEH_take = player addEventHandler ["Take", {["PLAYER", "take", _this] call core_fnc_featEvent;}];
};

if ( isNil "FEH_shoot") then {
	FEH_shoot = player addEventHandler ["Fired", {["PLAYER", "shoot", _this] call core_fnc_featEvent;}];
};

if ( isNil "FEH_killed") then {
	FEH_killed = player addEventHandler ["Killed", {
			["PLAYER", "killed", _this] call core_fnc_featEvent;
			["SERVER", "killed", [_this, player]] call core_fnc_featEvent; }];
};

["PLAYER", "postInit"] call core_fnc_featEvent;

missionNamespace setVariable ["PLAYER_INIT", false, false];