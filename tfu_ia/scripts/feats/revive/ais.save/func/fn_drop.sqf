// by BonInf*
// changed by psycho
params ["_target", "_caller", "_id", "_args"];

private _dragger = _target;
private _dragee	= _args;

detach _dragger;
detach _dragee;


//_dragee playMove "AinjPpneMstpSnonWrflDb_release";
[_dragee, "AinjPpneMrunSnonWnonDb_release", 2] call common_fnc_doAnim;
//_dragger playMove "amovpknlmstpsraswrfldnon"; //_dragger playAction "released";
[_dragger, "amovpknlmstpsraswrfldnon"] call common_fnc_doAnim;

_dragger removeAction (_dragger getVariable "drop_action");
_dragger setVariable ["drop_action", nil];

_dragee setVariable ["dragger", ObjNull, true];
_dragee setVariable ["carrier", ObjNull, true];