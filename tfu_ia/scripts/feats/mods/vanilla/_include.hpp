/*
@filename: mods\vanilla\_include.hpp
Author:
	Ben
Description:
	included by mods\_include.hpp
	Vanilla mod define
*/

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

//------------------------------------------------------------ Restricted Gear Vanilla
//TODO may probably need to split that by side, so players can loot (new param gear_enemyLoot)
#define RGV_launcher []
#define RGV_mg []
#define RGV_sRifle []
#define RGV_mRifle []
#define RGV_sScope []
#define RGV_mScope []
#define RGV_oScope []
#define RGV_backpack []

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

//------------------------------------------------------------ UAV Vanilla

#define UAVV ["B_UAV_02_CAS_F", "B_UAV_02_F", "B_UGV_01_F", "B_UGV_01_rcws_F"]

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
#define SVB_cas []
#define SVB_patrolGroups []
#define SVB_sniperGroups []
#define SVB_aaTank []
#define SVB_arti []
#define SVB_static []
#define SVB_tank []
#define SVB_apc []
#define SVB_car []
#define SVB_airPatrol []
#define SVB_garrison []

//------------------------------------------------------------ Spawn Vanilla OPFOR

#define SVO_pilot []
#define SVO_crew []
#define SVO_cas []
#define SVO_patrolGroups []
#define SVO_sniperGroups []
#define SVO_aaTank []
#define SVO_arti []
#define SVO_static []
#define SVO_tank []
#define SVO_apc []
#define SVO_car []
#define SVO_airPatrol []
#define SVO_garrison []

//------------------------------------------------------------ Base Vehicles Vanilla BLUFOR

#define BVVB_car []
#define BVVB_apc []
#define BVVB_tank []
#define BVVB_planeCAS []
#define BVVB_planeAA []
#define BVVB_planeTransport []
#define BVVB_heliSmall []
#define BVVB_heliMedium []
#define BVVB_heliMedEvac []
#define BVVB_heliBig []
#define BVVB_heliAttack []
#define BVVB_boatSmall []
#define BVVB_boatAttack []
#define BVVB_boatBig []
#define BVVB_repair []
#define BVVB_fuel []
#define BVVB_quad []

//------------------------------------------------------------ Base Vehicles Vanilla OPFOR

#define BVVO_car []
#define BVVO_apc []
#define BVVO_tank []
#define BVVO_planeCAS []
#define BVVO_planeAA []
#define BVVO_planeTransport []
#define BVVO_heliSmall []
#define BVVO_heliMedium []
#define BVVO_heliMedEvac []
#define BVVO_heliBig []
#define BVVO_heliAttack []
#define BVVO_boatSmall []
#define BVVO_boatAttack []
#define BVVO_boatBig []
#define BVVO_repair []
#define BVVO_fuel []
#define BVVO_quad []

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

//------------------------------------------------------------ Base Atmosphere Vanilla BLUFOR

#define BAVB_vehicle []
#define BAVB_npc []
#define BAVB_object []

//------------------------------------------------------------ Base Atmosphere Vanilla BLUFOR

#define BAVO_vehicle []
#define BAVO_npc []
#define BAVO_object []

