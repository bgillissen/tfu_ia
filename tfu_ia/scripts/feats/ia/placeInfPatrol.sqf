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

params ["_coord", "_size", "_amount", "_patrolSize", "_skill"];

if ( _amount <= 0 ) exitWith {[]};

private _groups = [];

for "_x" from 1 to _amount do {
	private _randomPos = [[[_coord, (_size / 1.2)],[]],["water","out"]] call BIS_fnc_randomPos;
	private _groupCfgPath = selectRandom S_patrolGroups;
	private _infGroup = selectRandom ([_groupPath] call Bis_fnc_getCfgSubClasses);
	private _group = [_randomPos, ENEMY_SIDE, ((_groupCfgPath + [_infGroup]) call BIS_fnc_configPath)] call BIS_fnc_spawnGroup;
	[_group, _coord, _patrolSize] call BIS_fnc_taskPatrol;
	[(units _group), _skill] call common_fnc_setSkill;
	{
		_x addCuratorEditableObjects [units _group, false];
	} count allCurators;
	_groups append [_group];
};

_groups