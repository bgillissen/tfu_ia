/*
@filename: common\implent.sqf
Author:
	Ben
Description:
	run on all context,
	it is used to append the things provided by a map/mod to the corresponding global var
*/

#include "..\core\debug.hpp"

params [["_list", []], "_target", "_filter", "_fKey", "_sub"];

if ( typeName _list != "ARRAY" ) exitWith {
#ifdef DEBUG
	private _debug = format["implent: target=%1, filter=%2, given list is not an array!", _target, _filter];
	conRed(_debug);
#endif	
};

if ( (count _list) == 0 ) exitWith {};

#ifdef DEBUG
private "_debug";
if ( isNil "_sub" ) then {
	_debug = format["implent: target=%1, filter=%2, #items=%3", _target, _filter, (count _list)];
} else {
	_debug = format["implent: target=%1 (%2), filter=%3, #items=%4", _target, _sub, _filter, (count _list)];
};
conWhite(_debug);
#endif



{
	private "_toFilter";
	if ( isNil "_fKey" ) then {
		_toFilter = _x;
	} else {
		_toFilter = _x select _fKey;
	};
	if ( !([_toFilter, _filter] call common_fnc_isBlacklisted) ) then {
		if ( isNil "_sub" ) then {
			(missionNamespace getVariable _target) pushback _x;
		} else {
			((missionNamespace getVariable _target) select _sub) pushback _x;
		};
	};
	true
} count _list;

true