/*
@filename: feats\mods\tfar\init.sqf
Author:
	Ben
Description:
	run on server
	implent tfar blacklist (backpack, item, weapon, ammo, veh, unit, group, object)
*/

private _items = ["ItemRadio"];

[[], _items, [], [], [], [], [], [], []] call common_fnc_addToBlacklists;