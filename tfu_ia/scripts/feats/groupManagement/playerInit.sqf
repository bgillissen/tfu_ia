/*
@filename: feats\groupManagement\playerInit.sqf
Author:
	Ben
Description:
	this run on player,
	it init the BIS group management
*/

if ( (["groupManagement"] call core_fnc_getConf) == 0 ) ewitWith{};

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;