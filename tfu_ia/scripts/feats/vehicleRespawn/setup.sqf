/*
@filename: feats\vehicleRespawn\setup.sqf
Author:
	Ben
Description:
	run by server each time a destroyed vehicle respawn.
*/

params ["_veh"];

private _type = typeOf _veh;

//add to Zeus
{
	_x addCuratorEditableObjects [[_veh],false];
} count allCurators;

//add supplyDrop support
if (_type in SD_vehicles) then {
	_veh setVariable ["supplyDrop", true, true];
};

//UAV respawn fixer
if (_type in BV_uav) then {
	diag_log format["Creating crew for : %1", _type];
	diag_log BV_uav;
	diag_log BV_heliSmall;
	diag_log BV_heliSmallArmed;
	{
		deleteVehicle _x;
	} forEach(crew _veh);
	sleep 2;
	createVehicleCrew _veh;
};