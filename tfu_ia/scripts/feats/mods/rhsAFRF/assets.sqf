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

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];

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

private _rt = [];
private _crates = [];
private _pGroups = [["configFile", "CfgGroups", "East", "rhs_faction_msv", "rhs_group_rus_msv_infantry"]];
private _sGroups = [["configFile", "CfgGroups", "East", "rhs_faction_msv", "rhs_group_rus_msv_infantry", "rhs_group_rus_msv_infantry_squad_sniper"]];
private _pilot = ["rhs_pilot_combat_heli"];
private _crew = ["rhs_msv_emr_combatcrew"];
private _officer = [];
private _garrison = ["rhs_msv_emr_grenadier", "rhs_msv_emr_machinegunner"];
private _aa = ["rhs_zsu234_aa"];
private _arti = [];
private _static = ["RHS_AGS30_Tripod_MSV","rhs_KORD_MSV","RHS_NSV_Tripod_MSV","rhs_Igla_AA_pod_msv","rhs_D30_vdv","rhs_2b14_82mm_vdv"];
private _cas = [];
private _tank = ["rhs_t72bd_tv","rhs_t80","rhs_t90_tv"];
private _apc = ["rhs_tigr_sts_msv","rhsgref_BRDM2_HQ_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_bmp1_msv","rhs_bmp1d_msv","rhs_bmp1k_msv","rhs_bmp1p_msv","rhs_bmp3_late_msv"];
private _car = [];
private _carArmed = [];
private _aPatrol = ["RHS_Mi24P_vdv", "RHS_Ka52_vvsc"];

_out set [S_AFRF, [_rt, _crates, _pGroups, _sGroups, _pilot, _crew, _officer, _garrison, 
                _aa, _arti, _static, _cas, _tank, _apc, _car, _carArmed, _aPatrol]];

//------------------------------------------------------------ Vehicles RHS AFRF

BV_AFRF = S_AFRF + 1;

private _car = [];
private _carArmed = [];
private _apc = [];
private _tank = [];
private _aaTank = [];
private _planeCAS = [];
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
private _quad = ["quad"];

_out set [BV_AFRF, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
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
private _mortar = [];

_out set [RL_AFRF, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _mortar]];

//------------------------------------------------------------ Role Loadout RHS AFRF

BALO_AFRF = RL_AFRF + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_AFRF, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ FINITO, return
          
_out


