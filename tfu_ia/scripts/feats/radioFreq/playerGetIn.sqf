/*
@filename: feats\radioFreq\playerGetIn.sqf
Author:
	Ben
Description:
	called player side when a player enter a vehicle.
	set the long range radio side and channel frequencies of that vehicle
*/

if ( !MOD_tfar ) exitWith{};
if ( !(["radioFreq"] call core_fnc_getConf) ) exitWith{}; 

params ["_pos", "_veh"];
		
if ( _pos == "cargo" ) exitWith{}; 
if ( _veh call TFAR_fnc_hasVehicleRadio ) then {
	if ( PLAYER_SIDE isEqualTo west ) then {
		_veh setVariable ["tf_side", "west", true];
	} else {
		_veh setVariable ["tf_side", "east", true];
	}
	call radioFreq_fnc_setLongRange;
};