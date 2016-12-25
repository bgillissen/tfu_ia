/*
@filename: feats\vehicleRestrictions\playerSwitchSeat.sqf
Author:
	Ben
Description:
	called player side when a player switch seat in a vehicle.
	check that player can drive/gun/copilot that vehicle
*/

params ["_unit", "_notneeded", "_veh"];

private _seat = assignedVehicleRole player;
_seat params ["_pos", "_turret"];
_seat = nil;

if ( _pos == "Cargo" ) exitWith{};

private _role = _unit getVariable "role";

private _HPilot_fly_jet = (["HPilot_fly_jet"] call core_fnc_getConf) 
private _JPilot_fly_heli = (["JPilot_fly_heli"] call core_fnc_getConf)

private _isHPilot = (_role == "hPilot");
private _isJPilot = (_role == "jPilot");

if ( (["restrictHeli"] call core_fnc_getConf) ) then {
	if((_veh isKindOf "Helicopter") && !(_veh isKindOf "ParachuteBase")) then {
		if ( (typeOf _veh) in VA_heli ) ewitWith {};
		if ( ( _isHPilot) exitWith {};
		if ( ( _JPilot_fly_heli && _isJPilot) exitWith {};
		if( _pos == "Driver" ) exitWith {
			if ( ( _JPilot_fly_heli ) then {
				systemChat "Pilot seat is restricted to helicopter and jet pilot on this vehicle";
			} else {
				systemChat "Pilot seat is restricted to helicopter pilot on this vehicle";
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if( (_pos == "Turret") && (_turret == [0]) ) exitWith {
			if ( ( _JPilot_fly_heli ) then {
				systemChat "Co-pilot seat is restricted to helicopter and jet pilot on this vehicle";
			} else {
				systemChat "Co-pilot seat is restricted to helicopter pilot on this vehicle";
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		}; 
	};
};

if ( (["restrictPlane"] call core_fnc_getConf) ) then {
	if((_veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
		if ( (typeOf _veh) in VA_plane ) ewitWith {};
		if ( ( _isJPilot) exitWith {};
		if ( ( _HPilot_fly_jet && _isHPilot) exitWith {};
		if( _pos == "Driver" ) exitWith {
			if ( ( _HPilot_fly_jet ) then {
				systemChat "Pilot seat is restricted to jet and helicopter pilot on this vehicle";
			} else {
				systemChat "Pilot seat is restricted to jet pilot on this vehicle";
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if( ( (_pos == "Turret") && (_turret == [0]) ) exitWith {
			if ( ( _HPilot_fly_jet ) then {
				systemChat "Co-pilot seat is restricted to jet and helicopter pilot on this vehicle";
			} else {
				systemChat "Co-pilot seat is restricted to jet pilot on this vehicle";
			};
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};

if ( (["restrictTank"] call core_fnc_getConf) ) then {
	if ( (_veh isKindOf "Tank") || (_veh isKindOf "IFV")  ) then {
		if ( (typeOf _veh) in VA_tank ) ewitWith {};
		if ( _role == "crew" ) exitWith {}; 
		if ( _pos == "Driver" ) exitWith {
			systemChat "Driver seat is restricted to tank crew on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if( ( (_pos == "Turret") && (_turret == [0]) ) exitWith {
			systemChat "Gunner seat is restricted to tank crew on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if (player in [commander _veh]) ewitWith {
			systemChat "Commander seat is rectricted to tank crew on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};