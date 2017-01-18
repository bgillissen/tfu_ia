// by BonInf*
// changed by psycho
params ["_target", "_caller", "_id", "_args"];

private _dragger = _target;
private _dragee	= _args;

detach _dragger;
detach _dragee;

_dragee setVariable ["dragger", ObjNull, true];

//_dragee playMove "AinjPpneMstpSnonWrflDb_release";
[_dragee, "AinjPpneMstpSnonWrflDb_release"] call common_fnc_playMove;
//_dragger playMove "amovpknlmstpsraswrfldnon"; //_dragger playAction "released";
[_dragger, "amovpknlmstpsraswrfldnon"] call common_fnc_playMove;

if (!isNil {_dragger getVariable "drop_action"}) then {
	_dragger removeAction (_dragger getVariable "drop_action");
	_dragger setVariable ["drop_action",nil];
};
if (!isNil {_dragger getVariable "carry_action"}) then {
	_dragger removeAction (_dragger getVariable "carry_action");
	_dragger setVariable ["carry_action",nil];
};
