/*
@filename: feats\iaFOB\cleanup.sqf
Author:
	Ben
Description:
	this run on server,
	it cleanup an FOB mission 
*/

params ["_force", "_coord", "_groups", "_pad", "_truck", "_veh1", "_veh2"];

deleteVehicle _pad;
deleteVehicle _truck;

if ( !_force ) then {
	waitUntil {
		sleep IA_checkDelay
		({((_x distance _coord) < IA_deleteDistance)} count allPlayers) isEqualTo 0)
	};
};

{
	{ deleteVehicle _x } count (units _x);
	deleteGroup _x;
} count (_groups);

if ( count _this > 4 ) then {
	 deleteVehicle _veh1;
	 deleteVehicle _veh2;
};

{
	if ((count units _x) == 0) then deleteGroup _x;
} count allGroups;