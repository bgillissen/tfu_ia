/*
@filename: feats\gearRestrictions\playerOnCloseVA.sqf
Author:
	Ben
Description:
	this run on player side
	apply weapon / items restriction if player is outside the fire range
*/

if ( (["restrictGear"] call core_fnc_getParam) == 0 ) exitWith {};

if ( (player distance (getMarkerPos "FR")) < FR_RADIUS ) exitWith {}; 

call gearRestrictions_fnc_checkGears