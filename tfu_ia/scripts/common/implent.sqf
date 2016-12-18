/*
@filename: common\implent.sqf
Author:
	Ben
Description:
	run on all context,
	it is used to append the things provided by a map/mod to the corresponding global var
*/

param["_list", "_target", "_filter", "_fKey"];
private ["_gv", "_toFilter"];

if ( _list isEqualTo [] ) exitWith {};

_gv = missionNamespace getVariable _target;

{
	if ( isNil "_fKey" ) then {
		_toFilter = _x;
	} else {
		_toFilter = _x select _fKey;
	};
	if ( ![_toFilter, _filter] call common_fnc_isBlacklisted ) then {
		_gv append _x;
	};
} count _list;	

missionNamespace setVariable [_target, _gv, false];