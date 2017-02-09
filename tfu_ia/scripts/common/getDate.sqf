
if !( isServer ) exitWith { remoteExec ["common_fnc_getDate", 2]; };

private _date = ("real_date" callExtension "");

if ( isNil "_date" ) then {
	serverDate = [];
} else {
	diag_log format["getDate: %1 --- %2", _date, (typeName _date)];
	if ( (typeName _date) isEqualTo "STRING" ) then { 
		serverDate = call compile _date; 
	} else {
		serverDate = [];
	};
};



publicVariable "serverDate";

serverDate