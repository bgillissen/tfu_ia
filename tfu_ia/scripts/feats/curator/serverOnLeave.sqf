/*
@filename: feats\curator\serverOnLeave.sqf
Author:
	Ben
Description:
	executed on server when a player disconnect
	unassign game master module that was assigned to player,
	remove the player's curator slot from the stack
*/

params ["_unit", "_id", "_uid", "_name"];

{
	_x params ["_cuid", "_slot"];
	if ( _cuid == _uid) then {
		exitWith{
			unassignCurator (missionNamespace getVariable format["zeus_%1", _slot]);
			curatorAssigned = curatorAssigned - _x;
			publicVariable "curatorAssigned";
		};
	}
} count(curatorAssigned);