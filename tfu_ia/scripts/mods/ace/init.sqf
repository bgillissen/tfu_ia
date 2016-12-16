/*
@filename: mods\ace\init.sqf
Author:
	Ben
Description:
	Run once by server and players.
	init ACE mod, implent blacklist
*/

#define MOD_ace true;

//backpacks, items, weapons, ammo, vehs, units, groups
[[], ACE_blacklist, [], [], [], [], [], []] call common_fnc_blacklistAssets;