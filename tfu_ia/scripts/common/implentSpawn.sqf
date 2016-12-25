/*
@filename: common\implentSpawn.sqf
Author:
	Ben
Description:
	run on all context
	it is used to append given things to the mission assets pools
	params MUST follow PV => S definition!
	radioTower, pGroup, sGroup, pilot, crew, officer, garrison, aa, arti, static, cas, tank, apc, car, aPatrol
*/

params ["_index", "_toAdd"];
/*
{
	private "_filter";
	if ( _forEachIndex == 0 ) then _filter = "object";
	if ( _forEachIndex >= 1 && _forEachIndex < 3 ) then _filter = "group";
	if ( _forEachIndex >= 3 && _forEachIndex < 7  ) then _filter = "unit";
	if ( _forEachIndex >= 7 ) then _filter = "vehicle";
	[_x, format["%1_%2", ((GV select S) select 0), (((GV select S) select 1) select _forEachIndex)], _filter] call common_fnc_implent;
} forEach (_this);
*/


private "_filter";
if ( _index == 0 ) then _filter = "object";
if ( _index >= 1 && _index < 3 ) then _filter = "group";
if ( _index >= 3 && _index < 7  ) then _filter = "unit";
if ( _index >= 7 ) then _filter = "vehicle";
{
	[_x, format["%1_%2", ((PV select S) select 0), (((PV select S) select 1) select _index)], _filter] call common_fnc_implent;
} count (_toAdd);