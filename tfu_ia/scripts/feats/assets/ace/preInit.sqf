/*
@filename: feats\mods\ace\init.sqf
Author:
	Ben
Description:
	run on server
	implent ace blacklist (backpack, item, weapon, ammo, veh, unit, group, object)
*/

private _items = ["mediKit", "firstAidKit"];

[[], _items, [], [], [], [], [], [], []] call common_fnc_blacklistAssets;