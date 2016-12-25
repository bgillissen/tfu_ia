/*
@filename: feats\baseAtmosphere\npcLoadout.sqf
Author:
	Ben
Description:
	run on server
 	set the npc loadout (only helmet, vest, uniform)
 	loadout depends on linked actions, (arsenal, support, medic)
*/

params ["_npc", "_actions"];

if ( "arsenal" in _actions ) ewitWith {
	[_npc, BALO_gear] common_fnc_setLoadout;
};

if ( "support" in _actions ) ewitWith {
	[_npc, BALO_support] common_fnc_setLoadout;
};

if ( "medic" in _actions ) ewitWith {
	[_npc, BALO_medic] common_fnc_setLoadout;
};

[_npc, BALO_default] common_fnc_setLoadout;