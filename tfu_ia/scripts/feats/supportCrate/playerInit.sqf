/*
@filename: feats\supportCrate\serverInitThread.sqf
Author:
	Ben
Description:
	run on player,
	add action to base things with a support action,
Params:
	none
Environment:
	missionConfig:
		supportCrate >> types
		supportCrate >> actions >> fuel
		supportCrate >> actions >> medic
		supportCrate >> actions >> repair
		supportCrate >> actions >> supply
Return:
	nothing
*/
private _types = (["supportCrate", "types"] call BIS_fnc_GetCfgData);

{
	{
		_x params ["_thing", "_actions"];
		if ( "support" in _actions ) then {
			{
				private _action = ["supportCrate", "actions", _x] call BIS_fnc_GetCfgData;
				_thing addAction [_action, {call supportCrate_fnc_spawn}, _x, 0, false, true, '', 'call supportCrate_fnc_condition', 4];
				true
			} count _types;
		};
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];