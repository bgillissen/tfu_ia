/*
@filename: feats\mods\rhsAFRF\assets.sqf
Author:
	Ben
Description:
run on server,
	called by feats\mods\rhsAFRF\init.sqf
	return the RHS AFRF assets
*/

private _out = [];

//------------------------------------------------------------ Arsenal RHS AFRF

A_AFRF = 0;

private _backpacks = ["RHS_AFRF"] call rhs_fnc_getBackpacks;
private _items = ["RHS_AFRF"] call rhs_fnc_getItems;
private _weapons = ["RHS_AFRF"] call rhs_fnc_getWeapons;
private _ammo = ["RHS_AFRF"] call rhs_fnc_getMagazines;
		_ammo append ["rhs_rpg26_mag", "rhs_rshg2_mag", "rhs_mag_9x19_17", "rhs_mag_9x18_8_57N181S", "rhs_mag_9x18_12_57N181S"];

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

private _heli = [];
private _plane = [];
private _tank = [];

_out set [AV_AFRF, [_heli, _plane, _tank]];

//------------------------------------------------------------ supplyDrop RHS AFRF

SD_AFRF = AV_AFRF + 1;

private _backpacks = [];
private _items = [];
private _weapons = [];
private _ammo = [];
private _crates = [];
private _vehicles = ["RHS_Mi8_base"];

_out set [SD_AFRF, [_backpacks, _items, _weapons, _ammo, _crates, _vehicles]];

//------------------------------------------------------------ Rewards RHS AFRF

R_AFRF = SD_AFRF + 1;

private _rewards = [];

_out set [R_AFRF, _rewards];

//------------------------------------------------------------ Spawn RHS AFRF

S_AFRF = R_AFRF + 1;

private _rt = ["rhs_p37", "rhs_prv13"];
private _crates = [];
private _pGroups = [["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry"],
                    ["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry_emr"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_flora"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_mflora"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_recon"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry_recon"]];
