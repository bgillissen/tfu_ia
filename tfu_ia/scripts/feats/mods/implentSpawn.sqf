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

params ["_index", "_toAdd"];

private _filter = _index call {
	if ( _this <= 1 ) exitWith { "object" };
	if ( _this >= 1 && _this < 4 ) exitWith { "group" };
	if ( _this >= 4 && _this < 8 ) exitWith { "unit" };
	"vehicle"
};
[_toAdd, format["%1_%2", ((PV select S_k) select 0), (((PV select S_k) select 1) select _index)], _filter] call common_fnc_implent;
