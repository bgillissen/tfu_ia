/*
@filename: feats\baseVehicle\serverInit.sqf
Author:
	Ben
Description:
	run on server
 	spawn the base vehicles following the pool defined by the active base
 	ask vehicleRespawn to monitor them
*/

{
	_x params ["_pool", "_delay", "_marker"];
	_pool = missionNamespace getVariable format["BV_%1", _pool];
	private _veh = (selectRandom _pool) createVehicle (getMarkerPos _marker);
	_pool = nil;
	_veh setDir (markerDir _marker);
	[_veh, _delay] call vehicleRespawn_fnc_monitor;
} count BV;