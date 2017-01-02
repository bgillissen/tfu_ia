/*
@filename: feats\vehicleRespawn\monitor.sqf
Credit: Tophe for earlier monitor script
Author:
	Quiksilver, tweaked by ben
Description:
	run on server,
	add the given vehicle to the vehicle monitored by vehicleRespawn thread
*/

params ["_veh", "_delay", "_poolName"];

VR append [[_veh, _delay, _poolName, (getPosATL _veh), (getDir _veh)]];

[_veh, _poolName] call vehicleRespawn_fnc_setup;