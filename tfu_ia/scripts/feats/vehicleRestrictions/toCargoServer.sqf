params ["_veh", "_player"];

private _attempt = 0;
private _inCargo = false;

while { !_inCargo }  do {
	private _crew = fullcrew [_veh, "cargo", true];
	private	_freeSeats = [];
	{
		_x params ["_unit", "_role", "_index"];
		if ( _unit isEqualTo objNull ) then { _freeSeats pushback _index; };
		true;
	} count _crew;
	if ( _attempt > 10 ) exitWith { 
		//diag_log "kickout, max attempt reached";
		_player action ["getOut", _veh];
	};
	if ( count _freeSeats == 0 ) exitWith {
		//diag_log "kickout, no free cargo seat anymore";
		_player action ["getOut", _veh];
	};
	_seat = selectRandom _freeSeats;
	//diag_log format["move %1 back to cargo  #%2", _player, _seat];
	_player action ["moveToCargo", _veh, _seat];
	sleep 0.3;
	private _crew = fullcrew [_veh, "cargo", true];
	{
		_x params ["_unit"];
		if ( _unit isEqualTo _player ) exitWith { _inCargo = true; };
		true;
	} count _crew;
	_attempt = _attempt + 1 ;
};