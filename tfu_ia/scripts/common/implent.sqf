/*
@filename: common\implent.sqf
Author:
	Ben
Description:
	run on all context,
	it is used to append the things provided by a map/mod to the corresponding global var
*/

#include "..\core\debug.hpp"

params [["_list", []], "_target", "_filter", "_fKey"];

if ( typeName _list != "ARRAY" ) exitWith {
#ifdef DEBUG
	private _debug = format["implent: target=%1, filter=%2, given list is not an array!", _target, _filter];
	conRed(_debug);
#endif	
};

#ifdef DEBUG
private _debug = format["implent: target=%1, filter=%2, #items=%3", _target, _filter, (count _list)];
conWhite(_debug);
#endif

if ( (count _list) == 0 ) exitWith {};

private _pv = missionNamespace getVariable _target;

{
	private "_toFilter";
	if ( isNil "_fKey" ) then {
		_toFilter = _x;
	} else {
		_toFilter = _x select _fKey;
	};
	if ( !([_toFilter, _filter] call common_fnc_isBlacklisted) ) then {
		_pv append [_x];
	};
} count _list;	

missionNamespace setVariable [_target, _pv, false];