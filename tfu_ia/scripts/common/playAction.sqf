
params ["_target", "_action", ["_now", false]];

if ( _target isEqualTo player ) exitWith {
	[_action, _now] call common_fnc_playActionPlayer;
};

[_action, _now] remoteExec  ["common_fnc_playActionPlayer", _target, false];