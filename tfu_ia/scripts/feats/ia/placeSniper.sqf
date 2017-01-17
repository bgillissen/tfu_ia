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

params ["_coord", "_size", "_amount", "_skill"];

if ( _amount <= 0 ) exitWith { [] };

private _groups = [];

private _baseCfg = ["configFile", "CfgGroups"];

for "_x" from 1 to _amount do {
	(["sGroups"] call ia_fnc_randomSide) params ["_side", "_pool"];
	if ( isNil "_side" ) exitWith { [grpNull] };
	private _sniperGroup = (_baseCfg + (selectRandom _pool));
	private _cfgPath = [_sniperGroup] call BIS_fnc_configPath;
	if ( isClass(_cfgPath) ) then {
		private _randomPos = [_coord, _size, 100, 10] call BIS_fnc_findOverwatch;
		private _group = [_randomPos, _side, _cfgPath] call BIS_fnc_spawnGroup;
		_group setBehaviour "COMBAT";
		_group setCombatMode "RED";
		[(units _group), _skill] call common_fnc_setSkill;
		[(units _group), false] call curator_fnc_addEditable;
		_groups pushback _group;
	};
};

_groups