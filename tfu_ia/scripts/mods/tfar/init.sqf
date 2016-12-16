/*
@filename: mods\tfar\init.sqf
Author:
	Ben
Description:
	Run once by server and players.
	init tfar mod, implent blacklist
*/
#define MOD_tfar true;

//backpacks, items, weapons, ammo, vehs, units, groups
[[], TFAR_blacklist, [], [], [], [], [], []] call common_fnc_blacklistAssets;