/*
@filename: feats\ia\placeInfPatrol.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it spawn Infantry Patrol inside the given coordonate 
*/

params ["_coord", "_size", "_count", "_patrolSize"];
private _groups = [];

if ( _count <= 0 ) exitWith{_groups};

for "_x" from 1 to _count do {
	private _group = createGroup civilian;
	private _randomPos = [[[_coord, (_size / 1.2)],[]],["water","out"]] call BIS_fnc_randomPos;
	(selectRandom S_civ) createUnit [_randomPos, _group];
	[_group, _coord, _patrolSize] call BIS_fnc_taskPatrol;
	{
		_x addCuratorEditableObjects [units _group, false];
	} count allCurators;
	_groups append [_group];
};

_groups