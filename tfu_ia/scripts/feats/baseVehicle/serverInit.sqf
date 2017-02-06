/*
@filename: feats\baseVehicle\serverInit.sqf
Author:
	Ben
Description:
	run on server
 	spawn the base vehicles following the pool defined by the active base
 	ask vehicleRespawn to monitor them
*/

#include "..\..\core\debug.hpp"

if ( BASE_NAME isEqualTo "" ) exitWith {};

private _vehConf = ( missionConfigFile >> "settings" >> "baseVehicle" >> toUpper(worldName) >> BASE_NAME);

if !( isClass _vehConf ) exitWith {
	#ifdef DEBUG
	private _debug = format["baseVehicle: vehicle settings not found for base %1!", BASE_NAME];
	conRed(_debug);
	#endif
};


{
	private _poolName = getText(_x >> "pool");
	_pool = missionNamespace getVariable format["BV_%1", _poolName];
	if ( !isNil "_pool" ) then {
		if ( count _pool > 0 ) then {
			private _delay = getNumber(_x >> "respawnDelay");
			private _actions = "true" configClasses (_x >> "actions");
			{
				private _veh = createVehicle [(selectRandom _pool), (getMarkerPos _x), [], 0, "CAN_COLLIDE"];
				_veh setDir (markerDir _x);
				[_veh, _delay, _poolName, _actions] call vehicleRespawn_fnc_monitor;
			} forEach getArray(_x >> "markers");
		#ifdef DEBUG
		} else {
			private _debug = format["baseVehicle: pool %1 is empty!", _poolName];
			conRed(_debug);
		#endif	
		};
	#ifdef DEBUG
	} else {
		private _debug = format["baseVehicle: pool %1 is nil!", _poolName];
		conRed(_debug);
	#endif				
	};
	true
} forEach ("true" configClasses _vehConf);