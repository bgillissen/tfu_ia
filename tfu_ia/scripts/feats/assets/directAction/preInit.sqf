/*
@filename: feats\assets\directAction\preInit.sqf
Author:
	Ben
Description:
	run on server
	implent directAction blacklists
*/

private _types = ["backpacks", "items", "weapons", "ammo", "vehicles", "units", "groups", "objects"];
private _pools = [[],[],[],[],[],[],[],[]];

{
	private _cfg = _x;
	{
		private _data = getArray(_cfg >> "blacklist" >> _x);
		(pools select _forEachIndex) append _data;
	} forEach _types;
} forEach ("true" configClasses (configFile >> "cfgDirectAction"));

_pools call common_fnc_addToBlacklists;