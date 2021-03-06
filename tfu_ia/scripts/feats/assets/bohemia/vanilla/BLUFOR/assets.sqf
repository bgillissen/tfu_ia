/*
@filename: feats\assets\bohemia\vanilla\BLUFOR\assets.sqf
Author:
	Ben
Description:
	call by feats\assets\bohemia\vanilla\init.sqf
	return the Vanilla BLUFOR assets
*/

private _out = [];

//------------------------------------------------------------ Arsenal Vanilla BLUFOR

A_VB = 0;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];

_out set [A_VB, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Restricted Gear Vanilla BLUFOR

RG_VB = A_VB + 1;

private _launcher = [];
private _mg = [];
private _sRifle = [];
private _mRifle = [];
private _sScope = [];
private _mScope = [];
private _oScope = [];
private _mbrItem = [];
private _backpack = [];

_out set [RG_VB, [_launcher, _mg, _sRifle, _mRifle, _sScope, _mScope, _oScope, _mbrItem, _backpack]];

//------------------------------------------------------------ Allowed Vehicles Vanilla BLUFOR

AV_VB = RG_VB + 1;

private _heli = ["B_Heli_Light_01_F"];
private _plane = [];
private _tank = [];

_out set [AV_VB, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop Vanilla BLUFOR

SD_VB = AV_VB + 1;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];
private _crates = [];
private _vehicles = [];

_out set [SD_VB, [_backpacks, _items, _weapons, _ammo, _crates, _vehicles]];

//------------------------------------------------------------ Rewards Vanilla BLUFOR

R_VB = SD_VB + 1;

private _rewards = [];

_out set [R_VB, _rewards];

//------------------------------------------------------------ Spawn Vanilla BLUFOR

S_VB = R_VB + 1;

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

_out set [S_VB, [_rt, _crates, _pGroups, _sGroups, _pilot, _crew, _officer, _garrison, _civ,
                 _aa, _arti, _static, _cas, _tank, _apc, _car, _carArmed, _aPatrol]];

//------------------------------------------------------------ Vehicles Vanilla BLUFOR

BV_VB = S_VB + 1;

private _car = [];
private _carArmed = [];
private _apc = [];
private _tank = [];
private _aaTank = [];
private _planeCAS = [];
private _planeAA = [];
private _planeTransport = [];
private _uav = [];
private _heliSmall = ["B_Heli_Light_01_F"];
private _heliSmallArmed = ["B_Heli_Light_01_armed_F"];
private _heliMedium = [];
private _heliMedEvac = [];
private _heliBig = [];
private _heliAttack = [];
private _boatSmall = [];
private _boatAttack = [];
private _boatBig = [];
private _sub = ["B_SDV_01_F"];
private _landMedic = [];
private _repair = [];
private _fuel = [];
private _ammo = [];
private _quad = ["B_T_Quadbike_01_F"];

_out set [BV_VB, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Vehicles Cargo Vanilla BLUFOR

VC_VB = BV_VB + 1;

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

_out set [VC_VB, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                  _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                  _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Role Loadout Vanilla BLUFOR

RL_VB = VC_VB + 1;

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

_out set [RL_VB, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _crew,
                 _mortar, _uavOp, _spotter]];

//------------------------------------------------------------ Base Atmosphere Role Vanilla BLUFOR

BALO_VB = RL_VB + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_VB, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ FINITO, return
          
_out