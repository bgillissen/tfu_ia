/*
@filename: feats\mods\vanilla\assetOpfor.sqf
Author:
	Ben
Description:
	call by feats\mods\vanilla\init.sqf
	return the Vanilla OPFOR assets
*/

private _out = [];

//------------------------------------------------------------ Arsenal Vanilla OPFOR

AVB = 0;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];

_out set [AVB, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Restricted Gear Vanilla OPFOR

RGVB = AVB + 1;

private _launcher = [];
private _mg = [];
private _sRifle = [];
private _mRifle = [];
private _sScope = [];
private _mScope = [];
private _oScope = [];
private _backpack = [];

_out set [RGVB, [_launcher, _mg, _sRifle, _mRifle, _sScope, _mScope, _oScope, _backpack]];

//------------------------------------------------------------ Cargo Vanilla OPFOR

CVB = RGVB + 1;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];

_out set [CVB, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Allowed Vehicles Vanilla OPFOR

AVVB = CVB + 1;

private _heli = [];
private _plane = [];
private _tank = [];

_out set [AVVB, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop Vanilla OPFOR

SDVB = AVVB + 1;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];
private _crates = [];

_out set [SDVB, [_backpacks, _items, _weapons, _ammo, _crates]];

//------------------------------------------------------------ Rewards Vanilla OPFOR

RVB = SDVB + 1;

private _rewards = [];

_out set [RVB, _rewards];

//------------------------------------------------------------ Spawn Vanilla OPFOR

SVB = RVB + 1;

private _rt = ["Land_TTowerBig_2_F"];
private _crates = ["Land_CargoBox_V1_F"];
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

_out set [SVB, [_rt, _crates, _pGroups, _sGroups, _pilot, _crew, _officer, _garrison, 
                _aa, _arti, _static, _cas, _tank, _apc, _car, _carArmed, _aPatrol]];

//------------------------------------------------------------ Vehicles Vanilla OPFOR

VVB = SVB + 1;

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

_out set [VVB, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Vehicles Cargo Vanilla OPFOR

VCVB = VVB + 1;

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

_out set [VCVB, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Role Loadout Vanilla OPFOR

RLVB = VCVB + 1;

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
private _pilot = [];
private _mortar = [];

_out set [RLVB, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _pilot, _mortar]];

//------------------------------------------------------------ FINITO, return
          
_out