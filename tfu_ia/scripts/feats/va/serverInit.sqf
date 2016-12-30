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
			if ( _x isEqualTo "arsenal" ) exitWith { [_thing] call va_fnc_add; };
		} count _actions;
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];