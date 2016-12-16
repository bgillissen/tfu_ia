/*
@filename: feats\vehicleRespawn\spawn.sqf
Author:
	ben
Description:
	This script will run server side,
	respawn a abandoned/destroyed vehicle
*/

param ["_veh", "_type", "_pos", "_dir"];

if (!isNull _veh) then {
	if ( alive _veh ) then {
		_veh setDir _dir;
		_veh allowDamage false;
		_veh setPos _pos;
		_veh setDamage 0;
		_veh setVehicleAmmo 1;
		if ((fuel _veh) < 0.90) then [[_veh, 1], "setFuel", true, false] spawn BIS_fnc_MP;
		if (isEngineOn _veh) then _veh engineOn false;
		if (isCollisionLightOn _veh) then _veh setCollisionLight false;
		if (isLightOn _veh) then _veh setPilotLight false;
		_veh allowDamage true;
		exitWith{ _veh };
	};
	deleteVehicle _veh; 
};
_veh = createVehicle [_type, _pos, [], 0, "NONE"];
waitUntil {
	sleep 0.1;
	!isNull _veh
};
_veh setDir _dir;

[_veh] call vehicleRespawn_fnc_setup;

_veh