private _sGroups = [["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry", "rhs_group_rus_msv_infantry_squad_mg_sniper"],
                    ["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry", "rhs_group_rus_msv_infantry_squad_sniper"],
                    ["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry_emr", "rhs_group_rus_msv_infantry_emr_squad_mg_sniper"],
                    ["East", "rhs_faction_msv", "rhs_group_rus_msv_infantry_emr", "rhs_group_rus_msv_infantry_emr_squad_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry", "rhs_group_rus_vdv_infantry_squad_mg_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry", "rhs_group_rus_vdv_infantry_squad_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_flora", "rhs_group_rus_vdv_infantry_flora_squad_mg_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_flora", "rhs_group_rus_vdv_infantry_flora_squad_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_mflora", "rhs_group_rus_vdv_infantry_mflora_squad_mg_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_mflora", "rhs_group_rus_vdv_infantry_mflora_squad_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_recon", "rhs_group_rus_vdv_infantry_recon_squad_mg_sniper"],
                    ["East", "rhs_faction_vdv", "rhs_group_rus_vdv_infantry_recon", "rhs_group_rus_vdv_infantry_recon_squad_sniper"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry", "rhs_group_rus_vmf_infantry_squad_mg_sniper"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry", "rhs_group_rus_vmf_infantry_squad_sniper"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry_recon", "rhs_group_rus_vmf_infantry_recon_squad_mg_sniper"],
                    ["East", "rhs_faction_vmf", "rhs_group_rus_vmf_infantry_recon", "rhs_group_rus_vmf_infantry_recon_squad_sniper"]];
private _pilot = ["rhs_pilot_combat_heli"];
private _crew = ["rhs_msv_emr_combatcrew"];
private _officer = ["rhs_msv_emr_officer"];
private _garrison = ["rhs_msv_emr_grenadier", "rhs_msv_emr_machinegunner"];
private _aa = ["rhs_zsu234_aa", "rhs_gaz66_zu23_vdv", "RHS_Ural_Zu23_VDV_01"];
private _arti = ["rhs_2s3_tv", "RHS_BM21_VDV_01"];
private _static = ["RHS_AFRF", nil, "StaticWeapon", true] call rhs_fnc_getVehicles;
private _cas = ["RHS_AFRF", nil, "O_Plane_CAS_02_F", true] call rhs_fnc_getVehicles;
private _tank = ["RHS_AFRF", nil, ["rhs_a3spruttank_base", "rhs_tank_base", "rhs_a3t72tank_base"], true] call rhs_fnc_getVehicles;
private _apc = ["RHS_AFRF", nil, ["rhs_bmp1tank_base", "rhs_bmd_base"], true] call rhs_fnc_getVehicles;
private _car = ["RHS_AFRF", nil, ["Offroad_01_base_F", "MRAP_02_base_F"], false] call rhs_fnc_getVehicles;
private _carArmed = ["RHS_AFRF", nil, ["Wheeled_APC_F", "Offroad_01_base_F", "MRAP_02_base_F"], true] call rhs_fnc_getVehicles;
private _aPatrol = ["RHS_AFRF", nil, "Heli_Attack_02_base_F"] call rhs_fnc_getVehicles;
private _civ = [];

_out set [S_AFRF, [_rt, _crates, _pGroups, _sGroups, _pilot, _crew, _officer, _garrison, _civ,
                _aa, _arti, _static, _cas, _tank, _apc, _car, _carArmed, _aPatrol]];

//------------------------------------------------------------ Vehicles RHS AFRF

BV_AFRF = S_AFRF + 1;

//private _car = [];
//private _carArmed = [];
//private _apc = [];
//private _tank = [];
//private _aaTank = [];
//private _planeCAS = [];
private _planeAA = [];
private _planeTransport = [];
private _uav = ["rhs_pchela1t_vvs", "rhs_pchela1t_vvsc"];
private _heliSmall = [];
private _heliSmallArmed = [];
private _heliMedium = ["rhs_ka60_c", "rhs_ka60_grey"];
private _heliMedEvac = [];
private _heliBig = ["RHS_AFRF", nil, "RHS_Mi8_base"] call rhs_fnc_getVehicles;
private _heliAttack = ["RHS_AFRF", nil, "Heli_Attack_02_base_F"] call rhs_fnc_getVehicles;
private _boatSmall = [];
private _boatAttack = [];
private _boatBig = [];
private _sub = [];
private _landMedic = ["rhs_gaz66_ap2_vdv"];
private _repair = ["rhs_gaz66_repair_vdv"];
private _fuel = ["RHS_Ural_Fuel_MSV_01"];
private _ammo = ["rhs_gaz66_ammo_msv"];
private _quad = [];

_out set [BV_AFRF, [_car, _carArmed, _apc, _tank, _aa, _cas, _planeAA, _planeTransport, _uav,
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
private _sl = [[(["sl"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["sl"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2], ["rhs_VOG25", 6]]],
              [(["sl"] call rhsAFRF_fnc_backpack), []],
              [(["sl"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["sl"] call rhsAFRF_fnc_handWeap), []],
              (["sl"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _tl = [[(["tl"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["tl"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2], ["rhs_VOG25", 6]]],
              [(["tl"] call rhsAFRF_fnc_backpack), []],
              [(["tl"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["tl"] call rhsAFRF_fnc_handWeap), []],
              (["tl"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _medic = [[(["medic"] call rhsAFRF_fnc_uniform), [["rhs_mag_rdg2_white", 3], ["rhs_mag_9x19_17", 1]]],
              [(["medic"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["medic"] call rhsAFRF_fnc_backpack), []],
              [(["medic"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["medic"] call rhsAFRF_fnc_handWeap), []],
              (["medic"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _lmg = [[(["lmg"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["lmg"] call rhsAFRF_fnc_vest), [["rhs_100Rnd_762x54mmR", 2], ["rhs_mag_rdg2_white", 2]]],
              [(["lmg"] call rhsAFRF_fnc_backpack), [["rhs_100Rnd_762x54mmR", 2]]],
              [(["lmg"] call rhsAFRF_fnc_primWeap), ["rhs_acc_pkas", "rhs_100Rnd_762x54mmR"]],
              ["", []],
              [(["lmg"] call rhsAFRF_fnc_handWeap), []],
              (["lmg"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _hmg = [[(["hmg"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["hmg"] call rhsAFRF_fnc_vest), [["rhs_100Rnd_762x54mmR", 2], ["rhs_mag_rdg2_white", 2]]],
              [(["hmg"] call rhsAFRF_fnc_backpack), [["rhs_100Rnd_762x54mmR", 2]]],
              [(["hmg"] call rhsAFRF_fnc_primWeap), ["rhs_acc_pkas", "rhs_100Rnd_762x54mmR"]],
              ["", []],
              [(["hmg"] call rhsAFRF_fnc_handWeap), []],
              (["hmg"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _assHMG = [[(["assHMG"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["assHMG"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["assHMG"] call rhsAFRF_fnc_backpack), [["rhs_100Rnd_762x54mmR", 3]]],
              [(["assHMG"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["assHMG"] call rhsAFRF_fnc_handWeap), []],
              (["assHMG"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _at = [[(["at"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
               [(["at"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
               [(["at"] call rhsAFRF_fnc_backpack), [["rhs_rpg7_PG7V_mag", 5]]],
               [(["at"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
               ["rhs_weap_rpg7", []],
               [(["at"] call rhsAFRF_fnc_handWeap), []],
               (["at"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _assAT = [[(["assAT"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["assAT"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["assAT"] call rhsAFRF_fnc_backpack), [["rhs_rpg7_PG7V_mag", 5]]],
              [(["assAT"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["assAT"] call rhsAFRF_fnc_handWeap), []],
              (["assAT"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _sniper = [[(["sniper"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["sniper"] call rhsAFRF_fnc_vest), [["rhs_10Rnd_762x54mmR_7N1", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["sniper"] call rhsAFRF_fnc_backpack), []],
              [(["sniper"] call rhsAFRF_fnc_primWeap), ["rhs_acc_pso1m21"]],
              ["", []],
              [(["sniper"] call rhsAFRF_fnc_handWeap), []],
              (["sniper"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _marksman = [[(["marksman"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
               [(["marksman"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
               [(["marksman"] call rhsAFRF_fnc_backpack), []],
               [(["marksman"] call rhsAFRF_fnc_primWeap), ["rhs_acc_uuk", "rhs_acc_perst1ik_ris", "rhs_acc_1p78", "rhs_acc_grip_ffg2"]],
               ["", []],
               [(["marksman"] call rhsAFRF_fnc_handWeap), []],
               (["marksman"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _repair = [[(["repair"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["repair"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["repair"] call rhsAFRF_fnc_backpack), []],
              [(["repair"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["repair"] call rhsAFRF_fnc_handWeap), []],
              (["repair"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _demo = [[(["demo"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["demo"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["demo"] call rhsAFRF_fnc_backpack), []],
              [(["demo"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["demo"] call rhsAFRF_fnc_handWeap), []],
              (["demo"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _engineer = [[(["engineer"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["engineer"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["engineer"] call rhsAFRF_fnc_backpack), []],
              [(["engineer"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["engineer"] call rhsAFRF_fnc_handWeap), []],
              (["engineer"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _grenadier = [[(["grenadier"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["grenadier"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2], ["rhs_VOG25", 6]]],
              [(["grenadier"] call rhsAFRF_fnc_backpack), [["rhs_VOG25", 20]]],
              [(["grenadier"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["grenadier"] call rhsAFRF_fnc_handWeap), []],
              (["grenadier"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _rifleman = [[(["rifleman"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["rifleman"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["rifleman"] call rhsAFRF_fnc_backpack), []],
              [(["rifleman"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["rifleman"] call rhsAFRF_fnc_handWeap), []],
              (["rifleman"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _jtac = [[(["jtac"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["jtac"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["jtac"] call rhsAFRF_fnc_backpack), []],
              [(["jtac"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["jtac"] call rhsAFRF_fnc_handWeap), []],
              (["jtac"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _hPilot = [[(["hPilot"] call rhsAFRF_fnc_uniform), [["rhs_30Rnd_545x39_AK", 1]]],
              [(["hPilot"] call rhsAFRF_fnc_vest), []],
              [(["hPilot"] call rhsAFRF_fnc_backpack), []],
              [(["hPilot"] call rhsAFRF_fnc_primWeap), ["rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["hPilot"] call rhsAFRF_fnc_handWeap), []],
              (["hPilot"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _jPilot = [[(["jPilot"] call rhsAFRF_fnc_uniform), []],
              [(["jPilot"] call rhsAFRF_fnc_vest), []],
              [(["jPilot"] call rhsAFRF_fnc_backpack), []],
              ["", []],
              ["", []],
              [(["jPilot"] call rhsAFRF_fnc_handWeap), []],
              (["jPilot"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _crew = [[(["crew"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["crew"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["crew"] call rhsAFRF_fnc_backpack), []],
              [(["crew"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["crew"] call rhsAFRF_fnc_handWeap), []],
              (["crew"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _mortar = [[(["mortar"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["mortar"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["mortar"] call rhsAFRF_fnc_backpack), []],
              [(["mortar"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["mortar"] call rhsAFRF_fnc_handWeap), []],
              (["mortar"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _uavOp = [[(["uavOp"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["uavOp"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["uavOp"] call rhsAFRF_fnc_backpack), []],
              [(["uavOp"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["uavOp"] call rhsAFRF_fnc_handWeap), []],
              (["uavOp"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];
private _spotter = [[(["spotter"] call rhsAFRF_fnc_uniform), [["rhs_mag_f1", 2], ["rhs_mag_9x19_17", 1]]],
              [(["spotter"] call rhsAFRF_fnc_vest), [["rhs_30Rnd_545x39_AK", 8], ["rhs_mag_rdg2_white", 2]]],
              [(["spotter"] call rhsAFRF_fnc_backpack), []],
              [(["spotter"] call rhsAFRF_fnc_primWeap), ["rhs_acc_dtk3", "rhs_acc_perst1ik", "rhs_acc_rakursPM", "rhs_30Rnd_545x39_AK"]],
              ["", []],
              [(["spotter"] call rhsAFRF_fnc_handWeap), []],
              (["spotter"] call rhsAFRF_fnc_helmet), "", "", "", "", "rhs_pdu4", "rhs_1PN138", "", ""];

_out set [RL_AFRF, [_hq, _sl, _tl, _medic, _lmg, _hmg, _assHMG, _at, _assAT, _sniper, _marksman,
                 _repair, _demo, _engineer, _grenadier, _rifleman, _jtac, _hPilot, _jPilot, _crew,
                 _mortar, _uavOp, _spotter]];

//------------------------------------------------------------ Role Loadout RHS AFRF

BALO_AFRF = RL_AFRF + 1;

private _medic = [];
private _gear = [];
private _support = [];
private _default = [];

_out set [BALO_AFRF, [_medic, _gear, _support, _default]];

//------------------------------------------------------------ FINITO, return

_out
