/*
@filename: feats\vehicleRespawn\setup.sqf
Author:
	Ben
Description:
	run on server,
	called each time a base vehicle (re)spawn.
*/

params ["_veh", "_poolName", "_actions"];

private _type = typeOf _veh;

private _args = [_veh];
_args append (missionNamespace getVariable format["VC_%1", _poolName]);
_args call common_fnc_setCargo;

{
	if (_type isKindOf _x) then {
		_veh setVariable ["supplyDrop", true, true];
	};
} count SD_vehicles;

//Actions
{
	_x params ["_action", "_conf"];
	if ( _action isEqualTo "paint" ) then {
		_veh setObjectTextureGlobal [0, _conf];
	};
	true
} count _actions;



//UAV respawn fixer
if (_type in BV_uav) then {
	{
		deleteVehicle _x;
	} count (crew _veh);
	sleep 2;
	createVehicleCrew _veh;
};

//add to Zeus
[[_veh], false] call curator_fnc_addEditable;

true