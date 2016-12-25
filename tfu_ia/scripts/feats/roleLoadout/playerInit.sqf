/*
@filename: feats\roleLoadout\playerInit.sqf
Author:
	Ben
Description:
	this run on player
	give start loadout to player depending on his role
*/

private _role = player getVariable "role";

private _loadOut = missionNamespace getVariable format["RL_%1", _role];

_loadOut params["_u", "_v", "_b", "_pw", "_sw", "_hw", "_h", "_f", "_c", "_t", "_m", "_bino", "_n", "_w"];

[_player, _u, _v, _b, _pw, _sw, _hw, _h, _f, _c, _t, _m, _bino, _n, _w] call common_fnc_setLoadout;