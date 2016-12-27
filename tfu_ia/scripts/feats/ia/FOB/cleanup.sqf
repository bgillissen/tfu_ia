/*
@filename: feats\ia\FOB\cleanup.sqf
Author:
	Ben
Description:
	this run on server,
	it cleanup an FOB mission 
*/

params ["_force", "_coord", "_groups", "_pad", "_truck", "_marker", "_veh1", "_veh2"];

deleteMarker _marker;
deleteVehicle _truck;
deleteVehicle _pad;

if ( !_force ) then {
	private _delay = ["ia", "checkDelay"] call BIS_fnc_GetCfgData;
	private _dist = ["ia", "deleteDistance"] call BIS_fnc_GetCfgData;
	waitUntil {
		sleep _delay;
		( ({((_x distance _coord) < _dist)} count allPlayers) == 0 )
	};
};

{
	{ deleteVehicle _x; } count (units _x);
	deleteGroup _x;
} count (_groups);

deleteVehicle _truck;
deleteVehicle _pad;

if ( count _this > 5 ) then {
	 deleteVehicle _veh1;
	 deleteVehicle _veh2;
};

{
	if ((count units _x) == 0) then { deleteGroup _x; };
} count allGroups;