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

private ["_filter"];

if ( !(["supplyDrop"] call core_fnc_getConf) ) exitWith{};

{
	if ( _forEachIndex == 0 ) then _filter = "backpack";
	if ( _forEachIndex == 1 ) then _filter = "item";
	if ( _forEachIndex == 2 ) then _filter = "weapon";
	if ( _forEachIndex == 3 ) then _filter = "ammo";
	[_x, _"SD_GEARS", _filter, 0] call common_fnc_implent;
} forEach (_this select 0);

[_this select 1, "SD_crates", "object"] call common_fnc_implent;