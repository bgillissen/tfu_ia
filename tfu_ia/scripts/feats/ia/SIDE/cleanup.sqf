/*
@filename: feats\ia\SIDE\cleanup.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	run on server,
	it remove the objects spawned for a SIDE mission, if no players are near; can be force 
*/

params ["_force", "_coord", "_radius", "_groups", "_objects"];

deleteMarker (["ia", "side", "circle"] call BIS_fnc_GetCfgData);
deleteMarker (["ia", "side", "label"] call BIS_fnc_GetCfgData);

if ( !_force ) then {
	private _delay = ["ia", "checkDelay"] call BIS_fnc_GetCfgData;
	private _dist = ["ia", "deleteDistance"] call BIS_fnc_GetCfgData;
	waitUntil {
		sleep _delay;
		( ({((_x distance _coord) < _dist)} count allPlayers) isEqualTo 0 )
	};
	_delay = nil;
	_dist = nil;
};

[_groups] call common_fnc_deleteObjects;
[_objects] call common_fnc_deleteObjects;
[_coord, _radius] call common_fnc_deleteRuins;