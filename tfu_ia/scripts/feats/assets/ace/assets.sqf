/*
@filename: feats\assets\ace\assets.sqf
Author:
	Ben
Description:
	run on server
	call by feats\assets\ace\init.sqf
	return ACE assets
*/

_out = [];

//------------------------------------------------------------ Arsenal ACE

A_ACE = 0;

private _backpacks = [];
private _items = ["ACE_Altimeter",
                  "ACE_ATragMX",
                  "ACE_bloodIV",
                  "ACE_bloodIV_250",
                  "ACE_bloodIV_500",
                  "ACE_bodyBag",
                  "ACE_CableTie",
                  "ACE_Cellphone",
                  "ACE_Clacker",
                  "ACE_DeadManSwitch",
                  "ACE_DefusalKit",
                  "ACE_EarPlugs",
                  "ACE_epinephrine",
                  "ACE_fieldDressing",
                  "ACE_IR_Strobe_Item",
                  "ACE_Kestrel4500",
                  "ACE_M26_Clacker",
                  "ACE_MapTools",
                  "ACE_microDAGR",
                  "ACE_morphine",
                  "ACE_RangeTable_82mm",
                  "ACE_UAVBattery",
                  "ACE_Vector",
                  "ACE_wirecutter",
                  "ACE_NVG_Wide",
                  "ACE_NVG_Gen1",
                  "ACE_NVG_Gen2",
                  "ACE_NVG_Gen4",
                  "ACE_optic_Arco_2D",
                  "ACE_optic_Arco_PIP",
                  "ACE_optic_Hamr_2D",
                  "ACE_optic_Hamr_PIP",
                  "ACE_optic_LRPS_2D",
                  "ACE_optic_LRPS_PIP",
                  "ACE_optic_SOS_2D",
                  "ACE_optic_SOS_PIP",
                  "ACE_optic_MRCO_2D",
                  "ACE_optic_MRCO_PIP",
                  "ACE_acc_pointer_green_IR",
                  "ACE_acc_pointer_green",
                  "ACE_acc_pointer_red",
                  "muzzle_snds_H_SW"];
private _weapons = [];
private _ammo = ["ACE_HandFlare_Green",
                 "ACE_HandFlare_Red",
                 "ACE_HandFlare_White",
                 "ACE_HandFlare_Yellow",
                 "ACE_M84",
                 "IEDUrbanSmall_Remote_Mag",
                 "IEDLandSmall_Remote_Mag",
                 "IEDUrbanBig_Remote_Mag",
                 "IEDLandBig_Remote_Mag"];

_out set [A_ACE, [_backpacks, _items, _weapons, _ammo]];

//------------------------------------------------------------ supplyDrop ACE

SD_ACE = A_ACE + 1;

private _backpacks = [];
private _items = [["ACE_M26_Clacker", 2], 
                  ["ACE_epinephrine", 20], 
                  ["ACE_morphine", 40],
                  ["ACE_fieldDressing", 40],
                  ["ACE_bloodIV_500", 20],
                  ["ACE_bloodIV", 20],
                  ["ACE_bodyBag", 5],
                  ["ACE_EarPlugs", 10],
                  ["ACE_IR_Strobe_Item", 10]];
private _weapons = [];
private _ammo = [];

_out set [SD_ACE, [_backpacks, _items, _weapons, _ammo, [], []]];

//------------------------------------------------------------ Vehicles Cargo Vanilla BLUFOR

VC_ACE = SD_ACE + 1;

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

_out set [VC_ACE, [_car, _carArmed, _apc, _tank, _aaTank, _planeCAS, _planeAA, _planeTransport, _uav, 
                   _heliSmall, _heliSmallArmed, _heliMedium, _heliMedEvac, _heliBig, _heliAttack, 
                   _boatSmall, _boatAttack, _boatBig, _sub, _landMedic, _repair, _fuel, _ammo, _quad]];

//------------------------------------------------------------ Role Loadout Vanilla BLUFOR

RL_ACE = VC_ACE + 1;

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

_out set [RL_ACE, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                   _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _mortar]];

//------------------------------------------------------------ FINITO, return
_out;