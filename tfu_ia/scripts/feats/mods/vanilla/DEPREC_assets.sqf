/*
@filename: feats\mods\vanilla\assets.sqf
Author:
	Ben
Description:
	call by feats\mods\serverPreInit.sqf
	define Vanilla assets
*/

private _a = [];
private _b = [];

//------------------------------------------------------------ Arsenal Vanilla BLUFOR

AVB = 0;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];

_a set [AVB, (["A", _backpacks, _items, _weapons, _ammo] call mods_fnc_append)];

//------------------------------------------------------------ Arsenal Vanilla OPFOR

AVO = AVB + 1;

_backpacks = [];
_items = [];
_weapons = [];
_ammo = [];

_a set [AVO, (["A", _backpacks, _items, _weapons, _ammo] call mods_fnc_append)];

//------------------------------------------------------------ Arsenal Vanilla (common)

AV = AVO + 1;

_backpacks = [];
_items = [];
_weapons = [];
_ammo = [];

_a set [AV, (["A", _backpacks, _items, _weapons, _ammo] call mods_fnc_append)];

//------------------------------------------------------------ Restricted Gear Vanilla BLUFOR

RGVB = AV + 1;

_launcher = [];
_mg = [];
_sRifle = [];
_mRifle = [];
_sScope = [];
_mScope = [];
_oScope = [];
_backpack = [];

_a set [RGVB, ["RG", _launcher, _mg, _sRifle, _mRifle, _sScope, _mScope, _oScope, _backpack]];

//------------------------------------------------------------ Restricted Gear Vanilla OPFOR

RGVO_launcher = [];
RGVO_mg = [];
RGVO_sRifle = [];
RGVO_mRifle = [];
RGVO_sScope = [];
RGVO_mScope = [];
RGVO_oScope = [];
RGVO_backpack = [];

//------------------------------------------------------------ Cargo Vanilla BLUFOR
						 
CVB_backpacks = [];
CVB_weapons = [];
CVB_ammo = [];
CVB_items = [];

//------------------------------------------------------------ Cargo Vanilla OPFOR

CVO_backpacks = [];
CVO_weapons = [];
CVO_ammo = [];
CVO_items = [];

//------------------------------------------------------------ Cargo Vanilla (common)
						 
CV_backpacks = [];
CV_weapons = [];
CV_ammo = [["SatchelCharge_Remote_Mag", 5],
           ["DemoCharge_Remote_Mag", 10]];
CV_items = [["Laserdesignator", 5],
			["Laserbatteries", 5],
			["MineDetector", 5],
			["NVGoggles", 5],
			["FirstAidKit", 20],
			["Medikit", 3],
			["ToolKit", 3]];

//------------------------------------------------------------ Allowed Vehicles Vanilla

AVV_heli = [];
AVV_plane = [];
AVV_tank = [];

//------------------------------------------------------------ supplyDrop Vanilla BLUFOR

SDVB_backpacks = [];
SDVB_items = [];
SDVB_weapons = [];
SDVB_ammo = [];

//------------------------------------------------------------ supplyDrop Vanilla OPFOR

SDVO_backpacks = [];
SDVO_items = [];
SDVO_weapons = [];
SDVO_ammo = [];

//------------------------------------------------------------ supplyDrop Vanilla (common)

SDV_backpacks = [];
SDV_items = [];
SDV_weapons = [];
SDV_ammo = [];
SDV_crates = [];

//------------------------------------------------------------ Rewards Vanilla BLUFOR

RVB = [];

//------------------------------------------------------------ Rewards Vanilla OPFOR

RVO = [];

//------------------------------------------------------------ RadioTower Vanilla

RTV = ["Land_TTowerBig_2_F"];

//------------------------------------------------------------ Spawn Vanilla BLUFOR

SVB_pilot = [];
SVB_crew = [];
SVB_officer = [];
SVB_cas = [];
SVB_patrolGroups = [];
SVB_sniperGroups = [];
SVB_aaTank = [];
SVB_arti = [];
SVB_static = [];
SVB_tank = [];
SVB_apc = [];
SVB_car = [];
SVB_carAttack = [];
SVB_airPatrol = [];
SVB_garrison = [];

//------------------------------------------------------------ Spawn Vanilla OPFOR

SVO_pilot = [];
SVO_crew = [];
SVO_officer = [];
SVO_cas = [];
SVO_patrolGroups = [];
SVO_sniperGroups = [];
SVO_aaTank = [];
SVO_arti = [];
SVO_static = [];
SVO_tank = [];
SVO_apc = [];
SVO_car = [];
SVO_carAttack = [];
SVO_airPatrol = [];
SVO_garrison = [];

//------------------------------------------------------------ Spawn Vanilla Crates

SV_crates = ["Land_CargoBox_V1_F"];

//------------------------------------------------------------ Vehicles Vanilla BLUFOR

