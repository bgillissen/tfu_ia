/*
@filename: feats\groupManagement\playerInit.sqf
Author:
	Ben
Description:
	this run on player,
	make player join the squad defined by his slot (unit init),
	it init the BIS group management
*/

[player] joinSilent (missionNamespace getVariable format["SQUAD_%1", player getVariable "groupID"]);

if ( (["groupManagement"] call core_fnc_getParam) == 0 ) exitWith {};

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
