/*
@filename: feats\baseDefence\serverInit.sqf
Author:
	Ben
Description:
	run on server
*/

private _mode = ["baseDefence"] call core_fnc_getParam;

if ( _mode isEqualTo 0 ) exitWith {};

BD_availAt = time;
BD_active = false;
BD_stop = false;

if ( _mode isEqualTo 1 ) exitWith {
	[objNull] spawn baseDefence_fnc_spawn;
};

publicVariable "BD_availAt";
publicVariable "BD_active";