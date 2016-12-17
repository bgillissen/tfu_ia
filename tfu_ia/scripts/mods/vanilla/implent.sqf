/*
@filename: mods\vanilla\implent.sqf
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

if ( ["Arsenal_vb_backpacks"] call core_fnc_getConf ) then { 
	_backpacks append VB_backpacks; 
	_cargoBackpacks append VB_cargoBackpacks;
};
if ( ["Arsenal_vb_items"] call core_fnc_getConf ) then { 
	_items append VB_items;
	_cargoItems append VB_cargoItems; 
};
if ( ["Arsenal_vb_weapons"] call core_fnc_getConf ) then { 
	_weapons append VB_weapons;
	_ammo append VB_ammo;
	_cargoWeapons append VB_cargoWeapons;
	_cargoAmmo append VB_cargoAmmo;
};
if ( ["Arsenal_vo_backpacks"] call core_fnc_getConf ) then { 
	_backpacks append VO_backpacks; 
	_cargoBackpacks append VO_cargoBackpacks;
};
if ( ["Arsenal_vo_items"] call core_fnc_getConf == 1) then { 
	_items append VO_items; 
	_cargoItems append VO_cargoItems;
};
if ( ["Arsenal_vo_weapons"] call core_fnc_getConf ) then { 
	_weapons append VO_weapons;
	_ammo append VO_ammo;
	_cargoWeapons append VO_cargoWeapons;
	_cargoAmmo append VO_cargoAmmo;
};

if ( ["Reward_vb"] call core_fnc_getConf ) then { _rewards append VB_rewards; };
if ( ["Reward_vo"] call core_fnc_getConf ) then { _rewards append VO_rewards; };


if ( ["Spawn_vanilla"] call core_fnc_getConf ) then {
	if ( PLAYER_SIDE == west ) then {
		_iaPilot = VO_pilot;
		_iaCrew = VO_crew;
		_iaCAS = VO_cas;
		_iaPGroup = VO_patrolGroup;
		_iaSGroup = VO_sniperGroup;
		_iaArti = VO_arti;
		_iaAA = VO_aaTank;
		_iaStatic = VO_static;
		_iaTank = VO_tank;
		_iaAPC = VO_apc;
		_iaCar = VO_car;
		_iaAir = VO_airPatrol;
		_iaGarrison = VO_garrison;
	} else {
		_iaPilot = VB_pilot;
		_iaCrew = VB_crew;
		_iaCAS = VB_cas;
		_iaSGroup = VB_sniperGroup;
		_iaArti = VB_arti;
		_iaAA = VB_aaTank;
		_iaStatic = VB_static;
		_iaTank = VB_tank;
		_iaAPC = VB_apc;
		_iaCar = VB_car;
		_iaAir = VB_airPatrol;
		_iaGarrison = VB_garrison;
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