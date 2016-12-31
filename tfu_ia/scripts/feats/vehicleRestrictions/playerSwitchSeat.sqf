/*
@filename: feats\vehicleRestrictions\playerSwitchSeat.sqf
Author:
	Ben
Description:
	called player side when a player switch seat in a vehicle.
	check that player can drive/gun/copilot that vehicle
*/

params ["_unit", "_notneeded", "_veh"];


if ( _pos == "Cargo" ) exitWith{};

if ( _veh isKindOf "ParachuteBase" ) exitWith {};

private _role = _unit getVariable "role";

private _HPilot_fly_jet = ((["HPilot_fly_jet"] call core_fnc_getConf) == 1); 
private _JPilot_fly_heli = ((["JPilot_fly_heli"] call core_fnc_getConf) == 1);

private _isHPilot = (_role isEqualTo "hPilot");
private _isJPilot = (_role isEqualTo "jPilot");

private _seat = assignedVehicleRole player;
_seat params ["_pos", "_turret"];
_seat = nil;

if ( (["restrictHeli"] call core_fnc_getConf) == 1 ) then {
	if ( _veh isKindOf "Helicopter" ) then {
		if ( (typeOf _veh) in VA_heli ) exitWith {};
		if ( _isHPilot ) exitWith {};
		if ( _JPilot_fly_heli && _isJPilot ) exitWith {};
		if ( _pos == "Driver" ) exitWith {
			if ( _JPilot_fly_heli ) then {
				systemChat (["vehicleRestrictions", "JH_pilot_heli"] call BIS_fnc_GetCfgData);
			} else {
			systemChat (["vehicleRestrictions", "H_pilot"] call BIS_fnc_GetCfgData);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if ( (_pos == "Turret") && (_turret isEqualTo [0]) ) exitWith {
			if (  _JPilot_fly_heli ) then {
				systemChat (["vehicleRestrictions", "JH_copilot_heli"] call BIS_fnc_GetCfgData);
			} else {
				systemChat (["vehicleRestrictions", "JH_copilot"] call BIS_fnc_GetCfgData);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		}; 
	};
};

if ( (["restrictPlane"] call core_fnc_getConf) == 1 ) then {
	if ( _veh isKindOf "Plane" ) then {
		if ( (typeOf _veh) in VA_plane ) exitWith {};
		if ( _isJPilot ) exitWith {};
		if ( _HPilot_fly_jet && _isHPilot ) exitWith {};
		if ( _pos == "Driver" ) exitWith {
			if ( _HPilot_fly_jet ) then {
				systemChat (["vehicleRestrictions", "JH_pilot_plane"] call BIS_fnc_GetCfgData);
			} else {
				systemChat (["vehicleRestrictions", "J_pilot"] call BIS_fnc_GetCfgData);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if ( (_pos == "Turret") && (_turret isEqualTo [0]) ) exitWith {
			if ( _HPilot_fly_jet ) then {
				systemChat (["vehicleRestrictions", "JH_copilot_plane"] call BIS_fnc_GetCfgData);
			} else {
				systemChat (["vehicleRestrictions", "J_pilot"] call BIS_fnc_GetCfgData);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};

if ( (["restrictTank"] call core_fnc_getConf) == 1 ) then {
	if ( (_veh isKindOf "Tank") || (_veh isKindOf "IFV")  ) then {
		if ( (typeOf _veh) in VA_tank ) exitWith {};
		if ( _role == "crew" ) exitWith {}; 
		if ( _pos == "Driver" ) exitWith {
			systemChat (["vehicleRestrictions", "crew_driver"] call BIS_fnc_GetCfgData);
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if ( (_pos == "Turret") && (_turret isEqualTo [0]) ) exitWith {
			systemChat (["vehicleRestrictions", "crew_gunner"] call BIS_fnc_GetCfgData);
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if (player in [commander _veh]) exitWith {
			systemChat (["vehicleRestrictions", "crew_commander"] call BIS_fnc_GetCfgData);
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};