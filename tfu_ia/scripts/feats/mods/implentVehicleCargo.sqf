/*
@filename: common\implentCargo.sqf
Author:
	Ben
Description:
	run on all context
	it is used to append given gears in the cargo pools
	params MUST follow GV => C definition!
	backpacks, items, weapons, ammo
*/

params ["_index", "_backpacks", "_items", "_weapons", "_ammo"];

private _target = format["%1_%2", ((PV select VC_k) select 0), (((PV select VC_k) select 1) select _index)];

{
	private _filter = _forEachIndex call {
		if ( _this isEqualTo 0 ) exitWith { "backpack" };
		if ( _this isEqualTo 1 ) exitWith { "item" };
		if ( _this isEqualTo 2 ) exitWith { "weapon" };
		"ammo"
	};
	[_x, _target, _filter, 0, _forEachIndex] call common_fnc_implent;
} forEach [_backpacks, _items, _weapons, _ammo];