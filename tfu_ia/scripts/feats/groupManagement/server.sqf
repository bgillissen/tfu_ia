/*
@filename: feats\groupManagement\server.sqf
Author:
	Ben
Description:
	this script is executed once by main init on server side only,
	it init the BIS group management (server side)
*/

if ( PARAMS_groupManagement == 1 ) then {
	["Initialize", [true]] call BIS_fnc_dynamicGroups;
};