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

params ["_coord", "_size", "_amount", "_patrolSize"];

if ( _amount <= 0 ) exitWith { [] };

private _groups = [];

for "_x" from 1 to _amount do {
	private _group = createGroup civilian;
	private _randomPos = [[[_coord, (_size / 1.2)],[]],["water","out"]] call BIS_fnc_randomPos;
	(selectRandom S_civ) createUnit [_randomPos, _group];
	[_group, _coord, _patrolSize] call BIS_fnc_taskPatrol;
	[(units _group), false] call curator_fnc_addEditable;
	_groups pushback _group;
};

_groups