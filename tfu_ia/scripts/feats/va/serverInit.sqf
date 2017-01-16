/*
@filename: feats\va\serverInit.sqf
Author:
	Ben
Description:
	this run on server,
	add arsenal to the things in base with an arsenal action
*/

private _filtered = ( ["filterArsenal"] call core_fnc_getParam == 1 );
{
	{
		_x params ["_thing", "_actions"];
		{
			_x params ["_action", "_conf"];
			if ( isNil "_conf" ) then { _conf = _filtered; }
			if ( "arsenal" isEqualTo _action ) then { [_thing, _conf] call va_fnc_add; };
			true
		} count _actions;
		true
	} count _x;
	true
} count [BA_veh, BA_npc, BA_obj];