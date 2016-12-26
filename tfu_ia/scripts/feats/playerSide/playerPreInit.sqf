/*
@filename: feats\playerSide\playerPreInit.sqf
Author:
	Ben
Description:
	this run on client,
	define player and enemy side
	make player join the squad defined by his slot (unit init)
*/

[player] joinSilent (missionNamespace getVariable format["SQUAD_%1", player getVariable "groupID"]);