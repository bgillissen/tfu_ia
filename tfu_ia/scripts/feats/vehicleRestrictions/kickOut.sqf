/*
@filename: feats\vehicleRestrictions\kickOut.sqf
Author:
	Ben
Description:
	run on player
	kickout player from the vehicle seat he is in,
	if vehicle is moving move him to crago, else kick out.
*/
params ["_veh", "_wasIn"];

if ( isNil "_wasIn" ) then { _wasIn = false; };

if ( !_wasIn ) exitWith {
	player action ["getOut", _veh];
};

_veh call vehicleRestrictions_fnc_toCargo;