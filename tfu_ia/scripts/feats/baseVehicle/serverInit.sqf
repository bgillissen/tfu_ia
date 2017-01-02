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

{
	_x params ["_poolName", "_delay", "_marker"];
	_pool = missionNamespace getVariable format["BV_%1", _poolName];
	if ( !isNil "_pool" ) then {
		if ( count _pool > 0 ) then {
			private _veh = (selectRandom _pool) createVehicle (getMarkerPos _marker);
			_veh setDir (markerDir _marker);
			[_veh, _delay, _poolName] call vehicleRespawn_fnc_monitor;
#ifdef DEBUG
		} else {
			private _debug = format["basevehicle: pool %1 is empty!", _poolName];
			conRed(_debug);
#endif	
		};
#ifdef DEBUG
	} else {
		private _debug = format["basevehicle: pool %1 is nil!", _poolName];
		conRed(_debug);
#endif				
	};
} count BV;


