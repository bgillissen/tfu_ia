/*
@filename: feats\assets\rhs\GREF\BLUFOR\assets.sqf
Author:
	Ben
Description:
run on server,
	called by feats\asstes\rhs\GREF\init.sqf
	return the RHS GREF Blufor assets
*/

private _out = [];

//------------------------------------------------------------ Arsenal RHS GREF Blufor

A_GREFB = 0;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];

_out set [A_GREFB, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Restricted Gear RHS GREF Blufor

RG_GREFB = A_GREFB + 1;

private _launcher = [];
private _mg = [];
private _sRifle = [];
private _mRifle = [];
private _sScope = [];
private _mScope = [];
private _oScope = [];
private _mbrItem = [];
private _backpack = [];

_out set [RG_GREFB, [_launcher, _mg, _sRifle, _mRifle, _sScope, _mScope, _oScope, _mbrItem, _backpack]];

//------------------------------------------------------------ Allowed Vehicles RHS GREF Blufor

AV_GREFB = RG_GREFB + 1;

private _heli = [];
private _plane = [];
private _tank = [];

_out set [AV_GREFB, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop RHS GREF Blufor

SD_GREFB = AV_GREFB + 1;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];
private _crates = [];
private _vehicles = [];

_out set [SD_GREFB, [_backpacks, _items, _weapons, _ammo, _crates, _vehicles]];

//------------------------------------------------------------ Rewards RHS GREF Blufor

R_GREFB = SD_GREFB + 1;

private _rewards = [];

_out set [R_GREFB, _rewards];

//------------------------------------------------------------ Spawn RHS GREF Blufor

S_GREFB = R_GREFB + 1;

private _rt = [];
private _crates = [];
private _pGroups = [];
private _sGroups = [];
private _pilot = [];
private _crew = [];
private _officer = [];
private _garrison = [];
private _aa = [];
private _arti = [];
private _static = [];
private _cas = [];
private _tank = [];
private _apc = [];
private _car = [];
private _carArmed = [];
private _aPatrol = [];
private _civ = [];

_out set [S_GREFB, [_rt, _crates, _pGroups, _sGroups, _pilot, _crew, _officer, _garrison, _civ, 
                _aa, _arti, _static, _cas, _tank, _apc, _car, _carArmed, _aPatrol]];

//------------------------------------------------------------ Vehicles RHS GREF Blufor

BV_GREFB = S_GREFB + 1;

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

_out set [BV_GREFB, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Vehicles Cargo RHS GREF Blufor

VC_GREFB = BV_GREFB + 1;

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

_out set [VC_GREFB, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Role Loadout RHS GREF Blufor

RL_GREFB = VC_GREFB + 1;

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
private _uavOp = [];
private _spotter = [];

_out set [RL_GREFB, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _crew,
                 _mortar, _uavOp, _spotter]];

//------------------------------------------------------------ Role Loadout RHS GREF Blufor

BALO_GREFB = RL_GREFB + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_GREFB, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ FINITO, return
          
_out
