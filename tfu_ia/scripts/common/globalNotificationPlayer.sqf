/*
@filename: common\globalNotification.sqf
Author:
	unknown, taken from ahoyworld I&A
Description:
	run on player
	used to show a notification
*/

params ["_type", "_array"];

if ( typeName _array != "ARRAY" ) then { _array = [_array]; };

[_type, _array] call BIS_fnc_showNotification;