VVB_car = [];
VVB_carArmed = [];
VVB_apc = [];
VVB_tank = [];
VVB_aaTank = [];
VVB_planeCAS = [];
VVB_planeAA = [];
VVB_planeTransport = [];
VVB_uav = ["B_UAV_02_CAS_F", "B_UAV_02_F", "B_UGV_01_F", "B_UGV_01_rcws_F"];
VVB_heliSmall = [];
VVB_heliSmallArmed = [];
VVB_heliMedium = [];
VVB_heliMedEvac = [];
VVB_heliBig = [];
VVB_heliAttack = [];
VVB_boatSmall = [];
VVB_boatAttack = [];
VVB_boatBig = [];
VVB_sub = [];
VVB_landMedic = [];
VVB_repair = [];
VVB_fuel = [];
VVB_ammo = [];
VVB_quad = [];

//------------------------------------------------------------ Vehicles Vanilla OPFOR

VVO_car = [];
VVO_carArmed = [];
VVO_apc = [];
VVO_tank = [];
VVO_aaTank = [];
VVO_planeCAS = [];
VVO_planeAA = [];
VVO_planeTransport = [];
VVO_uav = [];
VVO_heliSmall = [];
VVO_heliSmallArmed = [];
VVO_heliMedium = [];
VVO_heliMedEvac = [];
VVO_heliBig = [];
VVO_heliAttack = [];
VVO_boatSmall = [];
VVO_boatAttack = [];
VVO_boatBig = [];
VVO_sub = [];
VVO_landMedic = [];
VVO_repair = [];
VVO_fuel = [];
VVO_ammo = [];
VVO_quad = [];

//------------------------------------------------------------ Vehicles Cargo Vanilla BLUFOR

VCVB_car = [];
VCVB_carArmed = [];
VCVB_apc = [];
VCVB_tank = [];
VCVB_aaTank = [];
VCVB_planeCAS = [];
VCVB_planeAA = [];
VCVB_planeTransport = [];
VCVB_uav = [];
VCVB_heliSmall = [];
VCVB_heliSmallArmed = [];
VCVB_heliMedium = [];
VCVB_heliMedEvac = [];
VCVB_heliBig = [];
VCVB_heliAttack = [];
VCVB_boatSmall = [];
VCVB_boatAttack = [];
VCVB_boatBig = [];
VCVB_sub = [];
VCVB_landMedic = [];
VCVB_repair = [];
VCVB_fuel = [];
VCVB_ammo = [];
VCVB_quad = [];

//------------------------------------------------------------ Vehicles Cargo Vanilla OPFOR

VCVO_car = [];
VCVO_carArmed = [];
VCVO_apc = [];
VCVO_tank = [];
VCVO_aaTank = [];
VCVO_planeCAS = [];
VCVO_planeAA = [];
VCVO_planeTransport = [];
VCVO_uav = [];
VCVO_heliSmall = [];
VCVO_heliSmallArmed = [];
VCVO_heliMedium = [];
VCVO_heliMedEvac = [];
VCVO_heliBig = [];
VCVO_heliAttack = [];
VCVO_boatSmall = [];
VCVO_boatAttack = [];
VCVO_boatBig = [];
VCVO_sub = [];
VCVO_landMedic = [];
VCVO_repair = [];
VCVO_fuel = [];
VCVO_ammo = [];
VCVO_quad = [];

//------------------------------------------------------------ Vehicles Cargo Vanilla (common)

VCV_car = [];
VCV_carArmed = [];
VCV_apc = [];
VCV_tank = [];
VCV_aaTank = [];
VCV_planeCAS = [];
VCV_planeAA = [];
VCV_planeTransport = [];
VCV_uav = [];
VCV_heliSmall = [];
VCV_heliSmallArmed = [];
VCV_heliMedium = [];
VCV_heliMedEvac = [];
VCV_heliBig = [];
VCV_heliAttack = [];
VCV_boatSmall = [];
VCV_boatAttack = [];
VCV_boatBig = [];
VCV_sub = [];
VCV_landMedic = [];
VCV_repair = [];
VCV_fuel = [];
VCV_ammo = [];
VCV_quad = [];

//------------------------------------------------------------ Role Loadout Vanilla BLUFOR

RLVB_hq = [];
RLVB_sl = [];
RLVB_tl = [];
RLVB_medic = [];
RLVB_lmg = [];
RLVB_hmg = [];
RLVB_assHMG = [];
RLVB_at = [];
RLVB_assAT = [];
RLVB_sniper = [];
RLVB_marksman = [];
RLVB_repair = [];
RLVB_demo = [];
RLVB_engineer = [];
RLVB_grenadier = [];
RLVB_rifleman = [];
RLVB_jtac = [];
RLVB_pilot = [];
RLVB_mortar = [];

//------------------------------------------------------------ Role Loadout Vanilla OPFOR

RLVO_hq = [];
RLVO_sl = [];
RLVO_tl = [];
RLVO_medic = [];
RLVO_lmg = [];
RLVO_hmg = [];
RLVO_assHMG = [];
RLVO_at = [];
RLVO_assAT = [];
RLVO_sniper = [];
RLVO_marksman = [];
RLVO_repair = [];
RLVO_demo = [];
RLVO_engineer = [];
RLVO_grenadier = [];
RLVO_rifleman = [];
RLVO_jtac = [];
RLVO_pilot = [];
RLVO_mortar = [];

