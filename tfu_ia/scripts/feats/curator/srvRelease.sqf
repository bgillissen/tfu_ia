/*
@filename: feats\curator\srvRelease.sqf
Author:
	Ben
Description:
	this script is executed server side when a zeus drop his rights
	unassign game master module that was assigned to player,
	remove the player's curator slot from the stack 
*/

param ["_player"];

{
	if ( _x select 0 == getPlayerUID _player) then {
		exitWith{
			unassignCurator (missionNamespace getVariable format["zeus_%1", _x select 1]);
			curatorAssigned = curatorAssigned - _x;
			publicVariable "curatorAssigned";
		};
	}
} forEach(curatorAssigned);

["HQ", format[CURATOR_descendMsg, (count curatorAssigned), CURATOR_slot, name _player]] common_fnc_globalSideChat;