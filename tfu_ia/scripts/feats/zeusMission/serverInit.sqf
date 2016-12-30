/*
@filename: feats\zeusMission\serverInit.sqf
Author:
	Ben
Description:
	this run on server,
	set the initial value of the zeusMission public variable to false
	append action to base tings
*/

missionNamespace setVariable ["zeusMission", false, true];

private _start = ["zeusMission", "startAction"] call BIS_fnc_GetCfgData;
private _stop = ["zeusMission", "stoptAction"] call BIS_fnc_GetCfgData; 
{
	{
		_x params ["_thing", "_actions"];
		{
			if ( _x == "curator") then {
				_thing addAction [_start, {[_this select 3] call zeusMission_fnc_set}, [true], 0, false, true, "", "[true] call zeusMission_fnc_condition", 2];
				_thing addAction [_stop, {[_this select 3] call zeusMission_fnc_set}, [false], 0, false, true, "", "[false] call zeusMission_fnc_condition", 2];
			}
		} count _actions;
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];