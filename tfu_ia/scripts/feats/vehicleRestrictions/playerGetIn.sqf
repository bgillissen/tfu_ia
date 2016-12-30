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

private _HPilot_fly_jet = ((["HPilot_fly_jet"] call core_fnc_getConf) == 1); 
private _JPilot_fly_heli = ((["JPilot_fly_heli"] call core_fnc_getConf) == 1);

private _isHPilot = (_role isEqualTo "hPilot");
private _isJPilot = (_role isEqualTo "jPilot");

if ( (["restrictHeli"] call core_fnc_getConf) == 1 ) then {
	if( _veh isKindOf "Helicopter" ) then {
		if ( (typeOf _veh) in VA_heli ) ewitWith {};
		if ( ( _isHPilot) exitWith {};
		if ( ( _JPilot_fly_heli && _isJPilot) exitWith {};
		if( _pos == "driver" ) exitWith {
			if ( ( _JPilot_fly_heli ) then {
				systemChat (["vehicleRestrcitions", "JH_pilot_heli"] call BIS_fnc_GetCfgData);
			} else {
				systemChat (["vehicleRestrcitions", "H_pilot"] call BIS_fnc_GetCfgData);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if( (_pos == "gunner") && (_turret == [0]) ) exitWith {
			if ( ( _JPilot_fly_heli ) then {
				systemChat (["vehicleRestrcitions", "JH_copilot_heli"] call BIS_fnc_GetCfgData);
			} else {
				systemChat (["vehicleRestrcitions", "JH_copilot"] call BIS_fnc_GetCfgData);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		}; 
	};
};

if ( (["restrictPlane"] call core_fnc_getConf) == 1 ) then {
	if( _veh isKindOf "Plane" ) then {
		if ( (typeOf _veh) in VA_plane ) ewitWith {};
		if ( ( _isJPilot) exitWith {};
		if ( ( _HPilot_fly_jet && _isHPilot) exitWith {};
		if( _pos == "driver" ) exitWith {
			if ( ( _HPilot_fly_jet ) then {
				systemChat (["vehicleRestrcitions", "JH_pilot_plane"] call BIS_fnc_GetCfgData);
			} else {
				systemChat (["vehicleRestrcitions", "J_pilot"] call BIS_fnc_GetCfgData);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		//private _forbidden = [_veh turretUnit [0]];
		if( ( (_pos == "gunner") && (_turret == [0]) ) exitWith {
			if ( ( _HPilot_fly_jet ) then {
				systemChat (["vehicleRestrcitions", "JH_copilot_plane"] call BIS_fnc_GetCfgData);
			} else {
				systemChat (["vehicleRestrcitions", "J_pilot"] call BIS_fnc_GetCfgData);
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};

if ( (["restrictTank"] call core_fnc_getConf) == 1 ) then {
	if ( (_veh isKindOf "Tank") || (_veh isKindOf "IFV")  ) then {
		if ( (typeOf _veh) in VA_tank ) ewitWith {};
		if ( _role == "crew" ) exitWith {};
		if ( _pos == "driver" ) exitWith {
			systemChat (["vehicleRestrcitions", "crew_driver"] call BIS_fnc_GetCfgData);
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if( ( (_pos == "gunner") && (_turret == [0]) ) exitWith {
			systemChat (["vehicleRestrcitions", "crew_gunner"] call BIS_fnc_GetCfgData);
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if (player in [commander _veh]) ewitWith {
			systemChat (["vehicleRestrcitions", "crew_commander"] call BIS_fnc_GetCfgData);
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};