/*
@filename: feats\assets\tfu\assets.sqf
Author:
	Ben
Description:
	run on server
	call by feats\assets\tfu\init.sqf
	return TFU assets
*/

_out = [];

//------------------------------------------------------------ Arsenal TFU

A_TFU = 0;

private _backpacks = [];
private _items = ["H_Beret_TFU_Tan_01",
                  "H_Beret_TFU_Black_01",
                  "H_Beret_TFU_Green_01"];
private _weapons = [];
private _ammo = [];

_out set [A_TFU, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Role Loadout TFU

RL_TFU = A_TFU + 1;

private _hq = [];
private _sl = [];
private _tl = [];
private _medic = [];
private _lmg = [];
private _hmg = [];
private _assHMG = [];
private _at = [];
private _assAT = [];
private _sniper = [];
private _marksman = [];
private _repair = [];
private _demo = [];
private _engineer = [];
private _grenadier = [];
private _rifleman = [];
private _jtac = [];
private _hPilot = [];
private _jPilot = [];
private _crew = [];
private _mortar = [];
private _uavopp = [];
private _spotter = [};

_out set [RL_TFU, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                   _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _crew, 
                   _mortar, _uavopp, _spotter]];

//------------------------------------------------------------ FINITO, return
_out;