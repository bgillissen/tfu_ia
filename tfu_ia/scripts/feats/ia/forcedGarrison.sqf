
#include "..\..\core\debug.hpp"

params ["_building", "_skill"];

#include "forcedGarrison.hpp"

private _positions = (GARRISON_BUILDINGS select ((GARRISON_BUILDINGS find (typeOf _building)) + 1));

if ( isNil "_positions" ) exitWith {
#ifdef DEBUG
	private _debug = format["forcedGarrison: no position defined for %1", typeOf _building];
	conWhite(_debug);
#endif	
	[]
};

/*
if ( count S_garrison == 0 ) exitWith {
#ifdef DEBUG
	conWhite("forcedGarrison: spawn pool S_garrison is empty!");
#endif
	_group
};
*/

(["garrison"] call ia_fnc_randomSide) params ["_side", "_pool"]; 

if ( isNil "_side" ) exitWith { grpNull };

private _group = createGroup _side;

{
	_x params ["_p0", "_p1", "_p2", "_p3"];
	private _pos =  [_building, _p1, _p0 + direction _building] call BIS_fnc_relPos;
	_pos = [_pos select 0, _pos select 1, (((getPosASL _building) select 2) - _p2)];
	UNIT_TRICK = nil;
	(selectRandom _pool) createUnit [_pos, _group, "UNIT_TRICK = this"];
	waitUntil { !isNil "UNIT_TRICK" };
	_unit = UNIT_TRICK;
	doStop _unit;
	commandStop _unit;
	_unit setPosASL _pos;
	_unit setUnitPos "UP";
	_unit doWatch ([_unit, 1000, direction _building + _p3] call BIS_fnc_relPos);
	_unit setDir direction _building + _p3;
} count _positions;

_group setBehaviour "COMBAT";
_group setCombatMode "RED";
[(units _group), _skill] call common_fnc_setSkill;

[(units _group), false] call curator_fnc_addEditable;

_group