/*
@filename: feats\va\serverDestroy.sqf
Author:
	Ben
Description:
	this run on server,
	remove the arsenal from the things in base with an arsenal action
*/

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( _x == "arsenal") then [_thing] va_fnc_remove;
		} count _actions;
	} count _x;
} count [BA_vehicle, BA_npc, BA_object];