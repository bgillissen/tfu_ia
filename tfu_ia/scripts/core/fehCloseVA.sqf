/*
@filename: core\fehCloseVA.sqf
Author:
	Ben
Description:
	called by a player stacked event handler
	to trigger features binded to onCloseVA event
*/

if ( VAopen ) exitWith {};
if ( isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull]) ) exitWith {};

VAopen = true;
[] spawn {
	waitUntil {
		isNull (uiNamespace getVariable ["BIS_fnc_arsenal_cam", objNull])  
	};
	VAopen = false;
	["PLAYER", "onCloseVA", []] call core_fnc_featEvent;
};