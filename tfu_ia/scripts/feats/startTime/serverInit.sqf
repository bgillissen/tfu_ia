/*
@filename: feats\startTime\serverInit.sqf
Author:
	Ben
Description:
	run on server,
	set in-game date to real world date
	randomly skipTime
*/

if ( (["realDate"] call core_fnc_getParam) == 1 ) then {
	(call common_fnc_getDate) params [["_curYear", 0], ["_curMonth", 0], ["_curDay", 0], ["_curHour", 0], ["_curMinute", 0]];
	if ( _curYear != 0 ) then {
		setDate [_curYear, _curMonth, _curDay, _curHour, _curMinute];
	};
};

if ( (["randomTime"] call core_fnc_getParam) == 1 ) then {
	skipTime (floor random 24); 
};

