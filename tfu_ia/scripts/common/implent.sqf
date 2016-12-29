/*
@filename: common\implent.sqf
Author:
	Ben
Description:
	run on all context,
	it is used to append the things provided by a map/mod to the corresponding global var
*/

params ["_list", "_target", "_filter", "_fKey"];

if ( _list isEqualTo [] ) exitWith {};

private _pv = missionNamespace getVariable _target;

{
	private "_toFilter";
	if ( isNil "_fKey" ) then {
		_toFilter = _x;
	} else {
		_toFilter = _x select _fKey;
	};
	if ( !([_toFilter, _filter] call common_fnc_isBlacklisted) ) then {
		_pv append _x;
	};
} count _list;	

missionNamespace setVariable [_target, _pv, false];