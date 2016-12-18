/*
@filename: common\implentAllowedVehicle.sqf
Author:
	Ben
Description:
	run on all context
	it is used to append given vehicle to the allowed vehicle pools
	params MUST follow GV => AV definition!
	heli, plane, tank
*/

private ["_target"];

{
	_target = format["%1_%2", ((GV select AV) select 0), (((GV select AV) select 1) select _forEachIndex)]; 
	[_x, _target, "vehicle"] call common_fnc_implent;
} forEach (_this);