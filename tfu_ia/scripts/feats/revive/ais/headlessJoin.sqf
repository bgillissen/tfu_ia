
params ["_player"];

private _fsm = _player execFSM (TCB_AIS_PATH + "fsm\main.fsm");
_player setVariable ["fsm", _fsm];