/*
@filename: common\implentArsenal.sqf
Author:
	Ben
Description:
	run on all context
	it is used to append given gears in the arsenal pools
	params MUST follow GV => A definition!
	backpacks, items, weapons, ammo
*/

if ( !(["filterArsenal"] call core_fnc_getConf) ) exitWith{};

{
	private _filter = _forEachIndex call {
		if ( _this isEqualTo 0 ) exitWith { "backpack" };
		if ( _this isEqualTo 1 ) exitWith { "item" };
		if ( _this isEqualTo 2 ) exitWith { "weapon" };
		"ammo"
	};
	[_x, format["%1_%2", ((GV select A_k) select 0), (((GV select A_k) select 1) select _forEachIndex)], _filter] call common_fnc_implent;
} forEach (_this);