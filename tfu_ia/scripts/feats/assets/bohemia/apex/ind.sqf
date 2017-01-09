/*
@filename: feats\assets\bohemia\apex\ind.sqf
Author:
	Ben
Description:
	call by feats\assets\apex\init.sqf
	return the Apex IND assets
*/

private _out = [];

//------------------------------------------------------------ Arsenal Apex IND

A_AI = 0;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];

_out set [A_AI, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Restricted Gear Apex IND

RG_AI = A_AI + 1;

private _launcher = [];
private _mg = [];
private _sRifle = [];
private _mRifle = [];
private _sScope = [];
private _mScope = [];
private _oScope = [];
private _backpack = [];

_out set [RG_AI, [_launcher, _mg, _sRifle, _mRifle, _sScope, _mScope, _oScope, _backpack]];

//------------------------------------------------------------ Allowed Vehicles Apex IND

AV_AI = RG_AI + 1;

private _heli = [];
private _plane = [];
private _tank = [];

_out set [AV_AI, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop Apex IND

SD_AI = AV_AI + 1;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];
private _crates = [];
private _vehicles = [];

_out set [SD_AI, [_backpacks, _items, _weapons, _ammo, _crates, _vehicles]];

//------------------------------------------------------------ Rewards Apex IND

R_AI = SD_AI + 1;

private _rewards = [];

_out set [R_AI, _rewards];

//------------------------------------------------------------ Spawn Apex IND

S_AI = R_AI + 1;

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

_out set [S_AI, [_rt, _crates, _pGroups, _sGroups, _pilot, _crew, _officer, _garrison, 
                _aa, _arti, _static, _cas, _tank, _apc, _car, _carArmed, _aPatrol]];

//------------------------------------------------------------ Vehicles Apex IND

BV_AI = S_AI + 1;

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

_out set [BV_AI, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Vehicles Cargo Apex IND

VC_AI = BV_AI + 1;

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

_out set [VC_AI, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Role Loadout Apex IND

RL_AI = VC_AI + 1;

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

_out set [RL_AI, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _mortar]];

//------------------------------------------------------------ Base Atmosphere Role Apex IND

BALO_AI = RL_AI + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_AI, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ FINITO, return
          
_out