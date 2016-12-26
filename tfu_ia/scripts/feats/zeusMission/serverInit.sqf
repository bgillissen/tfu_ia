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

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( _x == "curator") then {
				_thing addAction [ZM_startAction, zeusMission_fnc_set, [true], 0, false, true, '', '[true] call zeusMission_fnc_condition', 2];
				_thing addAction [ZM_stopAction, zeusMission_fnc_set, [false], 0, false, true, '', '[false] call zeusMission_fnc_condition', 2];
			}
		} count _actions;
	} count _x;
} count [BA_vehicle, BA_npc, BA_object];