/*
@filename: feats\mods\rhsGREF\assets.sqf
Author:
	Ben
Description:
run on server,
	called by feats\mods\rhsGREF\init.sqf
	return the RHS GREF Independent assets
*/

private _out = [];

//------------------------------------------------------------ Arsenal RHS GREF Independent

A_GREFI = 0;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];

_out set [A_GREFI, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Restricted Gear RHS GREF Independent

RG_GREFI = A_GREFI + 1;

private _launcher = [];
private _mg = [];
private _sRifle = [];
private _mRifle = [];
private _sScope = [];
private _mScope = [];
private _oScope = [];
private _backpack = [];

_out set [RG_GREFI, [_launcher, _mg, _sRifle, _mRifle, _sScope, _mScope, _oScope, _backpack]];

//------------------------------------------------------------ Allowed Vehicles RHS GREF Independent

AV_GREFI = RG_GREFI + 1;

private _heli = [];
private _plane = [];
private _tank = [];

_out set [AV_GREFI, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop RHS GREF Independent

SD_GREFI = AV_GREFI + 1;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];
private _crates = [];
private _vehicles = [];

_out set [SD_GREFI, [_backpacks, _items, _weapons, _ammo, _crates, _vehicles]];

//------------------------------------------------------------ Rewards RHS GREF Independent

R_GREFI = SD_GREFI + 1;

private _rewards = [];

_out set [R_GREFI, _rewards];

//------------------------------------------------------------ Spawn RHS GREF Independent

S_GREFI = R_GREFI + 1;

private _rt = [];
private _crates = [];
private _pGroups = [];
private _sGroups = [];
private _pilot = ["rhsgref_cdf_air_pilot"];
private _crew = ["rhsgref_cdf_reg_crew"];
private _officer = ["rhsgref_cdf_reg_officer"];
private _garrison = ["rhsgref_ins_g_machinegunner", "rhsgref_ins_g_rifleman"];
private _aa = ["rhsgref_cdf_zsu234"];
private _arti = ["rhsgref_cdf_reg_BM21"];
private _static = [];
private _cas = ["rhsgref_cdf_su25", "rhs_l159_CDF", "rhs_l159_CDF_CAP", "rhs_l159_CDF_CAS", "rhs_l159_CDF_plamen", "rhs_l39_cdf"];
private _tank = ["rhsgref_cdf_t72ba_tv"];
private _apc = ["rhsgref_cdf_btr60", "rhsgref_cdf_btr70"];
private _car = ["rhsgref_cdf_reg_uaz_open", "rhsgref_cdf_reg_uaz"];
private _carArmed = ["rhsgref_cdf_reg_uaz_spg9", "rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_ags"];
private _aPatrol = ["rhsgref_mi24g_CAS", "rhsgref_mi24g_FAB", "rhsgref_mi24g_UPK23", "rhsgref_cdf_Mi35", "rhsgref_cdf_Mi35_UPK"];

_out set [S_GREFI, [_rt, _crates, _pGroups, _sGroups, _pilot, _crew, _officer, _garrison, 
                _aa, _arti, _static, _cas, _tank, _apc, _car, _carArmed, _aPatrol]];

//------------------------------------------------------------ Vehicles RHS GREF Independent

BV_GREFI = S_GREFI + 1;

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
private _quad = [];

_out set [BV_GREFI, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Vehicles Cargo RHS GREF Independent

VC_GREFI = BV_GREFI + 1;

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

_out set [VC_GREFI, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Role Loadout RHS GREF Independent

RL_GREFI = VC_GREFI + 1;

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

_out set [RL_GREFI, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _mortar]];

//------------------------------------------------------------ Role Loadout RHS GREF Independent

BALO_GREFI = RL_GREFI + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_GREFI, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ FINITO, return
          
_out
