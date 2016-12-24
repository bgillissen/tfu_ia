/*
@filename: feats\va\serverInit.sqf
Author:
	Ben
Description:
	this run on server,
	add arsenal to the things in base with an arsenal action
*/

{
	{
		_x params ["_thing", "_actions"];
		{
			if ( _x == "arsenal") then [_thing] va_fnc_add;
		} count _actions;
	} count _x;
} count [BA_vehicle, BA_npc, BA_object];