/*
@filename: feats\vehicleRespawn\monitor.sqf
Credit: Tophe for earlier monitor script
Author:
	Quiksilver, tweaked by ben
Description:
	This script will run on all context (vehicle init field).
	one for each vehicle you want to monitor, like this:
		[this,30] call vehicleRespawn_fnc_monitor;
*/

if (!isServer) exitWith{};

param ["_veh", "_delay"];

if ( isNil "VEHRESPAWN" ) then VEHRESPAWN = [];

VEHRESPAWN append [_veh, _delay, (typeOf _veh), (getPosATL _veh), (getDir _veh)];

[_veh] call vehicleRespawn_fnc_setup;