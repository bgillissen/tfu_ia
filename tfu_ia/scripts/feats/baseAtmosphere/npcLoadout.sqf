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
	private _out = BALO_default;
	{
		_x params ["_action", "_conf"];
		if ( "arsenal" isEqualTo _action ) exitWith { _out = BALO_gear; };
		if ( "support" isEqualTo _action ) exitWith { _out = BALO_support; };
		if ( "medic" isEqualTo _action ) exitWith { _out = BALO_medic; };
		true
	} count _actions;
	_out
};

_lo params["_u", "_v", "_b", "_pw", "_sw", "_hw", "_h", "_f", "_c", "_t", "_m", "_bino", "_n", "_w", "_cp"];

[_npc, _u, _v, _b, _pw, _sw, _hw, _h, _f, _c, _t, _m, _bino, _n, _w, _cp] call common_fnc_setLoadout;

[_npc, "npc"] call BIS_fnc_setUnitInsignia;