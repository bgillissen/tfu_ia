/*
@filename: feats\ia\SIDE\placeEnemeies.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it spawn the SIDE ennemy units inside the given ao coordonate 
*/

params ["_coord", "_civ", "_inf", "_sniper", "_garrison", "_static", "_aa", "_tank", "_apc", "_car", "_air", "_patrolSize"];

private _units = [];
private _size = ["ia", "side", "size"] call BIS_fnc_GetCfgData;
private ["_count", "_skill"];

_count = _civ;
_count = ((random _count) - (random _count) + (random _count));
_units append [_coord, _size, _count, _patrolSize] call IA_fnc_placeCivPatrol;

_count = _inf;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "patrolSkill"] call BIS_fnc_GetCfgData;
_units append [_coord, _size, _count, _patrolSize, _skill] call IA_fnc_placeInfPatrol;

_count = _sniper;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "sniperSkill"] call BIS_fnc_GetCfgData;
_units append [_coord, _size, _count, _skill] call IA_fnc_placeSniper;

_count = _garrison;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "garrisonSkill"] call BIS_fnc_GetCfgData;
_units append [_coord, _size, _count, _skill, true] call IA_fnc_placeGarrison;

_count = _static;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "staticSkill"] call BIS_fnc_GetCfgData;
_units append [_coord, _size, _count, _skill] call IA_fnc_placeStatic;

_count = _aa;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "aaSkill"] call BIS_fnc_GetCfgData;
_units append [_coord, _size, _count, _skill, _patrolSize, (selectRandom S_aaTank), true] call IA_fnc_placeVehicle;

_count = _tank;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "tankSkill"] call BIS_fnc_GetCfgData;
_units append [_coord, _size, _count, _skill, _patrolSize, (selectRandom S_tank), true] call IA_fnc_placeVehicle;

_count = _apc;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "apcSkill"] call BIS_fnc_GetCfgData;
_units append [_coord, _size, _count, _skill, _patrolSize, (selectRandom S_apc), false] call IA_fnc_placeVehicle;

_count = _car;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "carSkill"] call BIS_fnc_GetCfgData;
_units append [_coord, _size, _count, _skill, _patrolSize, (selectRandom S_car), true] call IA_fnc_placeVehicle;

_count = _air;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "airSkill"] call BIS_fnc_GetCfgData;
private _alt = ["ia", "side", "airAltitude"] call BIS_fnc_GetCfgData;
_units append [_coord, _size, _count, _skill, _patrolSize, (selectRandom S_airPatrol), _alt] call IA_fnc_placeVehicle;

_units