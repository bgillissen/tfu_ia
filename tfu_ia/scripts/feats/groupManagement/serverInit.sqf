/*
@filename: feats\groupManagement\serverInit.sqf
Author:
	Ben
Description:
	this run on server,
	it init the BIS group management
*/

if ( !(["groupManagement"] call core_fnc_getConf) ) ewitWith{};

["Initialize", [true]] call BIS_fnc_dynamicGroups;