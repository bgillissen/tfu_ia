/*
@filename: feats\radioFreq\onPickUp.sqf
Author:
	Ben
Description:
	called player side when a player pick up something.
	if it's a tfar radio, set its channel frequencies 
*/

if ( !MOD_tfar ) exitWith{};
if ( !(["radioFreq"] call core_fnc_getConf) ) exitWith{};

params ["_item"]; 

if ( _item in TFAR_SR ) then {
	call radioFreq_fnc_setShortRange;
} else {
	if ( _item in TFAR_LR ) then { call radioFreq_fnc_setLongRange; };
}