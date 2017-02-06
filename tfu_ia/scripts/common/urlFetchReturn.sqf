/*
@filename: common\urlFetchReturn.sqf
Author:
	Ben
Description:
	run server side (no extension on players).
	fetch the given url and the its content, false in case of error
*/

params ["_url"];

private _limit = time + 0.5;
private _ok = false;
waitUntil {
	 sleep 0.01;
	 _ok = ("url_fetch" callExtension format["%1",_url] isEqualTo "OK"); 
	 ( _ok || (time > _limit) )
};

if !( _ok ) exitWith {
	diag_log "urlFetch: not ok";
	""
};

private _result = "";

waitUntil {
	sleep 0.01;
	_result = "url_fetch" callExtension "OK";
    !(_result isEqualTo "WAIT")
};

if ( _result isEqualTo "ERROR" ) exitWith {
	diag_log format ["urlFetchReturn: %1, %2", _url, ("url_fetch" callExtension "ERROR")];
	""
};

_result