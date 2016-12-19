/*
@filename: mods\tfar\srvInit.sqf
Author:
	Ben
Description:
	run once on server.
	implent tfar blacklist (backpack, item, weapon, ammo, veh, unit, group, object)
*/

[[], TFAR_blacklist, [], [], [], [], [], [], []] call common_fnc_addToBlacklists;