/*
@filename: mods\vanilla\implent.sqf
Author:
	Ben
Description:
	Run once by server and players.
	implent vanilla assets
*/

private ["_backpacks", "_items", "_weapons", "_ammo",
         "_cargoBackpacks", "_cargoItems", "_cargoWeapons", "_cargoAmmo",
         "_conf", "_rewards",
         "_iaPilot", "_iaCAS", "_iaSGroup", "_iaArti", "_iaAA", "_iaStatic", "_iaTank", "_iaAPC", "_iaCar", "_iaAir", "_iaGarrison"];

_backpacks = AV_backpacks;
_items = AV_items;
_weapons = AV_weapons;
_ammo = AV_ammo;
_cargoBackpacks = CV_backpacks;
_cargoItems = CV_items;
_cargoWeapons = CV_weapons;
_cargoAmmo = CV_ammo;

_conf = ["Arsenal_vb_backpacks"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_backpacks append AVB_backpacks; 
	_cargoBackpacks append CVB_backpacks;
};
_conf = ["Arsenal_vb_items"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_items append AVB_items;
	_cargoItems append CVB_items; 
};
_conf = ["Arsenal_vb_weapons"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_weapons append AVB_weapons;
	_ammo append AVB_ammo;
	_cargoWeapons append CVB_weapons;
	_cargoAmmo append CVB_ammo;
};

_conf = ["Arsenal_vo_backpacks"] call core_fnc_getConf;
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_backpacks append AVO_backpacks; 
	_cargoBackpacks append CVO_backpacks;
};
_conf = ["Arsenal_vo_items"] call core_fnc_getConf;
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_items append AVO_items; 
	_cargoItems append CVO_items;
};
_conf = ["Arsenal_vo_weapons"] call core_fnc_getConf;
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
	_weapons append AVO_weapons;
	_ammo append AVO_ammo;
	_cargoWeapons append CVO_weapons;
	_cargoAmmo append CVO_ammo;
};

[_backpacks, _items, _weapons, _ammo] call common_fnc_implentArsenal;
_backpacks = nil;
_items = nil;
_weapons = nil;
_ammo = nil;

[_cargoBackpacks, _cargoItems, _cargoWeapons, _cargoAmmo] call common_fnc_implentCargo;
_cargoBackpacks = nil;
_cargoItems = nil;
_cargoWeapons = nil;
_cargoAmmo = nil;

_rewards = [];
_conf = ["Reward_vb"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
	_rewards append RVB; 
};
_conf = ["Reward_vo"] call core_fnc_getConf;
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
	_rewards append RVO; 
};

[_rewards] call common_fnc_implentReward;
_rewards = nil;

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
_conf = ["Spawn_vanilla"] call core_fnc_getConf;
if ( PLAYER_SIDE == west ) then {
	if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
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
	};
} else {
	if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
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
};

[VANILLA_RT, _iaPilot, _iaCrew, _iaCAS, _iaSGroup, _iaArti, _iaAA, _iaStatic, _iaTank, _iaAPC, _iaCar, _iaAir, _iaGarrison] call common_fnc_implentSpawn;
_iaPilot = nil;
_iaCrew = nil;
_iaCAS = nil;
_iaPGroup = nil;
_iaSGroup = nil;
_iaArti = nil;
_iaAA = nil;
_iaStatic = nil;
_iaTank = nil;
_iaAPC = nil;
_iaCar = nil;
_iaAir = nil;

_bvCar = []; 
_bvAPC = []; 
_bvTank = [];
_bvPlaneCAS = [];
_bvPlaneAA = [];
_bvPlaneTransport = [];
_bvHeliSmall = [];
_bvHeliMedium = [];
_bvHeliMedEvac = [];
_bvHeliBig = [];
_bvHeliAttack = []; 
_bvBoatSmall = [];
_bvBoatAttack = [];
_bvBoatBig = [];
_conf = ["BaseVehicle_vanilla"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
	_bvCar append BVVB_car; 
	_bvAPC append BVVB_apc; 
	_bvTank append BVVB_tank;
	_bvPlaneCAS append BVVB_planeCAS;
	_bvPlaneAA append BVVB_planeAA;
	_bvPlaneTransport append BVVB_planeTransport;
	_bvHeliSmall append BVVB_heliSmall;
	_bvHeliMedium append BVVB_heliMedium;
	_bvHeliMedEvac append BVVB_heliMedEvac;
	_bvHeliBig append BVVB_heliBig;
	_bvHeliAttack append BVVB_heliAttack; 
	_bvBoatSmall append BVVB_boatSmall;
	_bvBoatAttack append BVVB_boatAttack;
	_bvBoatBig append BVVB_boatBig;
};
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
	_bvCar append BVVO_car; 
	_bvAPC append BVVO_apc; 
	_bvTank append BVVO_tank;
	_bvPlaneCAS append BVVO_planeCAS;
	_bvPlaneAA append BVVO_planeAA;
	_bvPlaneTransport append BVVO_planeTransport;
	_bvHeliSmall append BVVO_heliSmall;
	_bvHeliMedium append BVVO_heliMedium;
	_bvHeliMedEvac append BVVO_heliMedEvac;
	_bvHeliBig append BVVO_heliBig;
	_bvHeliAttack append BVVO_heliAttack; 
	_bvBoatSmall append BVVO_boatSmall;
	_bvBoatAttack append BVVO_boatAttack;
	_bvBoatBig append BVVO_boatBig;
};

[_bvCar, _bvAPC, _bvTank, _bvPlaceCAS, _bvPlaneAA, _bvPlaneTransport, _bvHeliSmall, _bvHeliMedium, _bvHeliMedEvac, _bvHeliBig, _bvHeliAttack, _bvBoatSmall, _bvBoatAttack, _bvBoatBig] call common_fnc_implentBaseVehicle;
_bvCar = nil; 
_bvAPC = nil; 
_bvTank = nil;
_bvPlaneCAS = nil;
_bvPlaneAA = nil;
_bvPlaneTransport = nil;
_bvHeliSmall = nil;
_bvHeliMedium = nil;
_bvHeliMedEvac = nil;
_bvHeliBig = nil;
_bvHeliAttack = nil; 
_bvBoatSmall = nil;
_bvBoatAttack = nil;
_bvBoatBig = nil;

[VANILLA_supplyDrop, VANILLA_supplyCrates] call implentSupply;
[VANILLA_UAV] call implentUAV;

[RGV_launcher, RGV_MG, RGV_mRifle, RGV_mScope, RGV_sRifle, RGV_sScope, RGV_oScope] call implentRestrictedGear;

[AVV_heli, AVV_plane, AVV_tank] call implentAllowedVehicle;
