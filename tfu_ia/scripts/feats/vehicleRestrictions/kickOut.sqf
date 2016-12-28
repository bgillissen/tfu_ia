/*
@filename: feats\vehicleRestrictions\secureKickOut.sqf
Author:
	Ben
Description:
	run on player
	kickout player from the vehicle seat he is in,
	if vehicle is moving move him to crago, else kick out.
*/

params ["_veh"];

if ( (speed _veh) > 0 ) then {
	player moveInCargo _veh;
} else {
	player action ["getOut", _veh];
};