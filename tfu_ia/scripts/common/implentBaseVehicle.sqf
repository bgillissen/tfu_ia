/*
@filename: common\implentBaseVehicle.sqf
Author:
	Ben
Description:
	run on all context
	it is used to append given vehicle to the vehicle avail in base pool
	params MUST follow GV => BV definition!
	car, apc, tank, planeCAS, planeAA, planeTransport,
	heliSmall, heliMedium, heliMedEvac, heliBig, heliAttack,
	boatSmall, boatAttack, boatBig
*/

private ["_target"];

{
	_target = format["%1_%2", ((GV select BV) select 0), (((GV select BV) select 1) select _forEachIndex)]; 
	[_x, _target, "vehicle"] call common_fnc_implent;
} forEach (_this);