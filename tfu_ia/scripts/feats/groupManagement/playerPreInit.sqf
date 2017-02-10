/*
@filename: feats\groupManagement\playerPreInit.sqf
Author:
	Ben
Description:
	this run on player,
	make player join the squad defined by his slot (unit init),
	it init the BIS group management
*/

private _id = player getVariable "groupID";
private _grp = (missionNamespace getVariable format["SQUAD_%1", _id]);

[player] joinSilent _grp;

if ( (["groupManagement"] call core_fnc_getParam) == 0 ) exitWith {};

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;