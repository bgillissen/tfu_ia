/*
@filename: mods\apex\implent.sqf
Author:
	Ben
Description:
	Run once by server and players.
	implent apex assets
*/

private ["_backpacks", "_weapons", "_ammo", "_items", "_rewards",
         "_cargoBackpacks", "_cargoWeapons", "_cargoAmmo", "_cargoItems",
         "_iaPilot", "_iaCAS", "_iaSGroup", "_iaArti", "_iaAA", "_iaStatic", "_iaTank", "_iaAPC", "_iaCar", "_iaAir", "_iaGarrison"];

_backpacks = APEX_backpacks;
_items = APEX_items;
_weapons = APEX_weapons;
_ammo = APEX_ammo;
_cargoBackpacks = APEX_cargoBackpacks;;
_cargoItems = APEX_cargoItems;;
_cargoWeapons = APEX_cargoWeapons;;
_cargoAmmo = APEX_cargoAmmo;;
_rewards = [];

if ( ["Arsenal_ab_backpacks"] call core_fnc_getConf ) then { 
	_backpacks append AB_backpacks; 
	_cargoBackpacks append AB_cargoBackpacks;
};
if ( ["Arsenal_ab_items"] call core_fnc_getConf ) then { 
	_items append AB_items;
	_cargoItems append AB_cargoItems; 
};
if ( ["Arsenal_ab_weapons"] call core_fnc_getConf ) then { 
	_weapons append AB_weapons;
	_ammo append AB_ammo;
	_cargoWeapons append AB_cargoWeapons;
	_cargoAmmo append AB_cargoAmmo;
};
if ( ["Arsenal_ao_backpacks"] call core_fnc_getConf ) then { 
	_backpacks append AO_backpacks; 
	_cargoBackpacks append AO_cargoBackpacks;
};
if ( ["Arsenal_ao_items"] call core_fnc_getConf == 1) then { 
	_items append AO_items; 
	_cargoItems append AO_cargoItems;
};
if ( ["Arsenal_ao_weapons"] call core_fnc_getConf ) then { 
	_weapons append AO_weapons;
	_ammo append AO_ammo;
	_cargoWeapons append AO_cargoWeapons;
	_cargoAmmo append AO_cargoAmmo;
};

if ( ["Reward_ab"] call core_fnc_getConf ) then { _rewards append AB_rewards; };
if ( ["Reward_ao"] call core_fnc_getConf ) then { _rewards append AO_rewards; };


if ( ["Spawn_apex"] call core_fnc_getConf ) then {
	if ( PLAYER_SIDE == west ) then {
		_iaPilot = AO_pilot;
		_iaCrew = AO_crew;
		_iaCAS = AO_cas;
		_iaPGroup = AO_patrolGroup;
		_iaSGroup = AO_sniperGroup;
		_iaArti = AO_arti;
		_iaAA = AO_aaTank;
		_iaStatic = AO_static;
		_iaTank = AO_tank;
		_iaAPC = AO_apc;
		_iaCar = AO_car;
		_iaAir = AO_airPatrol;
		_iaGarrison = AO_garrison;
	} else {
		_iaPilot = AB_pilot;
		_iaCrew = AB_crew;
		_iaCAS = AB_cas;
		_iaSGroup = AB_sniperGroup;
		_iaArti = AB_arti;
		_iaAA = AB_aaTank;
		_iaStatic = AB_static;
		_iaTank = AB_tank;
		_iaAPC = AB_apc;
		_iaCar = AB_car;
		_iaAir = AB_airPatrol;
		_iaGarrison = AB_garrison;
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
	[APEX_pilot, APEX_crew, APEX_mg, APEX_at, APEX_marksman, APEX_sniper, APEX_medic, APEX_officer, APEX_arti],
	[APEX_exception_heli, APEX_exception_plane, APEX_exception_tank],
	[_backpacks, _items, _weapons, _ammo],
	[_cargoBackpacks, _cargoItems, _cargoWeapons, _cargoAmmo],
	[APEX_supplyDrop, APEX_supplyCrates], _rewards, APEX_UAV, 
	[APEX_RadioTower, _iaPilot, _iaCrew, _iaCAS, _iaSGroup, _iaArti, _iaAA, _iaStatic, _iaTank, _iaAPC, _iaCar, _iaAir, _iaGarrison]
] call common_fnc_implentAssets;