/*
@filename: feats\ia\placeSniper.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it spawn Sniper Patrol inside the given coordonate 
*/

params ["_coord", "_size", "_count", "_skill"];
private _groups = [];

if ( _count <= 0 ) exitWith{_groups};



for "_x" from 1 to _count do {
	private _randomPos = [_coord, _size, 100, 10] call BIS_fnc_findOverwatch;
	private _group = [_randomPos, ENEMY_SIDE, (selectRandom S_sniperGroups)] call BIS_fnc_spawnGroup;
	private _group setBehaviour "COMBAT";
	_group setCombatMode "RED";
	[(units _group), _skill] call common_fnc_setSkill;
	{
		_x addCuratorEditableObjects [units _group, false];
	} count allCurators;
	_groups append [_group];
	
};

_groups