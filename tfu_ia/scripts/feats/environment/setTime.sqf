
if ( !isServer ) exitWith {
	_this remoteExec ["environment_fnc_setTime", 2];
};

_this params ["_hour", "_min"];

date params ["_year", "_month", "_day"];

setDate [_year, _month, _day, _hour, _min];