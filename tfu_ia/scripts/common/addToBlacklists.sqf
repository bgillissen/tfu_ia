/*
@filename: common\addToBlacklists.sqf
Author:
	Ben
Description:
	append given argument to the blacklist
	backpack, item, weapon, ammo, veh, unit, group, object
*/

{
	_x append (BLACKLIST select _forEachIndex);
} forEach (_this);