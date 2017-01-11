/*
@filename: feats\mods\rhsUSAF\assets.sqf
Author:
	Ben
Description:
	call by feats\mods\rhsUSAF\init.sqf
	return the RHS USAF assets
*/

private _out = [];

//------------------------------------------------------------ Arsenal RHS USAF

//rhs_faction_usarmy_wd => jungle, woods MAP_KEYWORDS
//rhs_faction_usarmy_d => desert, dry MAP_KEYWORDS

A_USAF = 0;

private _backpacks = ["RHS_USAF"] call rhs_fnc_getBackpacks;
private _items = ["RHS_USAF"] call rhs_fnc_getItems;
private _weapons = ["RHS_USAF"] call rhs_fnc_getWeapons;
private _ammo = ["RHS_USAF"] call rhs_fnc_getMagazines;
//single shot launcher ammo, those are needed but got scope=1 :(
_ammo append ["rhs_m136_hedp_mag", "rhs_m136_hp_mag", "rhs_m136_mag", "rhs_m72a7_mag"]; 

_out set [A_USAF, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ Restricted Gear RHS USAF

RG_USAF = A_USAF + 1;

private _launcher = [];
private _mg = [];
private _sRifle = [];
private _mRifle = [];
private _sScope = [];
private _mScope = [];
private _oScope = [];
private _backpack = [];

_out set [RG_USAF, [_launcher, _mg, _sRifle, _mRifle, _sScope, _mScope, _oScope, _backpack]];

//------------------------------------------------------------ Allowed Vehicles RHS USAF

AV_USAF = RG_USAF + 1;

private _heli = ["RHS_MELB_MH6M", "RHS_MELB_H6M"];
private _plane = [];
private _tank = [];

_out set [AV_USAF, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop RHS USAF

SD_USAF = AV_USAF + 1;

private _backpacks = [];
private _items = [];
private _weapons = [["rhs_weap_M136", 5],
					["rhs_weap_M136_hedp", 5],
					["rhs_weap_M136_hp", 5],
					["rhs_weap_m4a1_blockII", 3]];
private _ammo = [["30Rnd_556x45_Stanag_Tracer_Red", 40],
                 ["rhsusf_100Rnd_762x51_m62_tracer", 15],
				 ["rhsusf_100Rnd_556x45_M200_soft_pouch", 15],
				 ["rhs_fim92_mag", 3],
				 ["rhs_fgm148_magazine_AT", 3],
				 ["rhsusf_mag_10Rnd_STD_50BMG_M33", 40],
				 ["rhs_mag_M441_HE", 20],
				 ["rhs_mag_an_m8hc", 40]];
private _crates = ["rhsusf_mags_crate"];
private _vehicles = ["RHS_UH60M", 
					 "RHS_CH_47F_10", 
					 "rhsusf_CH53E_USMC_D", 
					 "RHS_C130J"];

_out set [SD_USAF, [_backpacks, _items, _weapons, _ammo, _crates, _vehicles]];

//------------------------------------------------------------ Rewards RHS USAF

R_USAF = SD_USAF + 1;

private _rewards = [];

_out set [R_USAF, _rewards];

//------------------------------------------------------------ Spawn RHS USAF

S_USAF = R_USAF + 1;

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

_out set [S_USAF, [_rt, _crates, _pGroups, _sGroups, _pilot, _crew, _officer, _garrison, 
                _aa, _arti, _static, _cas, _tank, _apc, _car, _carArmed, _aPatrol]];

//------------------------------------------------------------ Vehicles RHS USAF

BV_USAF = S_USAF + 1;

private _car = [];
private _carArmed = ["rhsusf_m1025_w_m2"];
private _apc = [];
private _tank = [];
private _aaTank = [];
private _planeCAS = ["RHS_A10", "RHS_A10_AT"];
private _planeAA = [];
private _planeTransport = ["RHS_C130J"];
private _uav = [];
private _heliSmall = ["RHS_MELB_MH6M", "RHS_MELB_H6M"];
private _heliSmallArmed = ["RHS_MELB_AH6M_H", 
                           "RHS_MELB_AH6M_L",
                           "RHS_MELB_AH6M_M"];
private _heliMedium = ["RHS_UH60M"];
private _heliMedEvac = ["RHS_UH60M_MEV", "RHS_UH60M_MEV2"];
private _heliBig = ["RHS_CH_47F_10", 
					"rhsusf_CH53E_USMC_D"];
//private _heliAttack = ["RHS_USAF", ["rhs_faction_usarmy_wd", "rhs_faction_usmc_wd"], "Helicopter", true] call rhs_fnc_getVehicles;
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

_out set [BV_USAF, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Vehicles Cargo RHS USAF

VC_USAF = BV_USAF + 1;

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

_out set [VC_USAF, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                 _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                 _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Role Loadout RHS USAF

RL_USAF = VC_USAF + 1;

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

_out set [RL_USAF, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _mortar]];

//------------------------------------------------------------ Base Atmosphere Role Loadout RHS USAF

BALO_USAF = RL_USAF + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_USAF, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ FINITO, return
          
_out