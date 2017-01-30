/*
@filename: feats\ia\AO\cleanup.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it remove the objects spawned for an AO if no players are near 
*/

params ["_aoCoord", "_triggers", "_radioTower", "_units", "_force"];

deleteMarker (["ia", "ao", "circle"] call core_fnc_getSetting);
deleteMarker (["ia", "ao", "label"] call core_fnc_getSetting);

[_triggers] call common_fnc_deleteObjects;

if ( !_force ) then {
	private _delay = ["ia", "checkDelay"] call core_fnc_getSetting;
	private _dist = ["ia", "deleteDistance"] call core_fnc_getSetting;
	waitUntil {
		sleep _delay;
		(({((_x distance _aoCoord) < _dist)} count allPlayers) isEqualTo 0)
	};
};

[[_radioTower]] call common_fnc_deleteObjects;
[AO_minefield] call common_fnc_deleteObjects;
[_units] call common_fnc_deleteObjects;
{
	if ((count units _x) == 0) then { deleteGroup _x; };
} count allGroups;