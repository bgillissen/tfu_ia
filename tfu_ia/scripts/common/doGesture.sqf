
params ["_unit", "_anim", ["_priority", 0]];

if ( local _unit ) exitWith {
	_this call common_fnc_doGesturePlayer;
};

_this remoteExec ["common_fnc_doGesturePlayer", _unit, false];