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

if ( !(["filteredArsenal"] call core_fnc_getConf) ) exitWith{};

{
	private "_filter";
	if ( _forEachIndex == 0 ) then _filter = "backpack";
	if ( _forEachIndex == 1 ) then _filter = "item";
	if ( _forEachIndex == 2 ) then _filter = "weapon";
	if ( _forEachIndex == 3 ) then _filter = "ammo";
	[_x, format["%1_%2", ((GV select A) select 0), (((GV select A) select 1) select _forEachIndex)], _filter] call common_fnc_implent;
} forEach (_this);