/*
@filename: common\urlFetchCallback.sqf
Author:
	Ben
Description:
	run server side (no extension on players).
	fetch the given url, and call the given code on success or error 
*/

params ["_url", "_cbOK", "_cbERROR"];
private "_result";

waitUntil {
	 sleep 0.01;
	 ("url_fetch" callExtension format["%1",_url] == "OK")
};

waitUntil {
	sleep 0.01;
	_result = "url_fetch" callExtension "OK";
    (_result != "WAIT")
};

if (_result == "ERROR") exitWith {
	[("url_fetch" callExtension "ERROR"), _url] call _cbERROR;
};

[_result] call _cbOK;