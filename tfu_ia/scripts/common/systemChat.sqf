
params ["_target", "_msg"];

_msg remoteExec ["common_fnc_systemChatPlayer", _target, false];