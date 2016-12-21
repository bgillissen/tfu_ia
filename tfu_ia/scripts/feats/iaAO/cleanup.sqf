/*
@filename: feats\iaAO\cleanup.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it remove the objects spawned for an AO if no players are near 
*/

params ["_aoCoord", "_trigger", "_radioTower", "_units", "_force"];

if ( !_force ) then {
	waitUntil {
		sleep IA_checkDelay
		({((_x distance _aoCoord) < IA_deleteDistance)} count allPlayers) isEqualTo 0)
	};
};

deleteVehicle _trigger;
[_radioTower] call common_fnc_deleteObjects;
[AO_minefield] call common_fnc_deleteObjects;
[_units] call common_fnc_deleteObjects;
{
	if ((count units _x) == 0) then deleteGroup _x;
} count allGroups;