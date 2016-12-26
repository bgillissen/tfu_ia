/*
@filename: core\initPlayer.sqf
Author:
	Ben
Description:
	this script is executed once by main init on player side only,
	it init the player side features
*/

CTXT_SERVER = false;
CTXT_HEADLESS = false;
CTXT_PLAYER = true;
CTXT = "PLAYER";

waitUntil {!isNull player};
waitUntil {player isEqualTo player};

//features playerPreInit
[CTXT, "preInit"] call core_fnc_featEvent;

//features playerInit
[CTXT, "init"] call core_fnc_featEvent;

//register feature's onCloseVA
if ( isNil "FEH_closeVA") then {
	player setVariable ["VAopen", false];
	FEH_closeVA = ["FEH_closeVA", "onEachFrame", {_this call core_fnc_fehCloseVA;}, player] call BIS_fnc_addStackedEventHandler;  
};

//bind player's GetInMan event to feature's onGetIn
if ( isNil "FEH_getIn") then {
	FEH_getIn = player addEventHandler ["GetInMan", {[CTXT, "onGetIn", _this] call core_fnc_featEvent;}];
};

//bind player's SwitchSeatInMan event to feature's onSwitchSeat
if ( isNil "FEH_switchSeat") then {
	FEH_switchSeat = player addEventHandler ["SeatSwitchedMan", {[CTXT, "onSwitchSeat", _this] call core_fnc_featEvent;}];
};

//bind player's GetOutMan event to feature's onGetOut
if ( isNil "FEH_getOut") then {
	FEH_getOut = player addEventHandler ["GetOutman", {[CTXT, "onGetOut", _this] call core_fnc_featEvent;}];
};

//bind player's Take event to feature's onPickUp
if ( isNil "FEH_pickUp") then {
	FEH_pickUp = player addEventHandler ["Take", {[CTXT, "onPickUp", _this] call core_fnc_featEvent;}];
};

//bind player's Fired event to feature's onShoot
if ( isNil "FEH_onShoot") then {
	FEH_onShoot = player addEventHandler ["Fired", {[CTXT, "onShoot", _this] call core_fnc_featEvent;}];
};

//features playerPostInit
[CTXT, "postInit"] call core_fnc_featEvent;