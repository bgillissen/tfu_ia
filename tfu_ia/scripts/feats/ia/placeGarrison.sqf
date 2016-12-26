/*
@filename: feats\ia\placeGarrison.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it spawn units and garrison them inside the given coordonate 
*/

params ["_coord", "_size", "_amount", "_skill", "_canPatrol"];

if ( _amount <= 0 ) exitWith {[]};

private _buildings = _coord nearObjects ["House", _size];

if ( (count _buildings) < (_amount / 5 ) ) exitWith {[]};
	
private _randomPos = [[[_coord, (_size / 2)],[]],["water","out"]] call BIS_fnc_randomPos;
private _group = createGroup ENEMY_SIDE;

for "_x" from 1 to _amount do {
	_unit = (selectRandom S_garrison) createUnit [_randomPos, _group];
	[_unit, (selectRandom _buildings), _canPatrol] call common_fnc_garrisonUnit;
};

[(units _group), _skill] call common_fnc_setSkill;

{
	_x addCuratorEditableObjects [(units _group), false];
} count allCurators;

[_group]