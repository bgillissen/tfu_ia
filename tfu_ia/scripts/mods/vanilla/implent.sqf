/*
@filename: mods\vanilla.sqf
Author:
	Ben
Description:
	Run once by server and players.
	implent vanilla assets
*/

private ["_backpacks", "_weapons", "_ammo", "_items", "_rewards",
         "_cargoBackpacks", "_cargoWeapons", "_cargoAmmo", "_cargoItems",
         "_iaPilot", "_iaCAS", "_iaSGroup", "_iaArti", "_iaAA", "_iaStatic", "_iaTank", "_iaAPC", "_iaCar", "_iaAir", "_iaGarrison"];

_backpacks = VANILLA_backpacks;
_items = VANILLA_items;
_weapons = VANILLA_weapons;
_ammo = VANILLA_ammo;
_cargoBackpacks = VANILLA_cargoBackpacks;;
_cargoItems = VANILLA_cargoItems;;
_cargoWeapons = VANILLA_cargoWeapons;;
_cargoAmmo = VANILLA_cargoAmmo;;
_rewards = [];

if ( VA_blufor_backpacks ) then { 
	_backpacks append BLUFOR_backpacks; 
	_cargoBackpacks append BLUFOR_cargoBackpacks;
};
if ( VA_blufor_items ) then { 
	_items append BLUFOR_items;
	_cargoItems append BLUFOR_cargoItems; 
};
if ( VA_blufor_weapons ) then { 
	_weapons append BLUFOR_weapons;
	_ammo append BLUFOR_ammo;
	_cargoWeapons append BLUFOR_cargoWeapons;
	_cargoAmmo append BLUFOR_cargoAmmo;
};
if ( VA_opfor_backpacks ) then { 
	_backpacks append OPFOR_backpacks; 
	_cargoBackpacks append OPFOR_cargoBackpacks;
};
if ( VA_opfor_items ) then { 
	_items append OPFOR_items; 
	_cargoItems append OPFOR_cargoItems;
};
if ( VA_opfor_weapons ) then { 
	_weapons append OPFOR_weapons;
	_ammo append OPFOR_ammo;
	_cargoWeapons append OPFOR_cargoWeapons;
	_cargoAmmo append OPFOR_cargoAmmo;
};

if ( REWARD_blufor ) then { _rewards append BLUFOR_rewards; };
if ( REWARD_opfor ) then { _rewards append OPFOR_rewards; };


if ( IA_spawnVanilla ) then {
	if ( PLAYER_SIDE == "blufor" ) then {
		_iaPilot = OPFOR_pilot;
		_iaCrew = OPFOR_crew;
		_iaCAS = OPFOR_cas;
		_iaPGroup = OPFOR_patrolGroup;
		_iaSGroup = OPFOR_sniperGroup;
		_iaArti = OPFOR_arti;
		_iaAA = OPFOR_aaTank;
		_iaStatic = OPFOR_static;
		_iaTank = OPFOR_tank;
		_iaAPC = OPFOR_apc;
		_iaCar = OPFOR_car;
		_iaAir = OPFOR_airPatrol;
		_iaGarrison = OPFOR_garrison;
	} else {
		_iaPilot = BLUFOR_pilot;
		_iaCrew = BLUFOR_crew;
		_iaCAS = BLUFOR_cas;
		_iaSGroup = BLUFOR_sniperGroup;
		_iaArti = BLUFOR_arti;
		_iaAA = BLUFOR_aaTank;
		_iaStatic = BLUFOR_static;
		_iaTank = BLUFOR_tank;
		_iaAPC = BLUFOR_apc;
		_iaCar = BLUFOR_car;
		_iaAir = BLUFOR_airPatrol;
		_iaGarrison = BLUFOR_garrison;
	};
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
	[VANILLA_pilot, VANILLA_crew, VANILLA_mg, VANILLA_at, VANILLA_marksman, VANILLA_sniper, VANILLA_medic, VANILLA_officer, VANILLA_arti],
	[VANILLA_exception_heli, VANILLA_exception_plane, VANILLA_exception_tank],
	[_backpacks, _items, _weapons, _ammo],
	[_cargoBackpacks, _cargoItems, _cargoWeapons, _cargoAmmo],
	[VANILLA_supplyDrop, VANILLA_supplyCrates], _rewards, VANILLA_UAV, 
	[VANILLA_RadioTower, _iaPilot, _iaCrew, _iaCAS, _iaSGroup, _iaArti, _iaAA, _iaStatic, _iaTank, _iaAPC, _iaCar, _iaAir, _iaGarrison]
] call common_fnc_implentAssets;