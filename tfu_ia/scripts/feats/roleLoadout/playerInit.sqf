/*
@filename: feats\roleLoadout\playerInit.sqf
Author:
	Ben
Description:
	this run on player
	give start loadout to player
*/

private _role = player getVariable "role";

if ( isNil "_role" ) exitWith {
	diag_log format["Player role was not defined! for '%1'", player];
};

private _lo = missionNamespace getVariable format["RL_%1", _role];

if ( isNil "_lo" ) exitWith {
	diag_log format["Role loadout is not set for 'RL_%1'", _role];
};

_role = nil;

_lo params["_u", "_v", "_b", "_pw", "_sw", "_hw", "_h", "_f", "_c", "_t", "_m", "_bino", "_n", "_w"];
_lo = nil;

[player, _u, _v, _b, _pw, _sw, _hw, _h, _f, _c, _t, _m, _bino, _n, _w] call common_fnc_setLoadout;