/*
@filename: feats\curator\serverInit.sqf
Author:
	Ben
Description:
	run on server.
	initialize assigned curator stack, fech allowed curators uids, 
	add curator action to things in base that got a curator action 
*/

if ( isNil "curatorAssigned" ) then {
	curatorAssigned = [];
	publicVariable "curatorAssigned";
};

call curator_fnc_reload;

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( _x == "curator") then {
				_thing addAction [CURATOR_requestAction, curator_fnc_actionRequest, [], 0, false, true, '', '[false] call curator_fnc_condition', 2];
				_thing addAction [CURATOR_releaseAction, curator_fnc_actionRelease, [], 0, false, true, '', '[true] call curator_fnc_condition', 2];
				if ( CURATOR_web ) then {
					_thing addAction [CURATOR_reloadAction, curator_fnc_actionReload, [], 0, false, true, '', '[true] call curator_fnc_condition', 2];
				};
			}
		} count _actions;
	} count _x;
} count [BA_veh, BA_npc, BA_obj];