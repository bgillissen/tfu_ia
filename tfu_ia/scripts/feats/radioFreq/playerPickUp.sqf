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

params ["_item"]; 

if ( call TFAR_fnc_haveSWRadio ) then { call radioFreq_fnc_setShortRange; };
if ( call TFAR_fnc_haveLRRadio ) then { call radioFreq_fnc_setLongRange; };