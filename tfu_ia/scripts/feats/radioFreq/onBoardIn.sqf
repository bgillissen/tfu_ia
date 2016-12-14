/*
@filename: feats\radioFreq\onBoardIn.sqf
Author:
	Ben
Description:
	called player side when a player enter a vehicle.
	set the long range radio channel frequencies of that vehicle
*/

param ["_pos", "_veh"];
		
if ( _pos == "cargo" ) exitWith{}; 
if ( _veh call TFAR_fnc_hasVehicleRadio ) then {
	if ( PLAYER_SIDE == "blufor" ) then {
		_veh setVariable ["tf_side", "west", true];
	} else {
		_veh setVariable ["tf_side", "east", true];
	}
	call radioFreq_fnc_setLongRange;
}; 