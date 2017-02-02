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
private _size = ["ia", "side", "size"] call core_fnc_getSetting;

private ["_count", "_skill"];
/*
_count = _civ;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_groups append ([_coord, _size, _count, _patrolSize] call IA_fnc_placeCivPatrol);
*/
_count = _inf;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "side", "patrolSkill"] call core_fnc_getSetting;
_groups append ([_coord, _size, _count, _patrolSize, _skill] call IA_fnc_placeInfPatrol);

_count = _sniper;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "side", "sniperSkill"] call core_fnc_getSetting;
_groups append ([_coord, _size, _count, _skill] call IA_fnc_placeSniper);

_count = _garrison;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "side", "garrisonSkill"] call core_fnc_getSetting;
_groups pushback ([_coord, _size, _count, _skill, 0] call IA_fnc_placeGarrison);

_count = _static;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "side", "staticSkill"] call core_fnc_getSetting;
_groups append ([_coord, _size, _count, _skill] call IA_fnc_placeStatic);

_count = _aa;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "side", "aaSkill"] call core_fnc_getSetting;
_groups append ([_coord, _size, _count, _skill, _patrolSize, "aa", true] call IA_fnc_placeVehicle);

_count = _tank;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "side", "tankSkill"] call core_fnc_getSetting;
_groups append ([_coord, _size, _count, _skill, _patrolSize, "tank", true] call IA_fnc_placeVehicle);

_count = _apc;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "side", "apcSkill"] call core_fnc_getSetting;
_groups append ([_coord, _size, _count, _skill, _patrolSize, "apc", false] call IA_fnc_placeVehicle);

_count = _car;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "side", "carSkill"] call core_fnc_getSetting;
_groups append ([_coord, _size, _count, _skill, _patrolSize, "carArmed", false] call IA_fnc_placeVehicle);


_count = _air;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "side", "airSkill"] call core_fnc_getSetting;
private _alt = ["ia", "side", "airAltitude"] call core_fnc_getSetting;
_groups append ([_coord, _size, _count, _skill, _patrolSize, _alt] call IA_fnc_placeAirPatrol);

_groups