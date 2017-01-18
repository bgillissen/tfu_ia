
params ["_target", "_move"];

if ( _target isEqualTo player ) exitWith {
	_move call common_fnc_switchMovePlayer;
};

_move remoteExec  ["common_fnc_switchMovePlayer", _target, false];