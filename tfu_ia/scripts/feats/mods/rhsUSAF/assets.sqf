/*
@filename: feats\mods\rhsUSAF\_include.hpp
Author:
	Ben
Description:
	run on server
	define RHS USAF assets
*/

#define USAF_INC

//------------------------------------------------------------ GEAR

#define USAF_backpacks []
#define USAF_weapons []
#define USAF_ammo []
#define USAF_items []

//------------------------------------------------------------ GEAR RESTRICTIONS

#define USAF_restricted_launcher []
#define USAF_restricted_MG []
#define USAF_restricted_mRifle []
#define USAF_restricted_mScope []
#define USAF_restricted_sRifle []
#define USAF_restricted_sScope []
#define USAF_restricted_oScope []

//------------------------------------------------------------ CARGO
						 
#define USAF_cargoBackpacks []

#define USAF_cargoWeapons [["rhs_weap_M136", 5],\
						   ["rhs_weap_M136_hedp", 5],\
						   ["rhs_weap_M136_hp", 5],\
						   ["rhs_weap_m4a1_blockII", 3]]

#define USAF_cargoAmmo [["rhsusf_100Rnd_762x51_m62_tracer", 15],\
						["rhsusf_100Rnd_556x45_M200_soft_pouch", 15],\
						["rhs_fim92_mag", 3],\
						["rhs_fgm148_magazine_AT", 3],\
						["rhsusf_mag_10Rnd_STD_50BMG_M33", 40],\
						["rhs_mag_M441_HE", 20],\
						["rhs_mag_an_m8hc", 40]]

#define USAF_cargoItems []
//------------------------------------------------------------ VEHICLE EXCEPTION

#define USAF_exception_heli []
#define USAF_exception_plane []
#define USAF_exception_tank []

//------------------------------------------------------------ SUPPLY DROP

#define USAF_supplyDrop ["RHS_UH60M",\ 
						 "RHS_CH_47F_10",\ 
						 "rhsusf_CH53E_USMC_D",\ 
						 "RHS_C130J"]

#define USAF_supplyCrates ["rhsusf_mags_crate"]

//------------------------------------------------------------ REWARDS

#define USAF_rewards []

//------------------------------------------------------------ IA RadioTowers

#define USAF_RT []
						
//------------------------------------------------------------ IA Units

#define USAF_pilot []
#define USAF_crew []
#define USAF_cas []
#define USAF_patrolGroups [["configFile", "CfgGroups", "West", ""]]
#define USAF_sniperGroups [["configFile", "CfgGroups", "West", ""]]
#define USAF_arti []						
#define USAF_aaTank []
#define USAF_static []
#define USAF_tank []
#define USAF_apc []
#define USAF_car []
#define USAF_airPatrol []
#define USAF_garrison []
						
//------------------------------------------------------------ LOADOUTS

#define USAF_LO_hq [["uniform", ["inUniform1", "inUniform2"]],
				    ["vest", ["inVest1", "inVest2"]],
                    ["backpack", ["inBackpack1", "inBackpack2"]],
                    ["sideArm", "sideArmSuppressor", "sideArmOptic"],
                    ["weapon", "weaponSuppressor", "weaponOptic", "weaponHandle", "weaponAcc"],
                    ["launcher", "launcherOptic"],
                    "helmet", "comm", "terminal", "bino", "nv"];
#define USAF_LO_sl []
#define USAF_LO_tl []
#define USAF_LO_medic[]
#define USAF_LO_lmg []
#define USAF_LO_assLMG []
#define USAF_LO_hmg []
#define USAF_LO_assHMG []
#define USAF_LO_at []
#define USAF_LO_assAT []
#define USAF_LO_sniper []
#define USAF_LO_marksman []


