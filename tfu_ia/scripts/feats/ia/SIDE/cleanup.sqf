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

deleteMarker (["ia", "side", "circle"] call core_fnc_getSetting);
deleteMarker (["ia", "side", "label"] call core_fnc_getSetting);

if ( !_force ) then {
	private _delay = ["ia", "checkDelay"] call core_fnc_getSetting;
	private _dist = ["ia", "deleteDistance"] call core_fnc_getSetting;
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