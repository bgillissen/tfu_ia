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

if ( "arsenal" in _actions ) exitWith {
	[_npc, BALO_gear] call common_fnc_setLoadout;
};

if ( "support" in _actions ) exitWith {
	[_npc, BALO_support] call common_fnc_setLoadout;
};

if ( "medic" in _actions ) exitWith {
	[_npc, BALO_medic] call common_fnc_setLoadout;
};

[_npc, BALO_default] call common_fnc_setLoadout;