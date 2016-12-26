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

params ["_aoCoord", "_trigger", "_radioTower", "_units", "_force"];

deleteMarker ["ia", "ao", "circle"] call BIS_fnc_GetCfgData;
deleteMarker ["ia", "ao", "label"] call BIS_fnc_GetCfgData;

if ( !_force ) then {
	private _delay = ["ia", "checkDelay"] call BIS_fnc_GetCfgData;
	private _dist = ["ia", "deleteDistance"] call BIS_fnc_GetCfgData;
	waitUntil {
		sleep _delay;
		(({((_x distance _aoCoord) < _dist)} count allPlayers) isEqualTo 0)
	};
};

deleteVehicle _trigger;
[_radioTower] call common_fnc_deleteObjects;
[AO_minefield] call common_fnc_deleteObjects;
[_units] call common_fnc_deleteObjects;
{
	if ((count units _x) == 0) then { deleteGroup _x; };
} count allGroups;