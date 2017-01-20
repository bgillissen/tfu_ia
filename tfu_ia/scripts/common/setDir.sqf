
params ["_unit", "_dir"];

if !( local _unit ) exitWith {
	_this remoteExec ["common_fnc_setDirPlayer", _unit, false];
};

_this call common_fnc_setDirPlayer;