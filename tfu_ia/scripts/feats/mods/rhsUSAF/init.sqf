/*
@filename: mods\rhsUSAF\implent.sqf
Author:
	Ben
Description:
	Run once by server and players.
	implent RHS USAF assets
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

if ( ["Arsenal_usaf_backpacks"] call core_fnc_getConf ) then { 
	_backpacks append _backpacks; 
	_cargoBackpacks append USAF_cargoBackpacks;
};
if ( ["Arsenal_usaf_items"] call core_fnc_getConf ) then { 
	_items append AFRF_items;
	_cargoItems append USAF_cargoItems;
};
if ( ["Arsenal_usaf_weapons"] call core_fnc_getConf ) then { 
	_weapons append USAF_weapons;
	_ammo append USAF_ammo;
	_cargoWeapons append USAF_cargoWeapons;
	_cargoAmmo append USAF_cargoAmmo;
};

if ( ["Reward_usaf"] call core_fnc_getConf ) then { _rewards append USAF_rewards; };

if ( ["Spawn_usaf"] call core_fnc_getConf && PLAYER_SIDE == east ) then {
	_iaPilot = USAF_pilot;
	_iaCrew = USAF_crew;
	_iaCAS = USAF_cas;
	_iaPGroup = USAF_patrolGroup;
	_iaSGroup = USAF_sniperGroup;
	_iaArti = USAF_arti;
	_iaAA = USAF_aaTank;
	_iaStatic = USAF_static;
	_iaTank = USAF_tank;
	_iaAPC = USAF_apc;
	_iaCar = USAF_car;
	_iaAir = USAF_airPatrol;
	_iaGarrison = USAF_garrison;
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
	[USAF_pilot, USAF_crew, USAF_mg, USAF_at, USAF_marksman, USAF_sniper, USAF_medic, USAF_officer, USAF_arti],
	[USAF_exception_heli, USAF_exception_plane, USAF_exception_tank],
	[_backpacks, _items, _weapons, _ammo],
	[_cargoBackpacks, _cargoItems, _cargoWeapons, _cargoAmmo],
	[USAF_supplyDrop, USAF_supplyCrates], _rewards, [], 
	[USAF_RT, _iaPilot, _iaCrew, _iaCAS, _iaPGroup, _iaSGroup, _iaArti, _iaAA, _iaStatic, _iaTank, _iaAPC, _iaCar, _iaAir, _iaGarrison]
] call common_fnc_implentAssets;