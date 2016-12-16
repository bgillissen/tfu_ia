/*
@filename: feats\vehicleRespawn\setup.sqf
Author:
	Ben
Description:
	run by server each time a destroyed vehicle respawn.
*/

param ["_veh"];
private ["_type"];

_type = typeOf _veh;

//add to Zeus
{
	_x addCuratorEditableObjects [[_veh],false];
} count allCurators;

//add supplyDrop support
if (_type in VEH_supplyDrop) then {
	_veh setVariable ["supplyDrop", true, true];
};

//UAV respawn fixer
if (_type in VEH_uav) then {
	{
		deleteVehicle _x;
	} forEach(crew _veh);
	sleep 2;
	createVehicleCrew _veh;
};