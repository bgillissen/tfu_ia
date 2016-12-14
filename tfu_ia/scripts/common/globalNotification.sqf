/*
@filename: common\globalNotification.sqf
Author:
	unknown, taken from ahoyworld I&A
Description:
	used to show notification
*/

param ["_type", "_array"];

[_type, [_array]] call BIS_fnc_showNotification;