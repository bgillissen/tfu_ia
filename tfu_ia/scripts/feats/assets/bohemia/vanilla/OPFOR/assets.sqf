/*
@filename: feats\assets\vanilla\OPFOR\assets.sqf
Author:
	Ben
Description:
	call by feats\assets\bohemia\vanilla\init.sqf
	return the Vanilla OPFOR assets
*/

private _out = [];

//------------------------------------------------------------ Arsenal Vanilla OPFOR

A_VO = 0;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];

_out set [A_VO, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Restricted Gear Vanilla OPFOR

RG_VO = A_VO + 1;

private _launcher = [];
private _mg = [];
private _sRifle = [];
private _mRifle = [];
private _sScope = [];
private _mScope = [];
private _oScope = [];
private _mbrItem = [];
private _backpack = [];

_out set [RG_VO, [_launcher, _mg, _sRifle, _mRifle, _sScope, _mScope, _oScope, _mbrItem, _backpack]];

//------------------------------------------------------------ Allowed Vehicles Vanilla OPFOR

AV_VO = RG_VO + 1;

private _heli = [];
private _plane = [];
private _tank = [];

_out set [AV_VO, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop Vanilla OPFOR

SD_VO = AV_VO + 1;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];
private _crates = [];
private _vehicles = [];

_out set [SD_VO, [_backpacks, _items, _weapons, _ammo, _crates, _vehicles]];

//------------------------------------------------------------ Rewards Vanilla OPFOR

R_VO = SD_VO + 1;

private _rewards = [];

_out set [R_VO, _rewards];

//------------------------------------------------------------ Spawn Vanilla OPFOR

S_VO = R_VO + 1;

private _rt = [];
private _crates = [];
private _pGroups = [];
private _sGroups = [];
private _pilot = [];
private _crew = [];
private _officer = [];
private _garrison = ["O_Soldier_GR_F"];
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

_out set [S_VO, [_rt, _crates, _pGroups, _sGroups, _pilot, _crew, _officer, _garrison, _civ,
                _aa, _arti, _static, _cas, _tank, _apc, _car, _carArmed, _aPatrol]];

//------------------------------------------------------------ Vehicles Vanilla OPFOR

BV_VO = S_VO + 1;

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

_out set [BV_VO, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Vehicles Cargo Vanilla OPFOR

VC_VO = BV_VO + 1;

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

_out set [VC_VO, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Role Loadout Vanilla OPFOR

RL_VO = VC_VO + 1;

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
private _hpilot = [];
private _jPilot = [];
private _crew = [];
private _mortar = [];
private _uavOp = [];
private _spotter = [];

_out set [RL_VO, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _crew,
                 _mortar, _uavOp, _spotter]];

//------------------------------------------------------------ Base Atmosphere Role Vanilla BLUFOR

BALO_VO = RL_VO + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_VO, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ FINITO, return
          
_out