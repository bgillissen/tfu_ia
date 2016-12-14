/*
@filename: feats\vehicleRespawn\monitor.sqf
Credit: Tophe for earlier monitor script
Author:
	Quiksilver, tweaked by ben
Description:
	This script will run on all context (vehicle init field).
	must be spawn, not called.
	one for each vehicle you want to monitor, like this:
		0 = [this,30] spawn vehicleRespawn_fnc_monitor;
*/

if (!isServer) exitWith{};

param ["_v", "_d"];
private ["_t","_sd","_sp","_ti","_u"];

#define DIST_FROM_SPAWN 150

_t = typeOf _v;
_sd = getDir _v;
_sp = getPosATL _v;

sleep (5 + (random 5));

[_v] call vehicleRespawn_fnc_setup;

//Monitor loop
while {true} do {
	
	//If destroyed
	if (!alive _v) then {
		if (({((_sp distance _x) < 1.5)} count (entities "AllVehicles")) < 1) then {
			_ti = time + _d;
			waitUntil {sleep 5; (_ti < time)};
			if (!isNull _v) then {deleteVehicle _v;}; sleep 0.1;
			_v = createVehicle [_t,[(random 1000),(random 1000),(10000 + (random 20000))],[],0,"NONE"]; sleep 0.1;
			waitUntil {!isNull _v}; sleep 0.1;
			_v setDir _sd; sleep 0.1;
			_v setPos [(_sp select 0),(_sp select 1),((_sp select 2)+0.1)]; sleep 0.1;
			[_v] call vehicleRespawn_fnc_setup;
		};
	} else {
		if ((_v distance _sp) > DIST_FROM_SPAWN) then {
			if (isMultiplayer) then {
				_u = playableUnits;
			} else {
				_u = switchableUnits;
			};
			if (({(_v distance _x) < PARAMS_VehicleRespawnDistance} count _u) < 1) then {
				if ((count (crew _v)) == 0) then {
					_v lock 2;
					_v allowDamage FALSE;
					_v setPos [(random 1000),(random 1000),(10000 + (random 20000))];
					_v enableSimulationGlobal FALSE;
					_v hideObjectGlobal TRUE;
					waitUntil {
						sleep (5 + (random 5)); 
						(({(_sp distance _x) < 1.5} count (entities "AllVehicles")) < 1)
					};
					_v enableSimulationGlobal TRUE;
					_v hideObjectGlobal FALSE;
					_v allowDamage TRUE;
					_v lock 0;
					_v setDir _sd; sleep 0.1;
					_v setPos _sp; sleep 0.1;
					_v setDamage 0; sleep 0.1;
					_v setVehicleAmmo 1; sleep 0.1;
					if ((fuel _v) < 0.95) then {[[_v,1],"setFuel",true,false] spawn BIS_fnc_MP;};
					if (isEngineOn _v) then {_v engineOn FALSE;}; sleep 0.1;
					if (isCollisionLightOn _v) then {_v setCollisionLight FALSE;}; sleep 0.1;
					if (isLightOn _v) then {_v setPilotLight FALSE;}; sleep 0.1;
				};
			};
		};
	};
	sleep (20 + (random 20));
};