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
	private "_filter";
	if ( _forEachIndex == 0 ) then _filter = "backpack";
	if ( _forEachIndex == 1 ) then _filter = "item";
	if ( _forEachIndex == 2 ) then _filter = "weapon";
	if ( _forEachIndex == 3 ) then _filter = "ammo";
	[_x, format["%1_%2", ((GV select C) select 0), (((GV select C) select 1) select _forEachIndex)], _filter, 0] call common_fnc_implent;
} forEach (_this);