/*
@filename: feats\mods\rhsAFRF\assets.sqf
Author:
	Ben & Rainman
Description:
run on server,
	called by feats\mods\rhsAFRF\init.sqf
	return the RHS AFRF assets
*/

private _out = [];

//------------------------------------------------------------ Arsenal RHS AFRF

//rhs_faction_afrf_wd => jungle, woods MAP_KEYWORDS

A_AFRF = 0;

private _backpacks = ["RHS_AFRF"] call rhs_fnc_getBackpacks;
private _items = ["RHS_AFRF"] call rhs_fnc_getItems;
private _weapons = ["RHS_AFRF"] call rhs_fnc_getWeapons;
private _ammo = ["RHS_AFRF"] call rhs_fnc_getMagazines;
_ammo append ["rhs_30Rnd_545x39_AK"];

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

private _heli = ["RHS_Mi8mt_vvs"];
private _plane = [];
private _tank = [];

_out set [AV_AFRF, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop RHS AFRF

SD_AFRF = AV_AFRF + 1;

private _backpacks = [["rhs_assault_umbts", 2]];
private _items = [];
private _weapons = [["rhs_weap_rpg26", 5],
					["rhs_weap_ak74m_camo_npz", 3]];
private _ammo = [["rhs_30Rnd_545x39_AK", 40]];

private _crates = [rhsusf_mags_crate];
private _vehicles = [RHS_Mi8mt_vvs];

_out set [SD_AFRF, [_backpacks, _items, _weapons, _ammo, _crates, _vehicles]];

//------------------------------------------------------------ Rewards RHS AFRF

R_AFRF = SD_AFRF + 1;

private _rewards = [];

_out set [R_AFRF, _rewards];

//------------------------------------------------------------ Spawn RHS AFRF

S_AFRF = R_AFRF + 1;

private _rt = [];
private _crates = [rhsusf_mags_crate];
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
private _quad = [];

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

/*
 [uniform, [inUniform]],
 [vest, inVest]],
 [backpack, [inBackpack]],
 [primWeapon, [primWeaponItems]]
 [secWeapon, [secWeapItems]],
 [handWeapon, handWeapItems]],
 helmet, face, comm, terminal, map, bino, nv, watch, compass
*/

RL_AFRF = VC_AFRF + 1;

private _hq = [[(["hq"] call rhsAFRF_fnc_uniform), []],
               ["", []],
               ["", []],
               ["", []],
               ["", []],
               ["", []],
               (["hq"] call rhsAFRF_fnc_helmet), "", "", "", "", "", "", "", ""];
private _sl = [[(["sl"] call rhsAFRF_fnc_uniform), []],
              [(["sl"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["sl"] call rhsAFRF_fnc_backpack), []],
              [(["sl"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["sl"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _tl = [[(["tl"] call rhsAFRF_fnc_uniform), []],
              [(["tl"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["tl"] call rhsAFRF_fnc_backpack), []],
              [(["tl"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["tl"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _medic = [[(["medic"] call rhsAFRF_fnc_uniform), []],
              [(["medic"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["medic"] call rhsAFRF_fnc_backpack), []],
              [(["medic"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["medic"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _lmg = [[(["lmg"] call rhsAFRF_fnc_uniform), []],
              [(["lmg"] call rhsAFRF_fnc_vest), [["rhs_100Rnd_762x54mmR", 2], ["rhs_mag_rdg2_white", 2]]],
              [(["lmg"] call rhsAFRF_fnc_backpack), [["rhs_100Rnd_762x54mmR", 2]]],
              [(["lmg"] call rhsAFRF_fnc_primWeap), ["rhs_acc_pkas", "rhs_100Rnd_762x54mmR"]],
              ["", []],
              ["", []],
              (["lmg"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _hmg = [[(["hmg"] call rhsAFRF_fnc_uniform), []],
              [(["hmg"] call rhsAFRF_fnc_vest), [["rhs_100Rnd_762x54mmR", 2], ["rhs_mag_rdg2_white", 2]]],
              [(["hmg"] call rhsAFRF_fnc_backpack), [["rhs_100Rnd_762x54mmR", 2]]],
              [(["hmg"] call rhsAFRF_fnc_primWeap), ["rhs_acc_pkas", "rhs_100Rnd_762x54mmR"]],
              ["", []],
              ["", []],
              (["hmg"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _assHMG = [[(["assHMG"] call rhsAFRF_fnc_uniform), []],
              [(["assHMG"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["assHMG"] call rhsAFRF_fnc_backpack), [["rhs_100Rnd_762x54mmR", 3]]],
              [(["assHMG"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["assHMG"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _at = [[(["at"] call rhsAFRF_fnc_uniform), []],
               [(["at"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
               [(["at"] call rhsAFRF_fnc_backpack), [["rhs_rpg7_PG7VR_mag", 3]]],
               [(["at"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
               ["rhs_weap_rpg7", []],
               ["", []],
               (["at"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _assAT = [[(["assAT"] call rhsAFRF_fnc_uniform), []],
              [(["assAT"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["assAT"] call rhsAFRF_fnc_backpack), [["rhs_rpg7_PG7VR_mag", 3]]],
              [(["assAT"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["assAT"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _sniper = [[(["sniper"] call rhsAFRF_fnc_uniform), []],
              [(["sniper"] call rhsAFRF_fnc_vest), [["rhs_10Rnd_762x54mmR_7N1", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["sniper"] call rhsAFRF_fnc_backpack), []],
              [(["sniper"] call rhsAFRF_fnc_primWeap), ["rhs_acc_pso1m21"]],
              ["", []],
              ["", []],
              (["sniper"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _marksman = [[(["marksman"] call rhsAFRF_fnc_uniform), []],
               [(["marksman"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
               [(["marksman"] call rhsAFRF_fnc_backpack), []],
               [(["marksman"] call rhsAFRF_fnc_primWeap), ["rhs_acc_uuk", "rhs_acc_perst1ik_ris", "rhs_acc_1p78", "rhs_acc_grip_ffg2"]],
               ["", []],
               ["", []],
               (["marksman"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _repair = [[(["repair"] call rhsAFRF_fnc_uniform), []],
              [(["repair"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["repair"] call rhsAFRF_fnc_backpack), []],
              [(["repair"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["repair"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _demo = [[(["demo"] call rhsAFRF_fnc_uniform), []],
              [(["demo"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["demo"] call rhsAFRF_fnc_backpack), []],
              [(["demo"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["demo"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _engineer = [[(["engineer"] call rhsAFRF_fnc_uniform), []],
              [(["engineer"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["engineer"] call rhsAFRF_fnc_backpack), []],
              [(["engineer"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["engineer"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _grenadier = [[(["grenadier"] call rhsAFRF_fnc_uniform), []],
              [(["grenadier"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["grenadier"] call rhsAFRF_fnc_backpack), [["rhs_VOG25", 20]]],
              [(["grenadier"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["grenadier"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _rifleman = [[(["rifleman"] call rhsAFRF_fnc_uniform), []],
              [(["rifleman"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["rifleman"] call rhsAFRF_fnc_backpack), []],
              [(["rifleman"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["rifleman"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _jtac = [[(["jtac"] call rhsAFRF_fnc_uniform), []],
              [(["jtac"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["jtac"] call rhsAFRF_fnc_backpack), []],
              [(["jtac"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["jtac"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _hPilot = [[(["hPilot"] call rhsAFRF_fnc_uniform), []],
              [(["hPilot"] call rhsAFRF_fnc_vest), []],
              [(["hPilot"] call rhsAFRF_fnc_backpack), []],
              [(["hPilot"] call rhsAFRF_fnc_primWeap), []],
              ["", []],
              ["", []],
              (["hPilot"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _jPilot = [[(["jPilot"] call rhsAFRF_fnc_uniform), []],
              [(["jPilot"] call rhsAFRF_fnc_vest), []],
              [(["jPilot"] call rhsAFRF_fnc_backpack), []],
              [(["jPilot"] call rhsAFRF_fnc_primWeap), []],
              ["", []],
              ["", []],
              (["jPilot"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _crew = [[(["crew"] call rhsAFRF_fnc_uniform), []],
              [(["crew"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["crew"] call rhsAFRF_fnc_backpack), []],
              [(["crew"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["crew"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _mortar = [[(["mortar"] call rhsAFRF_fnc_uniform), []],
              [(["mortar"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["mortar"] call rhsAFRF_fnc_backpack), []],
              [(["mortar"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["mortar"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _uavopp = [[(["uavopp"] call rhsAFRF_fnc_uniform), []],
              [(["uavopp"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["uavopp"] call rhsAFRF_fnc_backpack), []],
              [(["uavopp"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["uavopp"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _spotter = [[(["spotter"] call rhsAFRF_fnc_uniform), []],
              [(["spotter"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 4]]],
              [(["spotter"] call rhsAFRF_fnc_backpack), []],
              [(["spotter"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              ["", []],
              (["spotter"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];

_out set [RL_AFRF, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _crew,
                 _mortar, _uavopp, _spotter]];

//------------------------------------------------------------ Role Loadout RHS AFRF

BALO_AFRF = RL_AFRF + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_AFRF, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ FINITO, return

_out
