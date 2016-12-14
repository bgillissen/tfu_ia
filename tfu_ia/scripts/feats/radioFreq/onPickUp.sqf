/*
@filename: feats\radioFreq\onPickUp.sqf
Author:
	Ben
Description:
	called player side when a player pick up a radio in a supplyBox.
	set the radio channel frequencies of the given item, if it s a radio ;)
*/

param ["_item"]; 

if ( _item in TFAR_SR ) then {
	call radioFreq_fnc_setShortRange;
} else {
	if ( _item in TFAR_LR ) then { call radioFreq_fnc_setLongRange; };
}