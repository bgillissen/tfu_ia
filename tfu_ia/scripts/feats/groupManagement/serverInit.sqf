/*
@filename: feats\groupManagement\serverInit.sqf
Author:
	Ben
Description:
	run on server,
	init the BIS group management if enabled
*/

if ( (["groupManagement"] call core_fnc_getParam) == 0 ) exitWith {};

["Initialize", [true]] call BIS_fnc_dynamicGroups;