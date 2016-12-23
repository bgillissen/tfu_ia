
params ["_buidling", "_skill"];

if (!(typeOf _building in GARRISON_buildings)) exitWith {[]};

private _positions = (GARRISON_buildings select ((GARRISON_buildings find (typeOf _building)) + 1));

private _group = createGroup ENEMY_SIDE;

{
	_x params ["_p0", "_p1", "_p2", "_p3"];
	private _pos =  [_building, _p1, _p0 + direction _building] call BIS_fnc_relPos;
	_pos = [_pos select 0, _pos select 1, ((getPosASL _building) select 2) - _p2)];
	private _unit = (selectRandom S_garrison) createUnit [_pos, _group];
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

{
	_x addCuratorEditableObjects [(units _group), false];
} count allCurators;

_group