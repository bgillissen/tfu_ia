/*
@filename: feats\ia\placeStatic.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it spawn static weapons and a gunner for each inside the given coordonate
*/

params ["_coord", "_size", "_amount", "_skill", "_canPatrol"];

if ( _count <= 0 ) exitWith{[]};

private _groups = [];

for "_x" from 1 to _amount do {
	private _group = createGroup ENEMY_SIDE;
	private _randomPos = [_coord, _size, 10, 10] call BIS_fnc_findOverwatch;
	private _veh = (selectRandom S_static) createVehicle _randomPos;
	_veh setDir random 360;
	_veh setVectorUp [0,0,1];
	(selectRandom S_garrison) createUnit [_randomPos, _group];
	((units _group) select 0) assignAsGunner _veh;
	((units _group) select 0) moveInGunner _veh;	
	_group setBehaviour "COMBAT";
	_group setCombatMode "RED";
	if ( (["ia", "lockVeh"] call core_fnc_getSetting) == 1 ) then { 
		_veh lock 3;
	};
	{
		_x addCuratorEditableObjects [[_veh], false];
		_x addCuratorEditableObjects [(units _group), false];
	} count allCurators;
	_groups append _group;
	_groups append _veh;
};

_groups