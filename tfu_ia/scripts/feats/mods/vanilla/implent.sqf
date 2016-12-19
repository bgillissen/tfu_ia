/*
@filename: mods\vanilla\implent.sqf
Author:
	Ben
Description:
	Run once by server and players.
	implent vanilla assets
*/

private _backpacks = AV_backpacks;
private _items = AV_items;
private _weapons = AV_weapons;
private _ammo = AV_ammo;

private _cBackpacks = CV_backpacks;
private _cItems = CV_items;
private _cWeapons = CV_weapons;
private _cAmmo = CV_ammo;

private _sdBackpacks = SDV_backpacks;
private _sdItems = SDV_items;
private _sdWeapons = SDV_weapons;
private _sdAmmo = SDV_ammo;

private _conf = ["gear_vb_backpacks"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_backpacks append AVB_backpacks; 
	_cBackpacks append CVB_backpacks;
	_sdBackpacks append SDVB_backpacks;
};
_conf = ["gear_vb_items"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_items append AVB_items;
	_cItems append CVB_items; 
	_sdItems append SDVB_items;
};
_conf = ["gear_vb_weapons"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_weapons append AVB_weapons;
	_ammo append AVB_ammo;
	_cWeapons append CVB_weapons;
	_cAmmo append CVB_ammo;
	_sdWeapons append SDVB_weapons;
	_sdAmmo append SDVB_ammo;
};

_conf = ["gear_vo_backpacks"] call core_fnc_getConf;
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_backpacks append AVO_backpacks; 
	_cBackpacks append CVO_backpacks;
	_sdBackpacks append SDVO_backpacks;
};
_conf = ["gear_vo_items"] call core_fnc_getConf;
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_items append AVO_items; 
	_cItems append CVO_items;
	_sdItems append SDVO_items;
};
_conf = ["gear_vo_weapons"] call core_fnc_getConf;
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
	_weapons append AVO_weapons;
	_ammo append AVO_ammo;
	_cWeapons append CVO_weapons;
	_cAmmo append CVO_ammo;
	_sdWeapons append SDVO_weapons;
	_sdAmmo append SDVO_ammo;
};

[_backpacks, _items, _weapons, _ammo] call common_fnc_implentArsenal;
_backpacks = nil;
_items = nil;
_weapons = nil;
_ammo = nil;

[_cBackpacks, _cItems, _cWeapons, _cAmmo] call common_fnc_implentCargo;
_cBackpacks = nil;
_cItems = nil;
_cWeapons = nil;
_cAmmo = nil;

[_sdBackpacks, _sdItems, _sdWeapons, _sdAmmo, SDV_crates] call implentSupplyDrop;
_sdBackpacks = nil;
_sdItems = nil;
_sdWeapons = nil;
_sdAmmo = nil;

private _rewards = [];
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

private _iaPGroup = [];
private _iaSGroup = [];
private _iaPilot = [];
private _iaCrew = [];
private _iaOfficer = [];
private _iaGarrison = [];
private _iaAA = [];
private _iaArti = [];
private _iaStatic = [];
private _iaCAS = [];
private _iaTank = [];
private _iaAPC = [];
private _iaCar = [];
private _iaAir = [];
_conf = ["Spawn_vanilla"] call core_fnc_getConf;
if ( PLAYER_SIDE == west ) then {
	if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
		_iaPGroup = SVO_patrolGroup;
		_iaSGroup = SVO_sniperGroup;
		_iaPilot = SVO_pilot;
		_iaCrew = SVO_crew;
		_iaOfficer = SVO_officer;
		_iaGarrison = SVO_garrison;
		_iaAA = SVO_aaTank;
		_iaArti = SVO_arti;
		_iaStatic = SVO_static;
		_iaCAS = SVO_cas;
		_iaTank = SVO_tank;
		_iaAPC = SVO_apc;
		_iaCar = SVO_car;
		_iaAir = SVO_airPatrol;
		
	};
} else {
	if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
		_iaPGroup = SVB_patrolGroup;
		_iaSGroup = SVB_sniperGroup;
		_iaPilot = SVB_pilot;
		_iaCrew = SVB_crew;
		_iaOfficer = SVB_officer;
		_iaGarrison = SVB_garrison;
		_iaAA = SVB_aaTank;
		_iaArti = SVB_arti;
		_iaStatic = SVB_static;
		_iaCAS = SVB_cas;
		_iaTank = SVB_tank;
		_iaAPC = SVB_apc;
		_iaCar = SVB_car;
		_iaAir = SVB_airPatrol;
	};	
};

[RTV, _iaPGroup, _iaSGroup,_iaPilot, _iaCrew, _iaOfficer, _iaGarrison, _iaAA, _iaArti, _iaStatic, _iaCAS, _iaTank, _iaAPC, _iaCar, _iaAir] call common_fnc_implentSpawn;

_iaPGroup = nil;
_iaSGroup = nil;
_iaPilot = nil;
_iaCrew = nil;
_iaOfficer = nil;
_iaGarrison = nil;
_iaAA = nil;
_iaArti = nil;
_iaStatic = nil;
_iaCAS = nil;
_iaTank = nil;
_iaAPC = nil;
_iaCar = nil;
_iaAir = nil;

private _bvCar = []; 
private _bvAPC = []; 
private _bvTank = [];
private _bvPlaneCAS = [];
private _bvPlaneAA = [];
private _bvPlaneTransport = [];
private _bvHeliSmall = [];
private _bvHeliMedium = [];
private _bvHeliMedEvac = [];
private _bvHeliBig = [];
private _bvHeliAttack = []; 
private _bvBoatSmall = [];
private _bvBoatAttack = [];
private _bvBoatBig = [];
private _bvRepair = [];
private _bvFuel = [];
private _bvQuad = [];
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
	_bvRepair append BVVB_repair;
	_bvFuel append BVVB_fuel;
	_bvQuad append BVVB_quad;
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
	_bvRepair append BVVO_repair;
	_bvFuel append BVVO_fuel;
	_bvQuad append BVVO_quad;
};

[_bvCar, _bvAPC, _bvTank, _bvPlaceCAS, _bvPlaneAA, _bvPlaneTransport, 
 _bvHeliSmall, _bvHeliMedium, _bvHeliMedEvac, _bvHeliBig, _bvHeliAttack, 
 _bvBoatSmall, _bvBoatAttack, _bvBoatBig,
 _bvRepair, _bvFuel, _bvQuad
] call common_fnc_implentBaseVehicle;

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
_bvRepair = nil;
_bvFuel = nil;
_bvQuad = nil;

[RGV_launcher, RGV_mg, RGV_sRifle, RGV_mRifle, RGV_sScope, RGV_mScope, RGV_oScope, RGV_backpack] call implentRestrictedGear;

[AVV_heli, AVV_plane, AVV_tank] call implentAllowedVehicle;

{ [_x, "UAV", "vehicle"] call common_fnc_implent; } forEach (UAVV);