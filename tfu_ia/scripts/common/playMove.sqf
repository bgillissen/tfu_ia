
params ["_target", "_move", ["_now", false]];

if ( _target isEqualTo player ) exitWith {
	[_move, _now] call common_fnc_playMovePlayer;
};

[_move, _now] remoteExec  ["common_fnc_playMovePlayer", _target, false];