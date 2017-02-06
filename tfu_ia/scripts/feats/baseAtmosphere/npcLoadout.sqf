/*
@filename: feats\baseAtmosphere\npcLoadout.sqf
Author:
	Ben
Description:
	run on server
 	set the npc loadout
 	loadout depends on linked actions, (arsenal, support, medic)
 	now also set the insignia defined as npc in description.ext
*/

params ["_npc", "_loadout"];

private _lo = missionNamespace getVariable [format["BALO_%1", _loadout], []];

if ( count _lo == 0 ) exitWith {
	diag_log format["NPC loadout not found : BALO_%1", _loadout];
};

_lo params["_u", "_v", "_b", "_pw", "_sw", "_hw", "_h", "_f", "_c", "_t", "_m", "_bino", "_n", "_w", "_cp"];

[_npc, _u, _v, _b, _pw, _sw, _hw, _h, _f, _c, _t, _m, _bino, _n, _w, _cp] call common_fnc_setLoadout;

[_npc, "npc"] call BIS_fnc_setUnitInsignia;