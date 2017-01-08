/*
@filename: common\implentSpawn.sqf
Author:
	Ben
Description:
	run on all context
	it is used to append given things to the mission assets pools
	params MUST follow PV => S definition!
	radioTower, pGroup, sGroup, pilot, crew, officer, garrison, aa, arti, static, cas, tank, apc, car, aPatrol
*/

params ["_index", "_toAdd", "_side"];

private _filter = _index call {
	if ( _this <= 1 ) exitWith { "object" };
	if ( _this >= 1 && _this < 4 ) exitWith { "group" };
	if ( _this >= 4 && _this < 8 ) exitWith { "unit" };
	"vehicle"
};

private _pool = _side call {
	if ( _this isEqualTo east ) exitWith { OPFOR_ENEMY_KEY };
	if ( _this isEqualTo west ) exitWith { BLUFOR_ENEMY_KEY };
	IND_ENEMY_KEY
};

private _target = format["%1_%2", ((PV select S_k) select 0), (((PV select S_k) select 1) select _index)];

[_toAdd, _target, _filter, nil, _pool] call common_fnc_implent;