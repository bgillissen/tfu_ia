/*
@filename: feats\mods\rhsAFRF\assets.sqf
Author:
	Ben
Description:
run on server,
	called by feats\mods\rhsAFRF\init.sqf
	return the RHS AFRF assets
*/

private _out = [];

//------------------------------------------------------------ Arsenal RHS AFRF

A_AFRF = 0;

private _backpacks = ["RHS_AFRF"] call rhs_fnc_getBackpacks;
private _items = ["RHS_AFRF"] call rhs_fnc_getItems;
private _weapons = ["RHS_AFRF"] call rhs_fnc_getWeapons;
private _ammo = ["RHS_AFRF"] call rhs_fnc_getMagazines;
		_ammo append ["rhs_rpg26_mag", "rhs_rshg2_mag", "rhs_mag_9x19_17", "rhs_mag_9x18_8_57N181S", "rhs_mag_9x18_12_57N181S"];

_out set [A_AFRF, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Restricted Gear RHS AFRF

RG_AFRF = A_AFRF + 1;

private _launcher = [];
private _mg = [];
private _sRifle = [];
private _mRifle = [];
private _sScope = [];
private _mScope = [];
private _oScope = [];
private _backpack = [];

_out set [RG_AFRF, [_launcher, _mg, _sRifle, _mRifle, _sScope, _mScope, _oScope, _backpack]];

//------------------------------------------------------------ Allowed Vehicles RHS AFRF

AV_AFRF = RG_AFRF + 1;

private _heli = [];
private _plane = [];
private _tank = [];

_out set [AV_AFRF, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop RHS AFRF

SD_AFRF = AV_AFRF + 1;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];
private _crates = [];
private _vehicles = [];

_out set [SD_AFRF, [_backpacks, _items, _weapons, _ammo, _crates, _vehicles]];

//------------------------------------------------------------ Rewards RHS AFRF

R_AFRF = SD_AFRF + 1;

private _rewards = [];

_out set [R_AFRF, _rewards];

//------------------------------------------------------------ Spawn RHS AFRF

S_AFRF = R_AFRF + 1;

private _rt = ["rhs_p37", "rhs_prv13"];
private _crates = [];
private _pGroups = [["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry"],
                    ["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry_emr"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_flora"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_mflora"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_recon"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry_recon"]];
private _sGroups = [["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry", "rhs_group_rus_msv_infantry_squad_mg_sniper"],
                    ["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry", "rhs_group_rus_msv_infantry_squad_sniper"],
                    ["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry_emr", "rhs_group_rus_msv_infantry_emr_squad_mg_sniper"],
                    ["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry_emr", "rhs_group_rus_msv_infantry_emr_squad_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry", "rhs_group_rus_vdv_infantry_squad_mg_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry", "rhs_group_rus_vdv_infantry_squad_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_flora", "rhs_group_rus_vdv_infantry_flora_squad_mg_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_flora", "rhs_group_rus_vdv_infantry_flora_squad_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_mflora", "rhs_group_rus_vdv_infantry_mflora_squad_mg_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_mflora", "rhs_group_rus_vdv_infantry_mflora_squad_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_recon", "rhs_group_rus_vdv_infantry_recon_squad_mg_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_recon", "rhs_group_rus_vdv_infantry_recon_squad_sniper"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry", "rhs_group_rus_vmf_infantry_squad_mg_sniper"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry", "rhs_group_rus_vmf_infantry_squad_sniper"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry_recon", "rhs_group_rus_vmf_infantry_recon_squad_mg_sniper"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry_recon", "rhs_group_rus_vmf_infantry_recon_squad_sniper"]];
private _pilot = ["rhs_pilot_combat_heli"];
private _crew = ["rhs_msv_emr_combatcrew"];
private _officer = ["rhs_msv_emr_officer"];
private _garrison = ["rhs_msv_emr_grenadier", "rhs_msv_emr_machinegunner"];
private _aa = ["rhs_zsu234_aa", "rhs_gaz66_zu23_vdv", "RHS_Ural_Zu23_VDV_01"];
private _arti = ["rhs_2s3_tv", "RHS_BM21_VDV_01"];
private _static = ["RHS_AFRF", nil, "StaticWeapon", true] call rhs_fnc_getVehicles;
private _cas = ["RHS_AFRF", nil, "O_Plane_CAS_02_F", true] call rhs_fnc_getVehicles;
private _tank = ["RHS_AFRF", nil, ["rhs_a3spruttank_base", "rhs_tank_base"], true] call rhs_fnc_getVehicles;
private _apc = ["RHS_AFRF", nil, ["rhs_bmp1tank_base", "rhs_bmd_base"], true] call rhs_fnc_getVehicles;
private _car = ["RHS_AFRF", nil, ["Offroad_01_base_F", "MRAP_02_base_F"], false] call rhs_fnc_getVehicles;
private _carArmed = ["RHS_AFRF", nil, ["Wheeled_APC_F", "MRAP_01_base_F"], true] call rhs_fnc_getVehicles;
private _aPatrol = ["RHS_Mi24P_vdv", "RHS_Ka52_vvsc"];
private _civ = [];

_out set [S_AFRF, [_rt, _crates, _pGroups, _sGroups, _pilot, _crew, _officer, _garrison, _civ,
                _aa, _arti, _static, _cas, _tank, _apc, _car, _carArmed, _aPatrol]];

//------------------------------------------------------------ Vehicles RHS AFRF

BV_AFRF = S_AFRF + 1;

//private _car = [];
//private _carArmed = [];
//private _apc = [];
//private _tank = [];
//private _aaTank = [];
//private _planeCAS = [];
private _planeAA = [];
private _planeTransport = [];
private _uav = [];
private _heliSmall = [];
private _heliSmallArmed = [];
private _heliMedium = [];
private _heliMedEvac = [];
private _heliBig = [];
private _heliAttack = [];
private _boatSmall = [];
private _boatAttack = [];
private _boatBig = [];
private _sub = [];
private _landMedic = [];
private _repair = [];
private _fuel = [];
private _ammo = [];
private _quad = [];

_out set [BV_AFRF, [_car, _carArmed, _apc, _tank, _aa, _cas, _planeAA, _planeTransport, _uav, 
                _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Vehicles Cargo RHS AFRF

VC_AFRF = BV_AFRF + 1;

private _car = [[],[],[],[]];
private _carArmed = [[],[],[],[]];
private _apc = [[],[],[],[]];
private _tank = [[],[],[],[]];
private _aaTank = [[],[],[],[]];
private _planeCAS = [[],[],[],[]];
private _planeAA = [[],[],[],[]];
private _planeTransport = [[],[],[],[]];
private _uav = [[],[],[],[]];
private _heliSmall = [[],[],[],[]];
private _heliSmallArmed = [[],[],[],[]];
private _heliMedium = [[],[],[],[]];
private _heliMedEvac = [[],[],[],[]];
private _heliBig = [[],[],[],[]];
private _heliAttack = [[],[],[],[]];
private _boatSmall = [[],[],[],[]];
private _boatAttack = [[],[],[],[]];
private _boatBig = [[],[],[],[]];
private _sub = [[],[],[],[]];
private _landMedic = [[],[],[],[]];
private _repair = [[],[],[],[]];
private _fuel = [[],[],[],[]];
private _ammo = [[],[],[],[]];
private _quad = [[],[],[],[]];

_out set [VC_AFRF, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Role Loadout RHS AFRF

RL_AFRF = VC_AFRF + 1;

private _hq = [];
private _sl = [];
private _tl = [];
private _medic = [];
private _lmg = [];
private _hmg = [];
private _assHMG = [];
private _at = [];
private _assAT = [];
private _sniper = [];
private _marksman = [];
private _repair = [];
private _demo = [];
private _engineer = [];
private _grenadier = [];
private _rifleman = [];
private _jtac = [];
private _hPilot = [];
private _jPilot = [];
private _crew = [];
private _mortar = [];
private _uavopp = [];
private _spotter = [];

_out set [RL_AFRF, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _crew,
                 _mortar, _uavopp, _spotter]];

//------------------------------------------------------------ Role Loadout RHS AFRF

BALO_AFRF = RL_AFRF + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_AFRF, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ FINITO, return
          
_out


