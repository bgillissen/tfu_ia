/*
@filename: feats\va\serverInit.sqf
Author:
	Ben
Description:
	this run on server,
	add arsenal to the things in base with an arsenal action
*/

private _param = ( ["filterArsenal"] call core_fnc_getParam == 1 );
{
	{
		_x params ["_thing", "_actions"];
		{
			if ( (configName _x) isEqualTo "arsenal" ) then {
				private _filtered = getNumber(_x >> "filtered");
				if ( _filtered == -1 ) then { 
					_filtered = _param; 
				} else {
					_filtered = [false, true] select _filtered;
				};
				[_thing, _filtered] call va_fnc_add;
			};
		} forEach _actions;
	} forEach _x;
} forEach [BA_npc, BA_obj, BA_veh];