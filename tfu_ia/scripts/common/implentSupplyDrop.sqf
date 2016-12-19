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

if ( !(["supplyDrop"] call core_fnc_getConf) ) exitWith{};

{
	private "_filter";
	if ( _forEachIndex == 0 ) then _filter = "backpack";
	if ( _forEachIndex == 1 ) then _filter = "item";
	if ( _forEachIndex == 2 ) then _filter = "weapon";
	if ( _forEachIndex == 3 ) then _filter = "ammo";
	if ( _forEachIndex == 4 ) then _filter = "object";
	[_x, format["%1_%2",((GV select SD) select 0), (((GV select SD) select 1) select _forEachIndex) ], _filter, 0] call common_fnc_implent;
} forEach (_this);