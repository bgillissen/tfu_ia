/*
@filename: core\initPlayer.sqf
Author:
	Ben
Description:
	this script is executed once by main init on player side only,
	it init the player side features
*/

missionNamespace setVariable ["PLAYER_INIT", true, false];

waitUntil {
	sleep 1;
	diag_log ">>>> initPlayer is waiting for server init";
	((missionNamespace getVariable "SERVER_INIT") isEqualTo false)
};
diag_log ">>>> start initPlayer";

waitUntil {!isNull player};
waitUntil {player isEqualTo player};


//features playerPreInit
["PLAYER", "preInit"] call core_fnc_featEvent;

//features playerInit
["PLAYER", "init"] call core_fnc_featEvent;

//register feature's onCloseVA
if ( isNil "FEH_closeVA") then {
	player setVariable ["VAopen", false];
	FEH_closeVA = ["FEH_closeVA", "onEachFrame", {_this call core_fnc_fehCloseVA;}, player] call BIS_fnc_addStackedEventHandler;  
};

//bind player's GetInMan event to feature's onGetIn
if ( isNil "FEH_getIn") then {
	FEH_getIn = player addEventHandler ["GetInMan", {["PLAYER", "onGetIn", _this] call core_fnc_featEvent;}];
};

//bind player's SwitchSeatInMan event to feature's onSwitchSeat
if ( isNil "FEH_switchSeat") then {
	FEH_switchSeat = player addEventHandler ["SeatSwitchedMan", {["PLAYER", "onSwitchSeat", _this] call core_fnc_featEvent;}];
};

//bind player's GetOutMan event to feature's onGetOut
if ( isNil "FEH_getOut") then {
	FEH_getOut = player addEventHandler ["GetOutman", {["PLAYER", "onGetOut", _this] call core_fnc_featEvent;}];
};

//bind player's Take event to feature's onPickUp
if ( isNil "FEH_pickUp") then {
	FEH_pickUp = player addEventHandler ["Take", {["PLAYER", "onPickUp", _this] call core_fnc_featEvent;}];
};

//bind player's Fired event to feature's onShoot
if ( isNil "FEH_onShoot") then {
	FEH_onShoot = player addEventHandler ["Fired", {["PLAYER", "onShoot", _this] call core_fnc_featEvent;}];
};

//features playerPostInit
["PLAYER", "postInit"] call core_fnc_featEvent;

missionNamespace setVariable ["PLAYER_INIT", false, false];