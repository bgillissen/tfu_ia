/*
@filename: common\garrisonUnit.sqf
Author:
	Ben
Description:
	this script is executed on server side,
	use CBA for now, but i should really get rid of that dependency, a bit lazy 
*/

param ["_unit", "_building", "_patrol"];

[_unit, _building, 2, _patrol] call CBA_fnc_taskDefend;