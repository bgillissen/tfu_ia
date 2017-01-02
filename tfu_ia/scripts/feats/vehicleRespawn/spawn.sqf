/*
@filename: feats\vehicleRespawn\spawn.sqf
Author:
	ben
Description:
	run on server
	respawn an abandoned/destroyed vehicle
*/

params ["_veh", "_poolName", "_pos", "_dir"];

if (!isNull _veh) then {
	if ( alive _veh ) then {
		_veh setDir _dir;
		_veh allowDamage false;
		_veh setPos _pos;
		_veh setDamage 0;
		_veh setVehicleAmmo 1;
		if ((fuel _veh) < 0.90) then {
			[[_veh, 1], "setFuel", true, false] spawn BIS_fnc_MP;
		};
		if (isEngineOn _veh) then {
			_veh engineOn false;
		};
		if (isCollisionLightOn _veh) then {
			_veh setCollisionLight false;
		};
		if (isLightOn _veh) then {
			_veh setPilotLight false;
		};
		_veh allowDamage true;
	} else {
		deleteVehicle _veh;
	};
} else {
	_pool = missionNamespace getVariable format["BV_%1", _poolName];
	_veh = createVehicle [(selectRandom _pool), [0,0,0], [], 0, "NONE"];
	_veh setDir _dir;
	_veh setPos _pos;
	[_veh, _poolName] call vehicleRespawn_fnc_setup;
};

_veh