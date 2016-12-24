/*
@filename: feats\vehicleRestrictions\playerSwitchSeat.sqf
Author:
	Ben
Description:
	called player side when player enter a vehicle.
	check that player can drive/gun/copilot that vehicle
*/

params ["_unit", "_pos", "_veh", "_turret"];
		
if ( _pos == "cargo" ) exitWith{}; 

if ( (["restrictHeli"] call core_fnc_getConf) ) then {
	if((_veh isKindOf "Helicopter") && !(_veh isKindOf "ParachuteBase")) then {
		if ( (typeOf _veh) in VA_heli ) ewitWith {};
		if ( (typeOf player) in PU_hPilot ) exitWith {};
		if( _pos == "driver" ) exitWith {
			systemChat "Pilot seat is restricted to helicopter pilot on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if( (_pos == "gunner") && (_turret == [0]) ) exitWith {
			systemChat "Co-pilot seat is restricted to helicopter pilot on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		}; 
	};
};

if ( (["restrictPlane"] call core_fnc_getConf) ) then {
	if((_veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
		if ( (typeOf _veh) in VA_plane ) ewitWith {};
		if ( (typeOf player) in PU_jPilot ) exitWith {};
		if( _pos == "driver" ) exitWith {
			systemChat "Pilot seat is restricted to jet pilot on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		//private _forbidden = [_veh turretUnit [0]];
		if( ( (_pos == "gunner") && (_turret == [0]) ) exitWith {
			systemChat "Co-pilot seat is restricted to jet pilot on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};

if ( (["restrictTank"] call core_fnc_getConf) ) then {
	if ( (_veh isKindOf "Tank") || (_veh isKindOf "IFV")  ) then {
		if ( (typeOf _veh) in VA_tank ) ewitWith {};
		if ( (typeOf player) in PU_crew ) exitWith {};
		if( _pos == "driver" ) exitWith {
			systemChat "Driver seat is restricted to tank crew on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if( ( (_pos == "gunner") && (_turret == [0]) ) exitWith {
			systemChat "Gunner seat is restricted to tank crew on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
		if (player in [commander _veh]) ewitWith {
			systemChat "Commander seat is rectricted to tank crew on this vehicle";
			[_veh] call vehicleRestrictions_fnc_kickOut;
		};
	};
};