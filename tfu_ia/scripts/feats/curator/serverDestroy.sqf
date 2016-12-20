/*
@filename: feats\curator\serverDestroy.sqf
Author:
	Ben
Description:
	run server,
	unassign all assigned curators
*/

{
	unassignCurator (missionNamespace getVariable format["zeus_%1", _x select 1]);
} count (curatorAssigned);

curatorAssigned = [];
publicVariable "curatorAssigned";