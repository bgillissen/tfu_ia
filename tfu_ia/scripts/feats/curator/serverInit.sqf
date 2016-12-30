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

private _request = ["curator", "requestAction"] call BIS_fnc_GetCfgData;
private _release = ["curator", "releaseAction"] call BIS_fnc_GetCfgData;
private _web = (["curator", "web"] call BIS_fnc_GetCfgData == 1);
private _reload  = ["curator", "reloadAction"] call BIS_fnc_GetCfgData;

call curator_fnc_reload;

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( _x == "curator") then {
				_thing addAction [_request, curator_fnc_actionRequest, [], 0, false, true, '', '[false] call curator_fnc_condition', 2];
				_thing addAction [_release, curator_fnc_actionRelease, [], 0, false, true, '', '[true] call curator_fnc_condition', 2];
				if ( _web ) then {
					_thing addAction [_reload, curator_fnc_actionReload, [], 0, false, true, '', '[true] call curator_fnc_condition', 2];
				};
			}
		} count _actions;
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];