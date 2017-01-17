/*
@filename: feats\assets\adr97\assets.sqf
Author:
	Ben
Description:
	run on server
	call by feats\assets\adr97\init.sqf
	return ADR-97 assets
*/

private _backpacks = [];
private _items = ["muzzle_snds_570"];
private _weapons = ["SMG_03_black",
        			"SMG_03_camo",
        			"SMG_03_camo",
        			"SMG_03_khaki",
        			"SMG_03_TR_black",
        			"SMG_03_TR_camo",
        			"SMG_03_TR_hex",
        			"SMG_03_TR_khaki",
        			"SMG_03C_black",
        			"SMG_03C_camo",
        			"SMG_03C_hex",
        			"SMG_03C_khaki",
        			"SMG_03C_TR_black",
        			"SMG_03C_TR_camo",
        			"SMG_03C_TR_hex",
        			"SMG_03C_TR_khaki"];
private _ammo = ["50Rnd_570x28_SMG_03"];

[_backpacks, _items, _weapons, _ammo]