/*
@filename: feats\assets\rhs\USAF\preInit.sqf
Author:
	Ben
Description:
	run on server
	implent rhsUSAF blacklist (backpack, item, weapon, ammo, veh, unit, group, object)
*/

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

[[], [], [], _ammo, [], [], [], []] call common_fnc_addToBlacklists;                 