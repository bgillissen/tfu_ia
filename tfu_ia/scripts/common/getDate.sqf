
if !( isServer ) exitWith { remoteExec ["common_fnc_getDate", 2]; };

private _date = ("real_date" callExtension "");

if ( isNil "_date" ) then {
	serverDate = [];
} else {
	if ( (typeName _date) isEqualTo "ARRAY" ) then { 
		serverDate = _date; 
	} else {
		serverDate = [];
	};
};

publicVariable "serverDate";

serverDate