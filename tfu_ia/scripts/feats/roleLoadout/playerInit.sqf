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

_loadOut params["_u", "_v", "_b", "_pw", "_sw", "_hw", "_h", "_c", "_t", "_m", "_bino", "_n"];

[_player, _u, _v, _b, _pw, _sw, _hw, _h, _c, _t, _m, _bino, _nv] call common_fnc_setLoadout;