
if !( isMultiplayer ) exitWith {};

if !( MOD_tfar ) exitWith {};

if ( (["checkTS"] call core_fnc_getParam) == 0 ) exitWith {};

waitUntil { !PLAYER_INIT };

private _server = ["checkTS", "server"] call core_fnc_getSetting;
private _channels = ["checkTS", "channels"] call core_fnc_getSetting;
private _delay = ["checkTS", "delay"] call core_fnc_getSetting;
private _limit = time + _delay;

private _expired = false;
private _ok = false;
private _first = true;

while { !_expired || _ok } do {
	private _playerServer = call TFAR_fnc_getTeamSpeakServerName;
	private _playerChannel = call TFAR_fnc_getTeamSpeakChannelName;
	private _TSPlugin = call TFAR_fnc_isTeamSpeakPluginEnabled;;
	private _isOnServer = (_playerServer isEqualTo _server);
	private _inChannel = (_playerChannel in _channels);
	_ok = ( _isOnServer && _TSPlugin && _inChannel );
	_expired = ( time > _limit );
	
	if ( _ok && _first ) exitWith {};
	DOLOCK = true;
	private _msg = "";
	if ( _ok && !_first ) then { _msg = "Thanks."; };
	if !( _isOnServer ) then { 
		_msg = ["checkTS", "messages", "notOnServer"] call core_fnc_getSetting;
		_msg = format["%1 ( %2s )", _msg, (_limit - time)];
	} else {
		if !( _TSPlugin ) then {
			_msg = ["checkTS", "messages", "noPlugin"] call core_fnc_getSetting;
			_msg = format["%1 ( %2s )", _msg, (_limit - time)];
		} else {
			_msg = ["checkTS", "messages", "wrongChannel"] call core_fnc_getSetting;
			_msg = format[_msg, (_channels select 0)];
			_msg = format["%1 ( %2s )", _msg, (_limit - time)];
		};
	};
	"noTS" cutText [_msg, "BLACK", 0.1, true];
	_first = false;
	sleep 5;
};

if !( _ok ) then {
	"noTS" cutFadeOut 1;
	endMission "NOTALLOWED";
}  else {
	if ( _first ) exitWith {};
	"noTS" cutFadeOut 1;
	DOLOCK = false;
};