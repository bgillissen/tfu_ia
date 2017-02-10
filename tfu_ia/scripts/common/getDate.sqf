
if !( isServer ) exitWith { remoteExec ["common_fnc_getDate", 2]; };

private _date = ("real_date" callExtension "");

if !( isNil "_date" ) then { serverDate = call compile _date; };

if ( isNil "serverDate" ) then { serverDate = []; };

publicVariable "serverDate";

serverDate