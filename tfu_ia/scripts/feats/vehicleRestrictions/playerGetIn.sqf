/*
@filename: feats\vehicleRestrictions\playerGetIn.sqf
Author:
	Ben
Description:
	tun on player,
	called when player enter a vehicle.
	check that player can drive/gun/copilot that vehicle
*/

params ["_unit", "_pos", "_veh", "_turret"];
		
if ( _pos == "cargo" ) exitWith{}; 

if ( _veh isKindOf "ParachuteBase" ) exitWith {};

private _role = _unit getVariable "role";

private _HPilot_fly_jet = ((["HPilot_fly_jet"] call core_fnc_getParam) == 1); 
private _JPilot_fly_heli = ((["JPilot_fly_heli"] call core_fnc_getParam) == 1);

private _isHPilot = (_role isEqualTo "hPilot");
private _isJPilot = (_role isEqualTo "jPilot");

if ( (["restrictHeli"] call core_fnc_getParam) == 1 ) then {
	if ( _veh isKindOf "Helicopter" ) then {
		if ( (typeOf _veh) in AV_heli ) exitWith {};
		if ( _isHPilot ) exitWith {};
		if ( _JPilot_fly_heli && _isJPilot) exitWith {};
		if( _pos == "driver" ) exitWith {
			if ( _JPilot_fly_heli ) then {
				systemChat (["vehicleRestrictions", "JH_pilot_heli"] call core_fnc_getSetting);
			} else {
				systemChat (["vehicleRestrictions", "H_pilot"] call core_fnc_getSetting);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if ( (_pos == "gunner") && (_turret isEqualTo [0]) ) exitWith {
			if (  _JPilot_fly_heli ) then {
				systemChat (["vehicleRestrictions", "JH_copilot_heli"] call core_fnc_getSetting);
			} else {
				systemChat (["vehicleRestrictions", "JH_copilot"] call core_fnc_getSetting);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};

if ( (["restrictPlane"] call core_fnc_getParam) == 1 ) then {
	if ( _veh isKindOf "Plane" ) then {
		if ( (typeOf _veh) in AV_plane ) exitWith {};
		if ( _isJPilot ) exitWith {};
		if ( _HPilot_fly_jet && _isHPilot) exitWith {};
		if( _pos == "driver" ) exitWith {
			if ( _HPilot_fly_jet ) then {
				systemChat (["vehicleRestrictions", "JH_pilot_plane"] call core_fnc_getSetting);
			} else {
				systemChat (["vehicleRestrictions", "J_pilot"] call core_fnc_getSetting);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if ( (_pos == "gunner") && (_turret isEqualTo [0]) ) exitWith {
			if ( _HPilot_fly_jet ) then {
				systemChat (["vehicleRestrictions", "JH_copilot_plane"] call core_fnc_getSetting);
			} else {
				systemChat (["vehicleRestrictions", "J_pilot"] call core_fnc_getSetting);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};

if ( (["restrictTank"] call core_fnc_getParam) == 1 ) then {
	if ( (_veh isKindOf "Tank") || (_veh isKindOf "IFV")  ) then {
		if ( (typeOf _veh) in AV_tank ) exitWith {};
		if ( _role == "crew" ) exitWith {};
		if ( _pos == "driver" ) exitWith {
			systemChat (["vehicleRestrictions", "crew_driver"] call core_fnc_getSetting);
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if ( (_pos == "gunner") && (_turret isEqualTo [0]) ) exitWith {
			systemChat (["vehicleRestrictions", "crew_gunner"] call core_fnc_getSetting);
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if ( player in [commander _veh] ) exitWith {
			systemChat (["vehicleRestrictions", "crew_commander"] call core_fnc_getSetting);
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};