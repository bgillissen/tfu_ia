/*
@filename: feats\roleLoadout\playerInit.sqf
Author:
	Ben
Description:
	this run on player
	give start loadout to player depending on his role
*/

private _type = player getVariable "loadout";
private _loadOut = missionNamespace getVariable format["RL_%1", _type];
/*
uniform, inUniform, backpack, inBackpack, vest, inVest, helmet, primWeapon, primWeaponItems 
secWeapon, secWeapItems, handWeapon, handWeapItems, comm, terminal, map, bino, nv
*/