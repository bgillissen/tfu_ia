/*
@filename: feats\viewDistance\serverInit.sqf
Author: 
	ben
Description:
	run on server
	add viewDistance action to base things with an arsenal action
*/

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( _x == "arsenal") then {
				_thing addAction [VD_action, viewDistance_fnc_open, [], 0, false, true, '', {true}, 2];
			};
		} count _actions;
	} count _x;
} count [BA_vehicle, BA_npc, BA_object];