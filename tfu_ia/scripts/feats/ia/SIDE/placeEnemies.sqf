/*
@filename: feats\iaSIDE\placeEnemeies.sqf
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
private "_count";

_count = _civ;
_count = ((random _count) - (random _count) + (random _count));
_units append [_coord, SIDE_size, _count, _patrolSize] call IA_fnc_placeCivPatrol;

_count = _inf;
_count = ((random _count) - (random _count) + (random _count));
_units append [_coord, SIDE_size, _count, _patrolSize, SIDE_patrolSkill] call IA_fnc_placeInfPatrol;

_count = _sniper;
_count = ((random _count) - (random _count) + (random _count));
_units append [_coord, SIDE_size, _count, SIDE_sniperSkill] call IA_fnc_placeSniper;

_count = _garrison
_count = ((random _count) - (random _count) + (random _count));
_units append [_coord, SIDE_size, _count, SIDE_garrisonSkill, true] call IA_fnc_placeGarrison;

_count = _static;
_count = ((random _count) - (random _count) + (random _count));
_units append [_coord, SIDE_size, _count, AO_staticSkill] call IA_fnc_placeStatic;

_count = _aa;
_count = ((random _count) - (random _count) + (random _count));
_units append [_coord, SIDE_size, _count, SIDE_aaSkill, _patrolSize, (selectRandom S_aaTank), true] call IA_fnc_placeVehicle;

_count = _tank;
_count = ((random _count) - (random _count) + (random _count));
_units append [_coord, SIDE_size, _count, SIDE_tankSkill, _patrolSize, (selectRandom S_tank), true] call IA_fnc_placeVehicle;

_count = _apc;
_count = ((random _count) - (random _count) + (random _count));
_units append [_coord, SIDE_size, _count, SIDE_apcSkill, _patrolSize, (selectRandom S_apc), false] call IA_fnc_placeVehicle;

_count = _car;
_count = ((random _count) - (random _count) + (random _count));
_units append [_coord, SIDE_size, _count, SIDE_carSkill, _patrolSize, (selectRandom S_car), true] call IA_fnc_placeVehicle;

_count = _air;
_count = ((random _count) - (random _count) + (random _count));
_units append [_coord, SIDE_size, _count, SIDE_tankSkill, _patrolSize, (selectRandom S_airPatrol), AO_airAltitude] call IA_fnc_placeVehicle;