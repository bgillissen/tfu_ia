/*
@filename: feats\earPlugs\swapState.sqf
Author:
	Ben
Description:
	run on player side by a display event handler
	swap the state of the earPlugs
*/

params ["_keyCode"];

if ( _keycode != EP_keyCode ) then exitWith{};        

if ( earPlug_state == 1 ) then {
	earPlug_state = 0;
	2 fadeSound 1;
	player groupChat EP_offMsg; 
} else { 
	earPlug_state = 1;
	2 fadeSound EP_volume;
	player groupChat EP_onMsg;
};