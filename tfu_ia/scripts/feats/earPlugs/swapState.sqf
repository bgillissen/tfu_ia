/*
@filename: feats\earPlugs\swapState.sqf
Author:
	Ben
Description:
	run on player side by a display event handler
	swap the state of the earPlugs
*/

params ["_control", "_keyCode", "_shift", "_ctrl", "_alt"];

if ( isNil "_keyCode" ) exitWith {};

if ( _shift || _ctrl || _alt ) exitWith {};

if ( _keyCode != (["earPlugs", "keycode"] call BIS_fnc_GetCfgData) ) exitWith {};        

if ( time <= EP_availAt ) exitWith {};

if ( earPlug_state ) then {
	earPlug_state = false;
	2 fadeSound 1;
	systemChat (["earPlugs", "offMsg"] call BIS_fnc_GetCfgData); 
} else { 
	earPlug_state = true;
	2 fadeSound (["earPlugs", "volume"] call BIS_fnc_GetCfgData); 
	systemChat (["earPlugs", "onMsg"] call BIS_fnc_GetCfgData);
};

EP_availAt = time + (["earPlugs", "delay"] call BIS_fnc_GetCfgData);