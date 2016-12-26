/*
@filename: feats\mods\vanilla\_include.hpp
Author:
	Ben
Description:
	included by feats\mods\serverPreInit.sqf
	define Vanilla assets
*/

#define VANILLE_INC

//------------------------------------------------------------ Arsenal Vanilla BLUFOR

#define AVB_backpacks []
#define AVB_weapons []
#define AVB_ammo []
#define AVB_items []

//------------------------------------------------------------ Arsenal Vanilla OPFOR

#define AVO_backpacks []
#define AVO_weapons []
#define AVO_ammo []
#define AVO_items []

//------------------------------------------------------------ Arsenal Vanilla (common)

#define AV_backpacks []
#define AV_weapons []
#define AV_ammo []
#define AV_items []

//------------------------------------------------------------ Restricted Gear Vanilla BLUFOR

#define RGVB_launcher []
#define RGVB_mg []
#define RGVB_sRifle []
#define RGVB_mRifle []
#define RGVB_sScope []
#define RGVB_mScope []
#define RGVB_oScope []
#define RGVB_backpack []

//------------------------------------------------------------ Restricted Gear Vanilla OPFOR

#define RGVO_launcher []
#define RGVO_mg []
#define RGVO_sRifle []
#define RGVO_mRifle []
#define RGVO_sScope []
#define RGVO_mScope []
#define RGVO_oScope []
#define RGVO_backpack []

//------------------------------------------------------------ Cargo Vanilla BLUFOR
						 
#define CVB_backpacks []
#define CVB_weapons []
#define CVB_ammo []]
#define CVB_items []

//------------------------------------------------------------ Cargo Vanilla OPFOR

#define CVO_backpacks []
#define CVO_weapons []
#define CVO_ammo []
#define CVO_items []

//------------------------------------------------------------ Cargo Vanilla (common)
						 
#define CV_backpacks []
#define CV_weapons []
#define CV_ammo [["SatchelCharge_Remote_Mag", 5],\
				 ["DemoCharge_Remote_Mag", 10]]
#define CV_items [["Laserdesignator", 5],\
				  ["Laserbatteries", 5],\
				  ["MineDetector", 5],\
				  ["NVGoggles", 5],\
				  ["FirstAidKit", 20],\
				  ["Medikit", 3],\
				  ["ToolKit", 3]]

//------------------------------------------------------------ Allowed Vehicles Vanilla

#define AVV_heli []
#define AVV_plane []
#define AVV_tank []

//------------------------------------------------------------ supplyDrop Vanilla BLUFOR

#define SDVB_backpacks []
#define SDVB_items []
#define SDVB_weapons []
#define SDVB_ammo []

//------------------------------------------------------------ supplyDrop Vanilla OPFOR

#define SDVO_backpacks []
#define SDVO_items []
#define SDVO_weapons []
#define SDVO_ammo []

//------------------------------------------------------------ supplyDrop Vanilla (common)

#define SDV_backpacks []
#define SDV_items []
#define SDV_weapons []
#define SDV_ammo []
#define SDV_crates []

//------------------------------------------------------------ Rewards Vanilla BLUFOR

#define RVB = []

//------------------------------------------------------------ Rewards Vanilla OPFOR

#define RVO = []

//------------------------------------------------------------ RadioTower Vanilla

#define RTV ["Land_TTowerBig_2_F"]

//------------------------------------------------------------ Spawn Vanilla BLUFOR

#define SVB_pilot []
#define SVB_crew []
#define SVB_officer []
#define SVB_cas []
#define SVB_patrolGroups []
#define SVB_sniperGroups []
#define SVB_aaTank []
#define SVB_arti []
#define SVB_static []
#define SVB_tank []
#define SVB_apc []
#define SVB_car []
#define SVB_carAttack []
#define SVB_airPatrol []
#define SVB_garrison []

//------------------------------------------------------------ Spawn Vanilla OPFOR

#define SVO_pilot []
#define SVO_crew []
#define SVO_officer []
#define SVO_cas []
#define SVO_patrolGroups []
#define SVO_sniperGroups []
#define SVO_aaTank []
#define SVO_arti []
#define SVO_static []
#define SVO_tank []
#define SVO_apc []
#define SVO_car []
#define SVO_carAttack []
#define SVO_airPatrol []
#define SVO_garrison []

//------------------------------------------------------------ Spawn Vanilla Crates

#define SV_crates ["Land_CargoBox_V1_F"]

//------------------------------------------------------------ Vehicles Vanilla BLUFOR

#define VVB_car []
#define VVB_carArmed []
#define VVB_apc []
#define VVB_tank []
#define VVB_aaTank []
#define VVB_planeCAS []
#define VVB_planeAA []
#define VVB_planeTransport []
#define VVB_uav ["B_UAV_02_CAS_F", "B_UAV_02_F", "B_UGV_01_F", "B_UGV_01_rcws_F"]
#define VVB_heliSmall []
#define VVB_heliSmallArmed []
#define VVB_heliMedium []
#define VVB_heliMedEvac []
#define VVB_heliBig []
#define VVB_heliAttack []
#define VVB_boatSmall []
#define VVB_boatAttack []
#define VVB_boatBig []
#define VVB_sub []
#define VVB_landMedic []
#define VVB_repair []
#define VVB_fuel []
#define VVB_ammo []
#define VVB_quad []

