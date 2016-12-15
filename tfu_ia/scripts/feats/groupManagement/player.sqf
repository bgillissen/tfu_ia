/*
@filename: feats\groupManagement\player.sqf
Author:
	Ben
Description:
	this script is executed once by main init on player side only,
	it init the BIS group management (client side)
*/

if ( PARAMS_groupManagement == 1 ) then {
	["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
};