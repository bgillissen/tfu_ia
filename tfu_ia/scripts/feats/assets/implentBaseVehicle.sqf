/*
@filename: common\implentBaseVehicle.sqf
Author:
	Ben
Description:
	run on server
	it is used to append given vehicle to the vehicle avail in base vehicle pool
*/

params ["_index", "_toAdd"];

[_toAdd, format["%1_%2", ((PV select BV_k) select 0), (((PV select BV_k) select 1) select _index)], "vehicle"] call common_fnc_implent;
