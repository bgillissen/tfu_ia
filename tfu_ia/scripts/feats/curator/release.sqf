/*
@filename: feats\curator\release.sqf
Author:
	Ben
Description:
	this script is executed server side when a zeus drop his rights
	unassign game master module that was assigned to player,
	remove the player's curator slot from the stack 
*/

params ["_player"];

{
	_x params ["_uid", "_slot"];
	if ( _uid isEqualTo (getPlayerUID _player)) exitWith {
		private _mg = (missionNamespace getVariable format["zeus_%1", _slot]);
		unassignCurator _mg;
		curatorAssigned = curatorAssigned - [_x];
		publicVariable "curatorAssigned";
		if ( !isDedicated ) then { 
			isAssigned = [player] call curator_fnc_isAssigned;
		};
	};
} count curatorAssigned;

private _msg = format[(["curator", "descendMsg"] call core_fnc_getSetting), 
                      (count curatorAssigned), 
  	  	  	  	  	  TOT_CURATOR, 
  	  	  	  	  	  (name _player)];

[PLAYER_SIDE, "HQ", _msg] call common_fnc_globalSideChatServer;