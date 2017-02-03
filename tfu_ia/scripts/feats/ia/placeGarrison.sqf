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

if ( _amount <= 0 ) exitWith { grpNull };

private _buildings = _coord nearObjects ["House", _size];

if ( (count _buildings) < (_amount / 5) ) exitWith { grpNull };

private _randomPos = [[[_coord, (_size / 2)],[]],["water","out"]] call BIS_fnc_randomPos;

(["garrison"] call ia_fnc_randomSide) params ["_side", "_pool"];

private _group = createGroup _side;

for "_x" from 1 to _amount do {
	(selectRandom _pool) createUnit [_randomPos, _group];
	private _unit = (units _group) select (count (units _group) - 1);
	_unit setVariable ["NOAI", true, true];
	[_unit, (selectRandom _buildings), _canPatrol] call common_fnc_garrisonUnit;
};

[(units _group), _skill] call common_fnc_setSkill;

[(units _group), false] call curator_fnc_addEditable;

_group