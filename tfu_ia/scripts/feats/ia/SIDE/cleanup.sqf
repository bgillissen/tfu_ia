
params ["_force", "_coord", "_groups", "_objects"];

deleteMarker SIDE_label;
deleteMarker SIDE_circle;

if ( !_force ) then {
	waitUntil {
		sleep IA_checkDelay;
		({((_x distance _coord) < IA_deleteDistance)} count allPlayers) isEqualTo 0)
	};
};

[_groups] call common_fnc_deleteObjects;
{
	if ((count units _x) == 0) then deleteGroup _x;
} count allGroups;