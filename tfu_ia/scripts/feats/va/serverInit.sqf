/*
@filename: feats\va\serverInit.sqf
Author:
	Ben
Description:
	this run on server,
	add arsenal to the things in base with an arsenal action
*/

private _filtered = ( ["filterArsenal"] call core_fnc_getConf == 1 );
{
	{
		_x params ["_thing", "_actions"];
		if ( "arsenal" in _actions ) then { [_thing, _filtered] call va_fnc_add; };
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];