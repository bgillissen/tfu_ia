/*
@filename: feats\vehicleRespawn\server.sqf
Author:
	Ben
Description:
	Run by server each time a vehicle need to respawn.
*/

param ["_veh"];
private ["_type"];
_type = typeOf _veh;

if (isNull _u) exitWith {};

//add to Zeus
{_x addCuratorEditableObjects [[_veh],false];} count allCurators;

//add supplyDrop support
if (_type in supplyDropVeh) then {
	_veh setVariable ["supplyDrop", TRUE, TRUE];
};

//UAV respawn fixer
if (_type in uavVeh) then {
	{deleteVehicle _x;} count (crew _veh);
	[_veh] spawn {
		_veh = _this select 0;
		sleep 2;
		createVehicleCrew _veh;
	};
};