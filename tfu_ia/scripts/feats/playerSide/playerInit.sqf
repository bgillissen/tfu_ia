/*
@filename: feats\playerSide\playerInit.sqf
Author:
	Ben
Description:
	run on player,
	make player join the squad defined by his slot (unit init)
*/

[player] joinSilent (missionNamespace getVariable format["SQUAD_%1", player getVariable "groupID"]);