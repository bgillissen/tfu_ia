/*
@filename: common\addToBlacklists.sqf
Author:
	Ben
Description:
	append given argument to the blacklist
	backpack, item, weapon, ammo, veh, unit, group, object
*/

{
	(BLACKLIST select _forEachIndex) append _x;
} forEach (_this);