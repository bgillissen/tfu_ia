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

private _backpacks = ["rhsusf_assault_eagleaiii_coy",
                      "rhsusf_assault_eagleaiii_ocp",
                      "rhsusf_assault_eagleaiii_ucp",
                      "rhsusf_falconii"];
/*
private _items = ["lerca_1200_black",
                  "lerca_1200_tan",
                  "rhsusf_ANPVS_15",
                  "rhsusf_ANPVS_14",
                  "rhsusf_ANVIS",
                  "rhsusf_acc_harris_bipod",
                  "rhsusf_acc_grip1",
                  "rhsusf_acc_grip2",
                  "rhs_acc_at4_handler",
                  "rhsusf_acc_anpeq15A",
                  "rhsusf_acc_anpeq15",
                  "rhsusf_acc_anpeq15_light",
                  "rhsusf_acc_M2010S",
                  "rhsusf_acc_anpeq15side",
                  "rhsusf_acc_SR25S",
                  "rhsusf_acc_rotex5_grey",
                  "rhsusf_acc_rotex5_tan",
                  "rhsusf_acc_nt4_black",
                  "rhsusf_acc_nt4_tan",
                  "rhsusf_acc_muzzleFlash_SF",
                  "rhsusf_acc_SF3P556",
                  "rhsusf_acc_SFMB556",
                  "rhsusf_acc_compm4",
                  "rhsusf_acc_eotech_552",
                  "rhsusf_acc_LEUPOLDMK4",
                  "rhsusf_acc_M2A1",
                  "rhsusf_acc_EOTECH",
                  "rhsusf_acc_LEUPOLDMK4_2",
                  "rhsusf_acc_ACOG3_USMC",
                  "rhsusf_acc_ACOG2_USMC",
                  "rhsusf_acc_ACOG_USMC",
                  "rhsusf_acc_ACOG3",
                  "rhsusf_acc_ACOG2",
                  "rhsusf_acc_ACOG_pip",
                  "rhsusf_acc_ACOG_sa",
                  "rhsusf_acc_ACOG_d",
                  "rhsusf_acc_ACOG_wd",
                  "rhsusf_acc_ACOG",
                  "rhsusf_acc_ELCAN",
                  "rhsusf_acc_ELCAN_pip",
                  "rhsusf_acc_rotex5_grey",
                  "rhsusf_acc_rotex5_tan",
                  "rhsusf_acc_SFMB556",
                  "rhs_weap_optic_smaw",
                  "rhsusf_acc_SR25S",
                  "rhsusf_acc_SpecterDR",
                  "rhsusf_acc_SpecterDR_3d",
                  "rhsusf_acc_SpecterDR_A",
                  "rhsusf_acc_SpecterDR_A_3d",
                  "rhsusf_acc_SpecterDR_CX_3D",
                  "rhsusf_acc_SpecterDR_D",
                  "rhsusf_acc_SpecterDR_D_3D",
                  "rhsusf_acc_SpecterDR_OD",
                  "rhsusf_acc_SpecterDR_OD_3D",
                  "rhsusf_acc_SpecterDR_pvs27",
                  "rhsusf_acc_premier",
                  "rhsusf_acc_premier_anpvs27",
                  "rhsusf_acc_premier_low",
                  "rhsusf_acc_anpeq15_bk",
                  "rhsusf_acc_anpeq15_bk_light",
                  "rhsusf_acc_anpeq15_bk_top",
                  "rhsusf_acc_ACOG_anpvs27",
                  
                  
                  "rhs_uniform_FROG01_d",
                  "rhs_uniform_FROG01_m81",
                  "rhs_uniform_FROG01_wd",
                  "rhs_uniform_cu_ocp",
                  "rhs_uniform_cu_ocp_101st",
                  "rhs_uniform_cu_ocp_10th",
                  "rhs_uniform_cu_ocp_1stcav",
                  "rhs_uniform_cu_ocp_82nd",
                  "rhs_uniform_cu_ucp",
                  "rhs_uniform_cu_ucp_101st",
                  "rhs_uniform_cu_ucp_10th",
                  "rhs_uniform_cu_ucp_1stcav",
                  "rhs_uniform_cu_ucp_82nd",
                  
                  "rhs_uniform_g3_mc",
                  "rhs_uniform_g3_blk",
                  "rhs_uniform_g3_m81",
                  "rhs_uniform_g3_tan",
                  "rhs_uniform_g3_rgr",
                  
                  "rhsusf_iotv_ocp",
                  "rhsusf_iotv_ocp_Grenadier",
                  "rhsusf_iotv_ocp_Medic",
                  "rhsusf_iotv_ocp_Repair",
                  "rhsusf_iotv_ocp_Rifleman",
                  "rhsusf_iotv_ocp_SAW",
                  "rhsusf_iotv_ocp_Squadleader",
                  "rhsusf_iotv_ocp_Teamleader",
                  "rhsusf_iotv_ucp",
                  "rhsusf_iotv_ucp_Grenadier",
                  "rhsusf_iotv_ucp_Medic",
                  "rhsusf_iotv_ucp_Repair",
                  "rhsusf_iotv_ucp_Rifleman",
                  "rhsusf_iotv_ucp_SAW",
                  "rhsusf_iotv_ucp_Squadleader",
                  "rhsusf_iotv_ucp_Teamleader",
                  "rhsusf_spc",
                  "rhsusf_spc_corpsman",
                  "rhsusf_spc_crewman",
                  "rhsusf_spc_iar",
                  "rhsusf_spc_light",
                  "rhsusf_spc_marksman",
                  "rhsusf_spc_mg",
                  "rhsusf_spc_rifleman",
                  "rhsusf_spc_squadleader",
                  "rhsusf_spc_teamleader",
                  "rhs_Booniehat_m81",
                  "rhs_Booniehat_marpatd",
                  "rhs_Booniehat_marpatwd",
                  "rhs_Booniehat_ocp",
                  "rhs_Booniehat_ucp",
                  "rhsusf_Bowman",
                  "rhsusf_ach_bare",
                  "rhsusf_ach_bare_des",
                  "rhsusf_ach_bare_des_ess",
                  "rhsusf_ach_bare_des_headset",
                  "rhsusf_ach_bare_des_headset_ess",
                  "rhsusf_ach_bare_ess",
                  "rhsusf_ach_bare_headset",
                  "rhsusf_ach_bare_headset_ess",
                  "rhsusf_ach_bare_semi",
                  "rhsusf_ach_bare_semi_ess",
                  "rhsusf_ach_bare_semi_headset",
                  "rhsusf_ach_bare_semi_headset_ess",
                  "rhsusf_ach_bare_tan",
                  "rhsusf_ach_bare_tan_ess",
                  "rhsusf_ach_bare_tan_headset",
                  "rhsusf_ach_bare_tan_headset_ess",
                  "rhsusf_ach_bare_wood",
                  "rhsusf_ach_bare_wood_ess",
                  "rhsusf_ach_bare_wood_headset",
                  "rhsusf_ach_bare_wood_headset_ess",
                  "rhsusf_ach_helmet_ESS_ocp",
                  "rhsusf_ach_helmet_ESS_ucp",
                  "rhsusf_ach_helmet_M81",
                  "rhsusf_ach_helmet_camo_ocp",
                  "rhsusf_ach_helmet_headset_ess_ocp",
                  "rhsusf_ach_helmet_headset_ess_ucp",
                  "rhsusf_ach_helmet_headset_ocp",
                  "rhsusf_ach_helmet_headset_ucp",
                  "rhsusf_ach_helmet_ocp",
                  "rhsusf_ach_helmet_ocp_norotos",
                  "rhsusf_ach_helmet_ucp",
                  "rhsusf_ach_helmet_ucp_norotos",
                  "rhsusf_bowman_cap",
                  "rhsusf_lwh_helmet_M1942",
                  "rhsusf_lwh_helmet_marpatd",
                  "rhsusf_lwh_helmet_marpatd_ess",
                  "rhsusf_lwh_helmet_marpatd_headset",
                  "rhsusf_lwh_helmet_marpatwd",
                  "rhsusf_lwh_helmet_marpatwd_ess",
                  "rhsusf_lwh_helmet_marpatwd_headset",
                  "rhsusf_mich_bare",
                  "rhsusf_mich_bare_alt",
                  "rhsusf_mich_bare_alt_semi",
                  "rhsusf_mich_bare_alt_tan",
                  "rhsusf_mich_bare_headset",
                  "rhsusf_mich_bare_norotos",
                  "rhsusf_mich_bare_norotos_alt",
                  "rhsusf_mich_bare_norotos_alt_headset",
                  "rhsusf_mich_bare_norotos_alt_semi",
                  "rhsusf_mich_bare_norotos_alt_semi_headset",
                  "rhsusf_mich_bare_norotos_alt_tan",
                  "rhsusf_mich_bare_norotos_alt_tan_headset",
                  "rhsusf_mich_bare_norotos_arc",
                  "rhsusf_mich_bare_norotos_arc_alt",
                  "rhsusf_mich_bare_norotos_arc_alt_headset",
                  "rhsusf_mich_bare_norotos_arc_alt_semi",
                  "rhsusf_mich_bare_norotos_arc_alt_semi_headset",
                  "rhsusf_mich_bare_norotos_arc_alt_tan",
                  "rhsusf_mich_bare_norotos_arc_alt_tan_headset",
                  "rhsusf_mich_bare_norotos_arc_headset",
                  "rhsusf_mich_bare_norotos_arc_semi",
                  "rhsusf_mich_bare_norotos_arc_semi_headset",
                  "rhsusf_mich_bare_norotos_arc_tan",
                  "rhsusf_mich_bare_norotos_headset",
                  "rhsusf_mich_bare_norotos_semi",
                  "rhsusf_mich_bare_norotos_semi_headset",
                  "rhsusf_mich_bare_norotos_tan",
                  "rhsusf_mich_bare_norotos_tan_headset",
                  "rhsusf_mich_bare_semi",
                  "rhsusf_mich_bare_semi_headset",
                  "rhsusf_mich_bare_tan",
                  "rhsusf_mich_bare_tan_headset",
                  "rhsusf_mich_helmet_marpatdItemMap",
                  "rhsusf_mich_helmet_marpatd_altItemMap",
                  "rhsusf_mich_helmet_marpatd_alt_headset",
                  "rhsusf_mich_helmet_marpatd_headset",
                  "rhsusf_mich_helmet_marpatd_norotos",
                  "rhsusf_mich_helmet_marpatd_norotos_arc",
                  "rhsusf_mich_helmet_marpatd_norotos_arc_headset",
                  "rhsusf_mich_helmet_marpatd_norotos_headset",
                  "rhsusf_mich_helmet_marpatwd",
                  "rhsusf_mich_helmet_marpatwd_alt",
                  "rhsusf_mich_helmet_marpatwd_alt_headset",
                  "rhsusf_mich_helmet_marpatwd_headset",
                  "rhsusf_mich_helmet_marpatwd_norotos",
                  "rhsusf_mich_helmet_marpatwd_norotos_arc",
                  "rhsusf_mich_helmet_marpatwd_norotos_arc_headset",
                  "rhsusf_mich_helmet_marpatwd_norotos_headset",
                  "rhsusf_opscore_bk",
                  "rhsusf_opscore_coy_cover",
                  "rhsusf_opscore_coy_cover_pelt",
                  "rhsusf_opscore_fg",
                  "rhsusf_opscore_mc_cover",
                  "rhsusf_opscore_mc_cover_pelt",
                  "rhsusf_opscore_rg_cover",
                  "rhsusf_opscore_rg_cover_pelt",
                  "rhsusf_opscore_ut"];
*/
private _items = ["RHS_USAF"] call rhs_fnc_getItems;
private _weapons = ["RHS_USAF"] call rhs_fnc_getWeapons;

private _ammo = ["RHS_USAF"] call rhs_fnc_getMagazines;
		_ammo append ["rhs_m136_hedp_mag", 
		              "rhs_m136_hp_mag", 
		              "rhs_m136_mag",
		              "rhs_m72a7_mag"]; //single shot launcher ammo, those are needed but got scope=1 :(

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