/*
@filename: mods\ace\srvInit.sqf
Author:
	Ben
Description:
	run once by server.
	implent ace blacklist (backpack, item, weapon, ammo, veh, unit, group, object)
*/

[[], ACE_blacklist, [], [], [], [], [], [], []] call common_fnc_blacklistAssets;