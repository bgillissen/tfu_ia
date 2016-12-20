/*
@filename: common\urlFetchReturn.sqf
Author:
	Ben
Description:
	run server side (no extension on players).
	fetch the given url and the its content, false in case of error
*/

params ["_url"];
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
	//some debug in the console
	false
};

_result