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

/*private _weapons = [ "rhs_weap_XM2010",
                     "rhs_weap_XM2010_d",
                     "rhs_weap_XM2010_wd",
                     "rhs_weap_XM2010_sa",
                     "rhs_weap_m24sws",
                     "rhs_weap_m24sws_blk",
                     "rhs_weap_m24sws_ghillie",
                     "rhs_weap_m4",
                     "rhs_weap_m4_pmag",
                     "rhs_weap_m4_mstock",
                     "rhs_weap_m4_carryhandle",
                     "rhs_weap_m4_carryhandle_pmag",
                     "rhs_weap_m4_carryhandle_mstock",
                     "rhs_weap_m4_m320",
                     "rhs_weap_m4_m203",
                     "rhs_weap_m4_m203S",
                     "rhs_weap_m4a1",
                     "rhs_weap_m4a1_d",
                     "rhs_weap_m4a1_mstock",
                     "rhs_weap_m4a1_d_mstock",
                     "rhs_weap_m4a1_pmag",
                     "rhs_weap_m4a1_carryhandle",
                     "rhs_weap_m4a1_carryhandle_mstock",
                     "rhs_weap_m4a1_carryhandle_pmag",
                     "rhs_weap_m4a1_m203",
                     "rhs_weap_m4a1_m203s",
                     "rhs_weap_m4a1_m203s_wd",
                     "rhs_weap_m4a1_m203s_d",
                     "rhs_weap_m4a1_m203s_sa",
                     "rhs_weap_m4a1_carryhandle_m203",
                     "rhs_weap_m4a1_carryhandle_m203S",
                     "rhs_weap_m4a1_m320",
                     "rhs_weap_m4a1_blockII",
                     "rhs_weap_m4a1_blockII_bk",
                     "rhs_weap_m4a1_blockII_wd",
                     "rhs_weap_m4a1_blockII_d",
                     "rhs_weap_m4a1_blockII_KAC",
                     "rhs_weap_m4a1_blockII_KAC_bk",
                     "rhs_weap_m4a1_blockII_KAC_wd",
                     "rhs_weap_m4a1_blockII_KAC_d",
                     "rhs_weap_m4a1_blockII_M203",
                     "rhs_weap_m4a1_blockII_M203_bk",
                     "rhs_weap_m4a1_blockII_M203_d",
                     "rhs_weap_m4a1_blockII_M203_wd",
                     "rhs_weap_mk18",
                     "rhs_weap_mk18_bk",
                     "rhs_weap_mk18_wd",
                     "rhs_weap_mk18_d",
                     "rhs_weap_mk18_KAC",
                     "rhs_weap_mk18_KAC_bk",
                     "rhs_weap_mk18_KAC_wd",
                     "rhs_weap_mk18_KAC_d",
                     "rhs_weap_mk18_m320",
                     "rhs_weap_m16a4",
                     "rhs_weap_m16a4_pmag",
                     "rhs_weap_m16a4_carryhandle",
                     "rhs_weap_m16a4_carryhandle_pmag",
                     "rhs_weap_m16a4_carryhandle_M203",
                     "rhs_weap_hk416d10",
                     "rhs_weap_hk416d145",
                     "rhs_weap_hk416d10_LMT",
                     "rhs_weap_hk416d10_m320",
                     "rhs_weap_hk416d145_m320",
                     "rhs_weap_m27iar",
                     "rhs_weap_m27iar_grip",
                     "rhs_weap_m249_pip_S",
                     "rhs_weap_m249_pip_S_para",
                     "rhs_weap_m249_pip_S_vfg",
                     "rhs_weap_m249_pip_L",
                     "rhs_weap_m249_pip_L_para",
                     "rhs_weap_m249_pip_L_vfg",
                     "rhs_weap_m240B",
                     "rhs_weap_m240G",
                     "rhs_weap_m240B_CAP",
                     "rhs_weap_m14ebrri",
                     "rhs_weap_sr25",
                     "rhs_weap_sr25_ec",
                     "rhs_weap_sr25_wd",
                     "rhs_weap_sr25_ec_wd",
                     "rhs_weap_sr25_d",
                     "rhs_weap_sr25_ec_d"];*/
private _weapons = ["RHS_USAF"] call rhs_fnc_getWeapons;

