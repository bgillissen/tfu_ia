/*
@filename: feats\startTime\serverInit.sqf
Author:
	Ben
Description:
	run on server,
	randomly set the time at mission start
*/

if ( !(["startTime"] call core_fnc_getConf) ) exitWith{};

if ( !isNil "startTimeSet" ) then skipTime (floor random 24);
startTimeSet = true;