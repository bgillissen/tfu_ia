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

BA_veh = [];

{
	_x params ["_poolName", "_marker", "_delay", "_actions"];
	_pool = missionNamespace getVariable format["BV_%1", _poolName];
	if ( !isNil "_pool" ) then {
		if ( count _pool > 0 ) then {
			private _veh = (selectRandom _pool) createVehicle (getMarkerPos _marker);
			_veh setDir (markerDir _marker);
			if ( _delay >= 0 ) then {
				[_veh, _delay, _poolName, _actions] call vehicleRespawn_fnc_monitor;
			} else {
				_veh lock 3;
				_veh allowDamage false;
				clearWeaponCargoGlobal _veh;
				clearMagazineCargoGlobal _veh;
				clearItemCargoGlobal _veh;
				clearBackpackCargoGlobal _veh;
				BA_veh pushback [_veh, _actions];
			};
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
	true
} count BV;

publicVariable "BA_veh";