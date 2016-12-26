/*
@filename: feats\earPlugs\swapState.sqf
Author:
	Ben
Description:
	run on player side by a display event handler
	swap the state of the earPlugs
*/

params ["_keyCode"];

if ( _keyCode != (["earPlugs", "keycode"] call BIS_fnc_GetCfgData) ) exitWith{};        

if ( earPlug_state ) then {
	earPlug_state = false;
	2 fadeSound 1;
	player groupChat (["earPlugs", "offMsg"] call BIS_fnc_GetCfgData); 
} else { 
	earPlug_state = true;
	2 fadeSound (["earPlugs", "volume"] call BIS_fnc_GetCfgData); 
	player groupChat (["earPlugs", "onMsg"] call BIS_fnc_GetCfgData);
};