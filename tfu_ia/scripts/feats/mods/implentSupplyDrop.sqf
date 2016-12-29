/*
@filename: common\implentSupplyDrop.sqf
Author:
	Ben
Description:
	run on all context
	it is used to append given vehicle to the supply drop pool
	params MUST follow GV => SD definition!
	gears [backpacks, items, weapons, ammo], crates
*/

if ( (["supplyDrop"] call core_fnc_getConf) == 0 ) exitWith{};

{
	private _filter = _forEachIndex call {
		if ( _this isEqualTo 0 ) exitWith { "backpack" };
		if ( _this isEqualTo 1 ) exitWith { "item" };
		if ( _this isEqualTo 2 ) exitWith { "weapon" };
		if ( _this isEqualTo 3 ) exitWith { "ammo" };
		"object"
	};
	[_x, format["%1_%2",((PV select SD_k) select 0), (((PV select SD_k) select 1) select _forEachIndex) ], _filter, 0] call common_fnc_implent;
} forEach (_this);