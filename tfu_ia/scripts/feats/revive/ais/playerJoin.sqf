params ["_player"];

if ( player isEqualTo _player ) exitWith {};

private _fsm = _player execFSM (TCB_AIS_PATH + "fsm\main.fsm");
_player setVariable ["fsm", _fsm];