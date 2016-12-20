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
waitUntil {player isEqualto player};

//features playerPreInit
[CTXT, "preInit"] call core_fnc_featEvents;

//features playerInit
[CTXT, "init"] call core_fnc_featEvents;

//register feature's onCloseVA EH
if ( isNil "FEH_closeVA") then {
	player setVariable ["VAopen", false];
	FEH_closeVA =  ["FEH_closeVA", "onEachFrame", {[CTXT, "closeVA", _this] call core_fnc_fehCloseVA}, player] call BIS_fnc_addStackedEventHandler];  
};

//bind player's GetInMan ebent to feature's onBoardIn EH
if ( isNil "FEH_boardIn") then {
	FEH_boardIn = player addEventHandler ["GetInMan", {[CTXT, "onBoardIn", _this] call core_fnc_featEvent;}];
};

//bind player's Take event to feature's onPickUp EH
if ( isNil "FEH_pickUp") then {
	FEH_pickUp = player addEventHandler ["Take", {[CTXT, "onPickUp", _this] call core_fnc_featEvent;}];
};

//features playerPostInit
[CTXT, "postInit"] call core_fnc_featEvent;