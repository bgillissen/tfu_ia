/*
@filename: feats\vehicleRestrictions\playerSwitchSeat.sqf
Author:
	Ben
Description:
	called player side when a player switch seat in a vehicle.
	check that player can drive/gun/copilot that vehicle
*/

params ["_unit", "_notneeded", "_veh"];

private _role = assignedVehicleRole player;
_role params ["_pos", "_turret"];

if ( _pos == "Cargo" ) exitWith{}; 

if ( (["restrictHeli"] call core_fnc_getConf) ) then {
	if((_veh isKindOf "Helicopter") && !(_veh isKindOf "ParachuteBase")) then {
		if ( (typeOf _veh) in VA_heli ) ewitWith {};
		private _isHPilot = (typeOf player in PU_hPilot);
		if ( _isHPilot ) exitWith {};
		if( _pos == "Driver" ) exitWith {
			systemChat "Pilot seat is restricted to helicopter pilot on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if( (_pos == "Turret") && (_turret == [0]) ) exitWith {
			systemChat "Co-pilot seat is restricted to helicopter pilot on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		}; 
	};
};

if ( (["restrictPlane"] call core_fnc_getConf) ) then {
	if((_veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
		if ( (typeOf _veh) in VA_plane ) ewitWith {};
		private _isJPilot = (typeOf player in PU_jPilot); 
		if ( _isJPilot ) exitWith {};
		if( _pos == "Driver" ) exitWith {
			systemChat "Pilot seat is restricted to jet pilot on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if( ( (_pos == "Turret") && (_turret == [0]) ) exitWith {
			systemChat "Co-pilot seat is restricted to jet pilot on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};

if ( (["restrictTank"] call core_fnc_getConf) ) then {
	if ( (_veh isKindOf "Tank") || (_veh isKindOf "IFV")  ) then {
		if ( (typeOf _veh) in VA_tank ) ewitWith {};
		private _isCrew = (typeOf player in PU_crew); 
		if( _pos == "Driver" ) exitWith {
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