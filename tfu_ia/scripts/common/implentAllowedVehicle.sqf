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

{
	[_x, format["%1_%2", ((GV select AV_k) select 0), (((GV select AV_k) select 1) select _forEachIndex)], "vehicle"] call common_fnc_implent;
} forEach (_this);