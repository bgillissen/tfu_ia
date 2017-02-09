
if ( !isServer ) exitWith {
	_this remoteExec ["environment_fnc_setTime", 2];
};

params ["_thing", "_caller", "_id", "_arg"];

serverDate params ["_year", "_month", "_day", "_hour", "_min"];

_arg params [["_hour", _hour], ["_min", _min]];

setDate [_year, _month, _day, _hour, _min];