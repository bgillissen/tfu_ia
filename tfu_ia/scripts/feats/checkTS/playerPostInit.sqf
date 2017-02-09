
if !( isMultiplayer ) exitWith {};

if !( MOD_tfar ) exitWith {};

if ( (["checkTS"] call core_fnc_getParam) == 0 ) exitWith {};

waitUntil { !PLAYER_INIT };

private _server = (["checkTS", "server"] call core_fnc_getSetting);
private _channels = (["checkTS", "channels"] call core_fnc_getSetting);
private _delay = (["checkTS", "delay"] call core_fnc_getSetting);
private _limit = serverTime + _delay;

private _expired = false;
private _ok = false;
private _first = true;

diag_log format["checkTS START --- delay: %1 --- limit: %2", _delay, _limit];

while { !_expired && !_ok } do {
	private _playerServer = call TFAR_fnc_getTeamSpeakServerName;
	private _playerChannel = call TFAR_fnc_getTeamSpeakChannelName;
	private _TSPlugin = call TFAR_fnc_isTeamSpeakPluginEnabled;;
	private _isOnServer = (_playerServer isEqualTo _server);
	private _inChannel = (_playerChannel in _channels);
	private _now = serverTime;
	_ok = ( _isOnServer && _TSPlugin && _inChannel );
	_expired = ( _now >= _limit );

	diag_log format["checkTS LOOP --- server: %1 --- plugin: %2 --- channel: %3", _isOnServer, _TSPlugin, _inChannel];
	
	if ( _ok && _first ) exitWith {
		diag_log "checkTS exit --- ok && first";
	};
	DOLOCK = true;
	private _msg = "";
	if ( _ok && !_first ) then { 
		_msg = "Thanks."; 
	} else {
		if !( _isOnServer ) then { 
			_msg = ["checkTS", "messages", "notOnServer"] call core_fnc_getSetting;
		} else {
			if !( _TSPlugin ) then {
				_msg = ["checkTS", "messages", "noPlugin"] call core_fnc_getSetting;
			} else {
				_msg = ["checkTS", "messages", "wrongChannel"] call core_fnc_getSetting;
				_msg = format[_msg, (_channels select 0)];
			};
		};
		_msg = format["%1 ( %2s )", _msg, round (_limit - _now)];
	};
	"noTS" cutText [_msg, "BLACK", 0.1, true];
	_first = false;
	sleep 1;
};

if !( _ok ) then {
	diag_log "checkTS notok";
	"noTS" cutFadeOut 1;
	endMission "NOTALLOWED";
}  else {
	diag_log "checkTS ok";
	if ( _first ) exitWith {
		diag_log "checkTS ok && first";
	};
	diag_log "checkTS ok && NOT first";
	"noTS" cutFadeOut 1;
	DOLOCK = false;
};