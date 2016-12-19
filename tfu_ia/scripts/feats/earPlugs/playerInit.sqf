/*
@filename: feats\hearPlugs\player.sqf
Author:
	Ben
Description:
	Run once on player side only,
	This script add the key binding to plugs in/out the earplugs
*/

if ( PARAMS_hearPlugs == 0 ) then exitWith{};

hearPlug_state = 0; 

hearPlug_swapSate = {
	params ["_keyCode"];
	if ( _keycode != 197 ) then exitWith{};        
 	switch (hearPlug_state) do {
    	case 1: { hearPlug_state = 0; 2 fadeSound 1; player groupChat 'EarPlugs removed'; };
		case 0: { hearPlug_state = 1; 2 fadeSound 0.2; player groupChat 'Earplugs fitted';  };
	};
};

_hint  = "<t color='#ff9d00' size='1.2' shadow='1' shadowColor='#000000' align='center'>** Earplugs Recieved **</t>          Use [Pause/Break] key to Insert and Remove";  
hint parseText (_hint);

(findDisplay 46) displayAddEventHandler ["KeyDown", [_this select 1] call hearPlug_swapSate];