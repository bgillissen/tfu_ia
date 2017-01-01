/*
@filename: feats\radioFreq\playerPickUp.sqf
Author:
	Ben
Description:
	run on player when player pick up something.
	if it's a tfar radio, set its channel frequencies 
*/

if ( !MOD_tfar ) exitWith{};
if ( (["radioFreq"] call core_fnc_getConf) == 0 ) exitWith{};

params ["_unit", "_cont", "_item"]; 

diag_log format["RadioFreq Pickup: %1", _item];

[_item] spawn {
	params ["_radio"];
	waitUntil {		
		sleep 0.5;
		( count ([true, _radio] call radioFreq_fnc_searchRadios) == 0);
	};
	sleep 2;
	{
		diag_log format["RadioFreq Pickup: set Freq to %1", _x];
		[_x] call radioFreq_fnc_setShortRange;
	} count ([false, _radio] call radioFreq_fnc_searchRadios);
	
	if ( call TFAR_fnc_haveLRRadio ) then { 
		call radioFreq_fnc_setLongRange; 
	};
};