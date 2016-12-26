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

{
	private _filter = _forEachIndex call {
		if ( _this isEqualTo 0 ) exitWith { "backpack" };
		if ( _this isEqualTo 1 ) exitWith { "item" };
		if ( _this isEqualTo 2 ) exitWith { "weapon" };
		"ammo"
	};
	[_x, format["%1_%2", ((GV select C_k) select 0), (((GV select C_k) select 1) select _forEachIndex)], _filter, 0] call common_fnc_implent;
} forEach (_this);