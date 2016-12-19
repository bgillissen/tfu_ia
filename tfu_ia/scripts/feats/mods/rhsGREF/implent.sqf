/*
@filename: mods\rhsGREF.sqf
Author:
	Ben
Description:
	Run once by server and players.
	implent RHS GREF
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

if ( ["Arsenal_gref_backpacks"] call core_fnc_getConf ) then { 
	_backpacks append _backpacks;
	_cargoBackpacks append GREF_cargoBackpacks;
};
if ( ["Arsenal_gref_items"] call core_fnc_getConf ) then { 
	_items append AFRF_items; 
	_cargoItems append GREF_cargoItems;
};
if ( ["Arsenal_gref_weapons"] call core_fnc_getConf ) then { 
	_weapons append GREF_weapons;
	_ammo append GREF_ammo;
	_cargoWeapons append GREF_cargoWeapons;
	_cargoAmmo append GREF_cargoAmmo;
};

if ( ["Reward_gref"] call core_fnc_getConf ) then { _rewards append GREF_rewards; };

if ( ["Spawn_gref"] call core_fnc_getConf && IND_ARE_ENEMY ) then {
	_iaPilot = GREF_pilot;
	_iaCrew = GREF_crew;
	_iaCAS = GREF_cas;
	_iaPGroup = GREF_patrolGroup;
	_iaSGroup = GREF_sniperGroup;
	_iaArti = GREF_arti;
	_iaAA = GREF_aaTank;
	_iaStatic = GREF_static;
	_iaTank = GREF_tank;
	_iaAPC = GREF_apc;
	_iaCar = GREF_car;
	_iaAir = GREF_airPatrol;
	_iaGarrison = GREF_garrison;
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
	[GREF_pilot, GREF_crew, GREF_mg, GREF_at, GREF_marksman, GREF_sniper, GREF_medic, GREF_officer, GREF_arti],
	[GREF_exception_heli, GREF_exception_plane, GREF_exception_tank],
	[_backpacks, _items, _weapons, _ammo],
	[_cargoBackpacks, _cargoItems, _cargoWeapons, _cargoAmmo],
	[GREF_supplyDrop, GREF_supplyCrates], _rewards, [], 
	[GREF_RT, _iaPilot, _iaCrew, _iaCAS, _iaPGroup, _iaSGroup, _iaArti, _iaAA, _iaStatic, _iaTank, _iaAPC, _iaCar, _iaAir, _iaGarrison]
] call common_fnc_implentAssets;
