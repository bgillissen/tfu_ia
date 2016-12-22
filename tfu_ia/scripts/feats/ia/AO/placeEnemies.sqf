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
private "_count";

_count = ["AO_groupPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count-2));
_units append [_aoCoord, _aoSize, _count, AO_patrolSkill] call IA_fnc_placeInfPatrol;

_count = ["AO_sniperPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count-2));
_units append [_aoCoord, _aoSize, _count, AO_sniperSkill] call IA_fnc_placeSniper;

_count = ["AO_garrison"] call core_fnc_getConf;
_count = ((random _count) - (random _count-2));
_units append [_aoCoord, _aoSize, _count, AO_garrisonSkill, true] call IA_fnc_placeGarrison;

_count = ["AO_static"] call core_fnc_getConf;
_count = ((random _count) - (random _count-2));
_units append [_aoCoord, _aoSize, _count, AO_garrisonSkill] call IA_fnc_placeStatic;

_count = ["AO_aaPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count-2));
_units append [_aoCoord, _aoSize, _count, AO_aaSkill, 500, (selectRandom S_aaTank), true] call IA_fnc_placeVehicle;

_count = ["AO_tankPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count-2));
_units append [_aoCoord, _aoSize, _count, AO_tankSkill, 500, (selectRandom S_tank), true] call IA_fnc_placeVehicle;

_count = ["AO_apcPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count-2));
_units append [_aoCoord, _aoSize, _count, AO_apcSkill, 500, (selectRandom S_apc), false] call IA_fnc_placeVehicle;

_count = ["AO_carPatrol"] call core_fnc_getConf;
_count = ((random _count) - (random _count) + (random _count));
_units append [_aoCoord, _aoSize, _count, AO_carSkill, _aosize, (selectRandom S_car), false] call IA_fnc_placeVehicle;

if( random 100 <= (["AO_airPatrolProb"] call core_fnc_getConf) ) then {
	_units append [_aoCoord, _aoSize, 1, AO_airSkill, 800, (selectRandom S_airPatrol), AO_airAltitude] call IA_fnc_placeAirPatrol;
};

_units