//------------------------------------------------------------ Vehicles Vanilla OPFOR

#define VVO_car []
#define VVO_carArmed []
#define VVO_apc []
#define VVO_tank []
#define VVO_aaTank []
#define VVO_planeCAS []
#define VVO_planeAA []
#define VVO_planeTransport []
#define VVO_uav []
#define VVO_heliSmall []
#define VVO_heliSmallArmed []
#define VVO_heliMedium []
#define VVO_heliMedEvac []
#define VVO_heliBig []
#define VVO_heliAttack []
#define VVO_boatSmall []
#define VVO_boatAttack []
#define VVO_boatBig []
#define VVO_sub []
#define VVO_landMedic []
#define VVO_repair []
#define VVO_fuel []
#define VVO_ammo []
#define VVO_quad []

//------------------------------------------------------------ Vehicles Cargo Vanilla BLUFOR

#define VCVB_car []
#define VCVB_carArmed []
#define VCVB_apc []
#define VCVB_tank []
#define VCVB_aaTank []
#define VCVB_planeCAS []
#define VCVB_planeAA []
#define VCVB_planeTransport []
#define VCVB_uav []
#define VCVB_heliSmall []
#define VCVB_heliSmallArmed []
#define VCVB_heliMedium []
#define VCVB_heliMedEvac []
#define VCVB_heliBig []
#define VCVB_heliAttack []
#define VCVB_boatSmall []
#define VCVB_boatAttack []
#define VCVB_boatBig []
#define VCVB_sub []
#define VCVB_landMedic []
#define VCVB_repair []
#define VCVB_fuel []
#define VCVB_ammo []
#define VCVB_quad []

//------------------------------------------------------------ Vehicles Cargo Vanilla OPFOR

#define VCVO_car []
#define VCVO_carArmed []
#define VCVO_apc []
#define VCVO_tank []
#define VCVO_aaTank []
#define VCVO_planeCAS []
#define VCVO_planeAA []
#define VCVO_planeTransport []
#define VCVO_uav []
#define VCVO_heliSmall []
#define VCVO_heliSmallArmed []
#define VCVO_heliMedium []
#define VCVO_heliMedEvac []
#define VCVO_heliBig []
#define VCVO_heliAttack []
#define VCVO_boatSmall []
#define VCVO_boatAttack []
#define VCVO_boatBig []
#define VCVO_sub []
#define VCVO_landMedic []
#define VCVO_repair []
#define VCVO_fuel []
#define VCVO_ammo []
#define VCVO_quad []

//------------------------------------------------------------ Vehicles Cargo Vanilla (common)

#define VCV_car []
#define VCV_carArmed []
#define VCV_apc []
#define VCV_tank []
#define VCV_aaTank []
#define VCV_planeCAS []
#define VCV_planeAA []
#define VCV_planeTransport []
#define VCV_uav []
#define VCV_heliSmall []
#define VCV_heliSmallArmed []
#define VCV_heliMedium []
#define VCV_heliMedEvac []
#define VCV_heliBig []
#define VCV_heliAttack []
#define VCV_boatSmall []
#define VCV_boatAttack []
#define VCV_boatBig []
#define VCV_sub []
#define VCV_landMedic []
#define VCV_repair []
#define VCV_fuel []
#define VCV_ammo []
#define VCV_quad []

//------------------------------------------------------------ Role Loadout Vanilla BLUFOR

#define RLVB_hq []
#define RLVB_sl []
#define RLVB_tl []
#define RLVB_medic []
#define RLVB_lmg []
#define RLVB_hmg []
#define RLVB_assHMG []
#define RLVB_at []
#define RLVB_assAT []
#define RLVB_sniper []
#define RLVB_marksman []
#define RLVB_repair []
#define RLVB_demo []
#define RLVB_engineer []
#define RLVB_grenadier []
#define RLVB_rifleman []
#define RLVB_jtac []
#define RLVB_pilot []
#define RLVB_mortar []

//------------------------------------------------------------ Role Loadout Vanilla OPFOR

#define RLVO_hq []
#define RLVO_sl []
#define RLVO_tl []
#define RLVO_medic []
#define RLVO_lmg []
#define RLVO_hmg []
#define RLVO_assHMG []
#define RLVO_at []
#define RLVO_assAT []
#define RLVO_sniper []
#define RLVO_marksman []
#define RLVO_repair []
#define RLVO_demo []
#define RLVO_engineer []
#define RLVO_grenadier []
#define RLVO_rifleman []
#define RLVO_jtac []
#define RLVO_pilot []
#define RLVO_mortar []

