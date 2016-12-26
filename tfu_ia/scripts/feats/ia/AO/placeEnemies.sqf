/*
@filename: feats\ia\AO\placeEnemies.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it spawn the AO ennemy units inside the given coordonate 
*/

params ["_aoCoord", "_aoSize"];

private _units = [];
private ["_count", "_skill"];

_count = ["AO_groupPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "ao", "patrolSkill"] call BIS_fnc_GetCfgData;
_units append [_aoCoord, _aoSize, _count, 600, _skill] call IA_fnc_placeInfPatrol;

_count = ["AO_sniperPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "ao", "sniperSkill"] call BIS_fnc_GetCfgData;
_units append [_aoCoord, _aoSize, _count, _skill] call IA_fnc_placeSniper;

_count = ["AO_garrison"] call core_fnc_getConf;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "ao", "garrisonSkill"] call BIS_fnc_GetCfgData;
_units append [_aoCoord, _aoSize, _count, _skill, true] call IA_fnc_placeGarrison;

_count = ["AO_static"] call core_fnc_getConf;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "ao", "staticSkill"] call BIS_fnc_GetCfgData;
_units append [_aoCoord, _aoSize, _count, _skill] call IA_fnc_placeStatic;

_count = ["AO_aaPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "ao", "aaSkill"] call BIS_fnc_GetCfgData;
_units append [_aoCoord, _aoSize, _count, _skill, 500, (selectRandom S_aaTank), true] call IA_fnc_placeVehicle;

_count = ["AO_tankPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "ao", "tankSkill"] call BIS_fnc_GetCfgData;
_units append [_aoCoord, _aoSize, _count, _skill, 500, (selectRandom S_tank), true] call IA_fnc_placeVehicle;

_count = ["AO_apcPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "ao", "apcSkill"] call BIS_fnc_GetCfgData;
_units append [_aoCoord, _aoSize, _count, _skill, 500, (selectRandom S_apc), false] call IA_fnc_placeVehicle;

_count = ["AO_carPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "ao", "carSkill"] call BIS_fnc_GetCfgData;
_units append [_aoCoord, _aoSize, _count, _skill, _aosize, (selectRandom S_car), false] call IA_fnc_placeVehicle;

if( random 100 <= (["AO_airPatrolProb"] call core_fnc_getConf) ) then {
	_skill = ["ia", "ao", "airSkill"] call BIS_fnc_GetCfgData;
	_alt = ["ia", "ao", "airAltitude"] call BIS_fnc_GetCfgData;
	_units append [_aoCoord, _aoSize, 1, _skill, (_aoSize + 200), _alt] call IA_fnc_placeAirPatrol;
};

_units