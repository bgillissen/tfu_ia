
{
	private _fsm = _x execFSM (TCB_AIS_PATH + "fsm\main.fsm");
	_x setVariable ["fsm", _fsm];
} forEach ( allPlayers - (entities 'headless_Client_F') );