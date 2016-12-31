/*
@filename: feats\viewDistance\serverInit.sqf
Author: 
	ben
Description:
	run on server
	add viewDistance action to base things with an arsenal action
*/

private _action = ["viewDistance", "action"] call BIS_fnc_GetCfgData;

{
	{
		_x params ["_thing", "_actions"];
		if ( "arsenal" in _actions ) then {
			_thing addAction [_action, {call viewDistance_fnc_open}, [], 0, false, true, "", "true", 4];
		};
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];