params ["_target", "_caller", "_id", "_args"];

diag_log format["actionDrop: droper:%1 --- unit:%2", _target, _args];

_args setVariable ["droper", _target, true];