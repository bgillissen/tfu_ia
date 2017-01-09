/*
@filename: feats\ia\placeVehicle.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	run server side,
	spawn vehicles with crew inside the given coordonate using the given pool
*/

params ["_coord", "_size", "_amount", "_skill", "_patrolSize", "_poolName", "_commander"];

diag_log format["Placing %1 vehicle from pool %2", _amount, _poolName];

private _groups = [];

if ( count _pool == 0 ) exitWith { _groups };
if ( _amount <= 0 ) exitWith { _groups };

for "_x" from 1 to _amount do {
	([_poolName] call ia_fnc_randomSide) params ["_side", "_vehPool", "_key"];
	if ( !isNil "_vehPool" ) then {
		private _randomPos = [[[_coord, (_size / 2)],[]],["water","out"]] call BIS_fnc_randomPos;
		private _veh = (selectRandom _vehPool) createVehicle _randomPos;
		if ( !isNil "_veh" ) then {
			if ( (["ia", "lockVeh"] call core_fnc_getSetting) == 1 ) then { 
				_veh lock 3; 
			};
			if (random 100 >= (["ia", "crewStayInProb"] call core_fnc_getSetting) ) then {
				_veh allowCrewInImmobile true;
			};
			[[_veh], false] call curator_fnc_addEditable;
			_groups pushback _veh;
	
			private _group = createGroup _side;
			(selectRandom (S_crew select _key)) createUnit [_randomPos, _group];
			(selectRandom (S_crew select _key)) createUnit [_randomPos, _group];
			((units _group) select 0) assignAsDriver _veh;
			((units _group) select 0) moveInDriver _veh;
			((units _group) select 1) assignAsGunner _veh;
			((units _group) select 1) moveInGunner _veh;
			if ( _commander ) then {
				(selectRandom (S_crew select _key)) createUnit [_randomPos, _group];
				((units _group) select 2) assignAsCommander _veh;
				((units _group) select 2) moveInCommander _veh;
			};
			[_group, _coord, _patrolSize] call BIS_fnc_taskPatrol;
			[(units _group), _skill] call common_fnc_setSkill;
			[(units _group), false] call curator_fnc_addEditable;	
			_groups pushback _group;
		};
	};
};

_groups