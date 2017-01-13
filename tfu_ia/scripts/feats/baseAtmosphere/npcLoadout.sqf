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

params ["_npc", "_actions"];

_lo = _actions call {
	if ( "arsenal" in _this ) exitWith { BALO_gear };
	if ( "support" in _this ) exitWith { BALO_support };
	if ( "medic" in _this ) exitWith { BALO_medic };
	BALO_default
};

_lo params["_u", "_v", "_b", "_pw", "_sw", "_hw", "_h", "_f", "_c", "_t", "_m", "_bino", "_n", "_w", "_cp"];

[_npc, _u, _v, _b, _pw, _sw, _hw, _h, _f, _c, _t, _m, _bino, _n, _w, _cp] call common_fnc_setLoadout;

[_npc, "npc"] call BIS_fnc_setUnitInsignia;