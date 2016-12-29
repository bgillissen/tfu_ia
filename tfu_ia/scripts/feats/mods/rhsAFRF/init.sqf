/*
@filename: mods\rhsAFRF.sqf
Author:
	Ben
Description:
	Run once by server and players.
	implent RHS AFRF assets
*/

private ["_backpacks", "_items", "_weapons", "_ammo", "_rewards",
         "_cargoBackpacks", "_cargoWeapons", "_cargoAmmo", "_cargoItems",
         "_iaPilot", "_iaCAS", "_iaSGroup", "_iaArti", "_iaAA", "_iaStatic", "_iaTank", "_iaAPC", "_iaCar", "_iaAir", "_iaGarrison"];

_backpacks = [];
_items = [];
_weapons = [];
_ammo = [];
_cargoBackpacks = [];
_cargoItems = [];
_cargoWeapons = [];
_cargoAmmo = [];
_rewards = [];

if ( ["Arsenal_afrf_backpacks"] call core_fnc_getConf ) then { 
	_backpacks append AFRF_backpacks; 
	_cargoBackpacks append AFRF_cargoBackpacks;
};
if ( ["Arsenal_afrf_items"] call core_fnc_getConf ) then {
	_items append AFRF_items; 
	_cargoItems append AFRF_cargoItems;
};
if ( ["Arsenal_afrf_weapons"] call core_fnc_getConf ) then { 
	_weapons append AFRF_weapons;
	_ammo append AFRF_ammo;
	_cargoWeapons append AFRF_cargoWeapons;
	_cargoAmmo append AFRF_cargoAmmo;
};

if ( ["Reward_afrf"] call core_fnc_getConf ) then { _rewards append AFRF_rewards; };

if ( ["Spawn_afrf"] call core_fnc_getConf && PLAYER_SIDE == west ) then {
	_iaPilot = AFRF_pilot;
	_iaCrew = AFRF_crew;
	_iaCAS = AFRF_cas;
	_iaPGroup = AFRF_patrolGroup;
	_iaSGroup = AFRF_sniperGroup;
	_iaArti = AFRF_arti;
	_iaAA = AFRF_aaTank;
	_iaStatic = AFRF_static;
	_iaTank = AFRF_tank;
	_iaAPC = AFRF_apc;
	_iaCar = AFRF_car;
	_iaAir = AFRF_airPatrol;
	_iaGarrison = AFRF_garrison;
} else {
	_iaPilot = [];
	_iaCrew = [];
	_iaCAS = [];
	_iaPGroup = [];
	_iaSGroup = [];
	_iaArti = [];
	_iaAA = [];
	_iaStatic = [];
	_iaTank = [];
	_iaAPC = [];
	_iaCar = [];
	_iaAir = [];
	_iaGarrison = [];
};		

[
	[AFRF_pilot, AFRF_crew, AFRF_mg, AFRF_at, AFRF_marksman, AFRF_sniper, AFRF_medic, AFRF_officer, AFRF_arti],
	[AFRF_exception_heli, AFRF_exception_plane, AFRF_exception_tank],
	[_backpacks, _items, _weapons, _ammo],
	[_cargoBackpacks, _cargoItems, _cargoWeapons, _cargoAmmo],
	[AFRF_supplyDrop, AFRF_supplyCrates], _rewards, [], 
	[AFRF_RT, _iaPilot, _iaCrew, _iaCAS, _iaPGroup, _iaSGroup, _iaArti, _iaAA, _iaStatic, _iaTank, _iaAPC, _iaCar, _iaAir, _iaGarrison]
] call common_fnc_implentAssets;