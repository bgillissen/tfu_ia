/*
@filename: feats\mods\srvBlacklist\preInit.sqf
Author:
	Ben
Description:
	run on server
	implent tfu server blacklist (backpack, item, weapon, ammo, veh, unit, group, object)
*/

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = ["rhsusf_5Rnd_HE",						//shotgun explosive
                 "rhsusf_8Rnd_HE",
                 "rhsusf_5Rnd_FRAG",
                 "rhsusf_8Rnd_FRAG",
                 "rhsusf_5Rnd_doomsday_Buck",
                 "rhsusf_8Rnd_doomsday_Buck",
                 "30Rnd_556x45_Stanag_Tracer_Green",	//green, yellow tracers
                 "30Rnd_556x45_Stanag_Tracer_Yellow",
                 "rhsusf_mag_10Rnd_STD_50BMG_mk211" 	//explosive sniper ammo
                ];
private _veh = [];
private _unit = [];
private _group = [];
private _object = [];

[_backpacks, _items, _weapons, _ammo, _veh, _unit, _group, _object] call common_fnc_addToBlacklists;