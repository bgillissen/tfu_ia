/*
@filename: feats\ia\placeAirPatrol.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run server side,
	it spawn a helicopter with crew inside the given coordonate 
*/

params ["_coord", "_size", "_count", "_skill", "_patrolSize", "_altitude";
private _groups = [];

if ( _count <= 0 ) exitWith{_groups};

for "_x" from 1 to _count) do {
	private _group = createGroup ENEMY_SIDE;
	private _randomPos = [[[_coord, (_size / 2)],[]],["water","out"]] call BIS_fnc_randomPos;
	_veh = (selectRandom S_airPatrol) createVehicle [_randomPos select 0, _randomPos select 1, 1000];
	waitUntil{
		sleep 0.1;
		!isNull _veh
	};
	_veh engineOn true;
	_veh setPos [_randomPos select 0, _randomPos select 1, _altitude];
	(selectRandom S_pilot) createUnit [_randomPos, _group];
	(selectRandom S_pilot) createUnit [_randomPos, _group];
	((units _group) select 0) assignAsDriver _veh;
	((units _group) select 0) moveInDriver _veh;		
	((units _group) select 1) assignAsGunner _veh;
	((units _group) select 1) moveInGunner _veh;
	_group setCombatMode "RED";
	_veh flyInHeight _altitude;
	[_group, _coord, _patrolSize] call BIS_fnc_taskPatrol;
	[(units _group), _skill] call common_fnc_setSkill;	
	if (IA_lockVeh) then _veh lock 3;
	{
		_x addCuratorEditableObjects [[_veh], false];
		_x addCuratorEditableObjects [units _group, false];
	} count allCurators;
	_groups append _group;
	_groups append _veh;
};

_groups