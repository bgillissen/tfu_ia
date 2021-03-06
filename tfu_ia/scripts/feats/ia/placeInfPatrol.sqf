/*
@filename: feats\ia\placeInfPatrol.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	run server side,
	it spawn Infantry Patrol inside the given coordonate 
*/

params ["_coord", "_size", "_amount", "_patrolSize", "_skill"];

if ( _amount <= 0 ) exitWith {[]};

diag_log format["Placing %1 infantry patrols", _amount];

private _groups = [];

private _baseCfg = ["configFile", "CfgGroups"];

for "_x" from 1 to _amount do {
	(["pGroups"] call ia_fnc_randomSide) params ["_side", "_pool"];
	if ( isNil "_side" ) exitWith { [grpNull] };
	private _infGroup = (_baseCfg + (selectRandom _pool));
	private _cfgPath = [_infGroup] call BIS_fnc_configPath;
	if ( isClass(_cfgPath) ) then {
		private _class = selectRandom (_cfgPath call Bis_fnc_getCfgSubClasses);
		if ( isClass(_cfgPath >> _class) ) then {
			private _randomPos = [[[_coord, (_size / 1.2)],[]],["water","out"]] call BIS_fnc_randomPos;
			private _group = [_randomPos, _side, (_cfgPath >> _class)] call BIS_fnc_spawnGroup;
			[_group, _coord, _patrolSize] call BIS_fnc_taskPatrol;
			[(units _group), _skill] call common_fnc_setSkill;
			[(units _group), false] call curator_fnc_addEditable;
			_groups pushback _group;
		};
	} else {
		diag_log format["Invalid infantry group: %1", _cfgPath];
	};
};

_groups