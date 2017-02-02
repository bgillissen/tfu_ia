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

_count = ["AO_groupPatrol"] call core_fnc_getParam;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "ao", "patrolSkill"] call core_fnc_getSetting;
_units append ([_aoCoord, _aoSize, _count, (_aoSize / 2), _skill] call IA_fnc_placeInfPatrol);

_count = ["AO_sniperPatrol"] call core_fnc_getParam;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "ao", "sniperSkill"] call core_fnc_getSetting;
_units append ([_aoCoord, _aoSize, _count, _skill] call IA_fnc_placeSniper);

_count = ["AO_garrison"] call core_fnc_getParam;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "ao", "garrisonSkill"] call core_fnc_getSetting;
_units pushback ([_aoCoord, _aoSize, _count, _skill, 0] call IA_fnc_placeGarrison);

_count = ["AO_static"] call core_fnc_getParam;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "ao", "staticSkill"] call core_fnc_getSetting;
_units append ([_aoCoord, _aoSize, _count, _skill] call IA_fnc_placeStatic);

_count = ["AO_aaPatrol"] call core_fnc_getParam;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "ao", "aaSkill"] call core_fnc_getSetting;
_units append ([_aoCoord, _aoSize, _count, _skill, (_aoSize / 2), "aa", true] call IA_fnc_placeVehicle);

_count = ["AO_tankPatrol"] call core_fnc_getParam;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "ao", "tankSkill"] call core_fnc_getSetting;
_units append ([_aoCoord, _aoSize, _count, _skill, (_aoSize / 2), "tank", true] call IA_fnc_placeVehicle);

_count = ["AO_apcPatrol"] call core_fnc_getParam;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "ao", "apcSkill"] call core_fnc_getSetting;
_units append ([_aoCoord, _aoSize, _count, _skill, (_aoSize / 2), "apc", false] call IA_fnc_placeVehicle);

_count = ["AO_carPatrol"] call core_fnc_getParam;
_count = round ( _count - (random (_count / 2)) + (random (_count / 2)));
_skill = ["ia", "ao", "carSkill"] call core_fnc_getSetting;
_units append ([_aoCoord, _aoSize, _count, _skill, _aoSize, "carArmed", false] call IA_fnc_placeVehicle);

if( random 100 <= (["AO_airPatrolProb"] call core_fnc_getParam) ) then {
	_skill = ["ia", "ao", "airSkill"] call core_fnc_getSetting;
	_alt = ["ia", "ao", "airAltitude"] call core_fnc_getSetting;
	_units append ([_aoCoord, _aoSize, 1, _skill, (_aoSize + 200), _alt] call IA_fnc_placeAirPatrol);
};

_units