/*
@filename: feats\curator\serverOnLeave.sqf
Author:
	Ben
Description:
	this script is executed server side when a player disconnect
	unassign game master module that was assigned to player,
	remove the player's curator slot from the stack
*/

param ["_unit", "_id", "_uid", "_name"];

{
	if ( _x select 0 == _uid) then {
		exitWith{
			unassignCurator (missionNamespace getVariable format["zeus_%1", _x select 1]);
			curatorAssigned = curatorAssigned - _x;
			publicVariable "curatorAssigned";
		};
	}
} forEach(curatorAssigned);