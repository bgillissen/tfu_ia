
if ( !isServer ) exitWith {
	_this remoteExec ["environment_fnc_setTime", 2];
};

params ["_thing", "_caller", "_id", "_arg"];

private ["_hour", "_min"];

(call common_fnc_getDate) params ["_year", "_month", "_hour", "_min"];

if ( _arg isEqualTo "real" ) then {
	_hour = serverDate select 3;
	_min = serverDate select 4;
};
if ( _arg isEqualTo "sunrise" ) then {
	_hour = (serverDate call BIS_fnc_sunriseSunsetTime) select 0;
	_min = 0;
};
if ( _arg isEqualTo "noon" ) then {
	_hour = 12;
	_min = 0;
};
if ( _arg isEqualTo "sunset" ) then {
	_hour = (serverDate call BIS_fnc_sunriseSunsetTime) select 1;
	_min = 0;
};
if ( _arg isEqualTo "midnight" ) then {
	_hour = 24;
	_min = 0;
};

setDate [_year, _month, _day, _hour, _min];