private _ammo = ["rhsusf_20Rnd_762x51_m118_special_Mag",
         		 "rhsusf_20Rnd_762x51_m993_Mag",
         		 "30Rnd_556x45_Stanag",
         		 //"30Rnd_556x45_Stanag_Tracer_Green",
         		 "30Rnd_556x45_Stanag_Tracer_Red",
         		 //"30Rnd_556x45_Stanag_Tracer_Yellow",
         		 "rhs_mag_30Rnd_556x45_M855A1_Stanag",
         		 "rhs_mag_30Rnd_556x45_M855A1_Stanag_No_Tracer",
         		 "rhs_mag_30Rnd_556x45_Mk262_Stanag",
         		 "rhs_mag_30Rnd_556x45_Mk318_Stanag",
         		 "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",
                 "rhsusf_5Rnd_300winmag_xm2010",
         		 "10Rnd_RHS_50BMG_Box",
         		 "rhs_200rnd_556x45_M_SAW",
         		 "rhs_200rnd_556x45_T_SAW",
         		 "rhs_200rnd_556x45_B_SAW",
         		 "rhsusf_50Rnd_762x51",
         		 "rhsusf_50Rnd_762x51_m61_ap",
         		 "rhsusf_50Rnd_762x51_m62_tracer",
         		 "rhsusf_50Rnd_762x51_m80a1epr",
         		 "rhsusf_100Rnd_762x51",
         		 "rhsusf_100Rnd_762x51_m61_ap",
         		 "rhsusf_100Rnd_762x51_m62_tracer",
         		 "rhsusf_100Rnd_762x51_m80a1epr",
         		 "rhsusf_50Rnd_762x51_m993",
         		 "rhsusf_100Rnd_762x51_m993",
         		
         		 "rhsusf_100Rnd_556x45_soft_pouch",
         		 "rhsusf_100Rnd_556x45_M200_soft_pouch",
         				
         		 "rhsusf_5Rnd_00Buck",
         		 "rhsusf_8Rnd_00Buck",
         		 "rhsusf_5Rnd_Slug",
         		 "rhsusf_8Rnd_Slug",
         		 //"rhsusf_5Rnd_HE",			//shotgun explosive
         		 //"rhsusf_8Rnd_HE",
         		 //"rhsusf_5Rnd_FRAG",
         		 //"rhsusf_8Rnd_FRAG",
         		 //"rhsusf_5Rnd_doomsday_Buck",
         		 //"rhsusf_8Rnd_doomsday_Buck",
         		 "rhs_m136_mag",
         		 "rhs_m136_hedp_mag",
         		 "rhs_m136_hp_mag",
         		 "rhs_fim92_mag",
         		 "rhs_fgm148_magazine_AT",
         		 "rhs_mag_smaw_HEAA",
         		 "rhs_mag_smaw_HEDP",
         		 "rhs_mag_smaw_SR",
         		 "rhsusf_mag_7x45acp_MHP",
         		 "rhsusf_mag_17Rnd_9x19_FMJ",
         		 "rhsusf_mag_17Rnd_9x19_JHP",
         		 "rhsusf_mag_15Rnd_9x19_FMJ",
         		 "rhsusf_mag_15Rnd_9x19_JHP",
         		 "rhsusf_mag_40Rnd_46x30_JHP",
         		 "rhsusf_mag_40Rnd_46x30_FMJ",
         		 "rhsusf_mag_40Rnd_46x30_AP",
                 
                 "rhs_mag_an_m14_th3",
                 "rhs_mag_an_m8hc",
                 "rhs_mag_m18_green",
                 "rhs_mag_m18_purple",
                 "rhs_mag_m18_red",
                 "rhs_mag_m18_yellow",
                 "rhs_mine_M19_mag",
                 "rhs_mag_m67",
                 "rhs_mag_m69",
                 "rhs_mag_m7a3_cs",
                 "rhs_mag_mk84",
                 "rhs_mag_mk3a2",
                 "rhs_mag_m18_smoke_base",
                 "rhs_mag_m4009",
                 "rhs_mag_M433_HEDP",
                 "rhs_mag_M441_HE",
                 "rhs_mag_m576",
             	 "rhs_mag_M585_white",
                 "rhs_mag_m661_green",
                 "rhs_mag_m662_red",
                 "rhs_mag_m713_Red",
                 "rhs_mag_m714_White",
                 "rhs_mag_m715_Green",
                 "rhs_mag_m716_yellow",
                 "rhsusf_mag_6Rnd_M714_white",
                 "rhsusf_mag_6Rnd_M433_HEDP",
                 "rhsusf_mag_6Rnd_M441_HE",
                 "rhsusf_mag_6Rnd_M781_Practice",
                 "rhsusf_mag_6Rnd_M576_Buckshot",
                 "rhsusf_mag_10Rnd_STD_50BMG_M33",
                 //"rhsusf_mag_10Rnd_STD_50BMG_mk211" //explosive sniper ammo
                 "rhsusf_5Rnd_762x51_m118_special_Mag",
                 "rhsusf_5Rnd_762x51_m993_Mag",
                 "rhsusf_5Rnd_762x51_m62_Mag"];

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