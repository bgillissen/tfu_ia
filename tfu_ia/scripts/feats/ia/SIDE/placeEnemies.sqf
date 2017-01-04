/*
@filename: feats\ia\SIDE\placeEnemeies.sqf
Author:
	Ben
Description:
	run on server,
	call by feats\ia\SIDE\mis*, 
	it spawn the ennemy units inside the given coordonate
	the given amounts are abit randomize
Params:
	_coord		ARRAY of SCALAR, [x,y,z] coordonate of the side mission objective
	_civ		SCALAR,	amount of civilian to spawn
	_inf		SCALAR, amount of infantry group to spawn
	_sniper		SCALAR, amount of sniper group to spawn
	_garrison	SCALAR,	amount of garrisoned units to spawn
	_static		SCALAR, amount of maned static weapon to spawn
	_aa			SCALAR, amount of maned anti-air tank to spawn
	_tank		SCALAR, amount of maned tank to spawn
	_apc		SCALAR, amount of maned light armored vehicle to spawn
	_car		SCALAR, amount of light wheeled vehicle to spawn
	_air		SCALAR, amount of attack helicopter to spawn
	_patrolSize	SCALAR, radius of the patrol pattern
Environment:
	missionConfig:
		ia >> side >> patrolSkill
		ia >> side >> sniperSkill
		ia >> side >> garrisonSkill
		ia >> side >> staticSkill
		ia >> side >> aaSkill
		ia >> side >> tankSkill
		ia >> side >> apcSkill
		ia >> side >> carSkill
		ia >> side >> airSkill
Return:
	mixed ARRAY, list of groups and vehicles spawned
*/

params ["_coord", "_civ", "_inf", "_sniper", "_garrison", "_static", "_aa", "_tank", "_apc", "_car", "_air", "_patrolSize"];

private _groups = [];
private _size = ["ia", "side", "size"] call BIS_fnc_GetCfgData;

private _sides = [];
if ( OPFOR_ARE_ENEMY ) then { _sides append [east]; };
if ( BLUFOR_ARE_ENEMY ) then { _sides append [west]; };
if ( IND_ARE_ENEMY ) then { _sides append [independent]; };

private ["_count", "_skill"];
/*
_count = _civ;
_count = ((random _count) - (random _count) + (random _count));
_groups append ([_coord, _size, _count, _patrolSize] call IA_fnc_placeCivPatrol);

_count = _inf;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "patrolSkill"] call BIS_fnc_GetCfgData;
_groups append ([_coord, _size, _count, _patrolSize, _skill] call IA_fnc_placeInfPatrol);

_count = _sniper;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "sniperSkill"] call BIS_fnc_GetCfgData;
_groups append ([_coord, _size, _count, _skill] call IA_fnc_placeSniper);

_count = _garrison;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "garrisonSkill"] call BIS_fnc_GetCfgData;
_groups append ([_coord, _size, _count, _skill, true] call IA_fnc_placeGarrison);

_count = _static;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "staticSkill"] call BIS_fnc_GetCfgData;
_groups append ([_coord, _size, _count, _skill] call IA_fnc_placeStatic);

_count = _aa;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "aaSkill"] call BIS_fnc_GetCfgData;
_groups append ([_coord, _size, _count, _skill, _patrolSize, (selectRandom S_aa), true] call IA_fnc_placeVehicle);

_count = _tank;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "tankSkill"] call BIS_fnc_GetCfgData;
_groups append ([_coord, _size, _count, _skill, _patrolSize, (selectRandom S_tank), true] call IA_fnc_placeVehicle);

_count = _apc;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "apcSkill"] call BIS_fnc_GetCfgData;
_groups append ([_coord, _size, _count, _skill, _patrolSize, (selectRandom S_apc), false] call IA_fnc_placeVehicle);

_count = _car;
_count = ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "carSkill"] call BIS_fnc_GetCfgData;
_groups append ([_coord, _size, _count, _skill, _patrolSize, (selectRandom S_car), true] call IA_fnc_placeVehicle);
*/

_count = _air;
_count = round ((random _count) - (random _count) + (random _count));
_skill = ["ia", "side", "airSkill"] call BIS_fnc_GetCfgData;
private _alt = ["ia", "side", "airAltitude"] call BIS_fnc_GetCfgData;
_groups append ([_coord, _size, _count, _skill, _patrolSize, _alt] call IA_fnc_placeAirPatrol);

_groups