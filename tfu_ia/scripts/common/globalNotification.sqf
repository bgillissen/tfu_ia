/*
@filename: common\globalNotification.sqf
Author:
	unknown, taken from ahoyworld I&A
Description:
	run on server
	used to show notification globaly
*/

params ["_type", "_array"];

[_type, [_array]] call BIS_fnc_showNotification;