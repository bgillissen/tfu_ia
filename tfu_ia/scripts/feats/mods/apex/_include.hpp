/*
@filename: mods\apex\include.hpp
Author:
	Ben
Description:
	Run once by server and players.
	define apex assets
*/

#define APEX_INC

//------------------------------------------------------------ BLUFOR ASSETS

#define AB_backpacks []
#define AB_weapons []
#define AB_ammo []
#define AB_items []

//------------------------------------------------------------ OPFOR ASSETS

#define AO_backpacks []
#define AO_weapons []
#define AO_ammo []
#define AO_items []

//------------------------------------------------------------ COMMON ASSETS

#define APEX_backpacks []
#define APEX_weapons []
#define APEX_ammo []
#define APEX_items []

//------------------------------------------------------------ GEAR RESTRICTIONS

#define APEX_restricted_launcher []
#define APEX_restricted_MG []
#define APEX_restricted_mRifle []
#define APEX_restricted_mScope []
#define APEX_restricted_sRifle []
#define APEX_restricted_sScope []
#define APEX_restricted_oScope []

//------------------------------------------------------------ BLUFOR CARGO
						 
#define AB_cargoBackpacks []
#define AB_cargoWeapons []
#define AB_cargoAmmo []]
#define AB_cargoItems []

//------------------------------------------------------------ OPFOR CARGO

#define AO_cargoBackpacks []
#define AO_cargoWeapons []
#define AO_cargoAmmo []
#define AO_cargoItems []

//------------------------------------------------------------ COMMON CARGO
						 
#define APEX_cargoBackpacks []
#define APEX_cargoWeapons []
#define APEX_cargoAmmo [["SatchelCharge_Remote_Mag", 5],\
						["DemoCharge_Remote_Mag", 10]]
#define APEX_cargoItems [["Laserdesignator", 5],\
						 ["Laserbatteries", 5],\
						 ["MineDetector", 5],\
						 ["NVGoggles", 5],\
						 ["FirstAidKit", 20],\
						 ["Medikit", 3],\
						 ["ToolKit", 3]]

//------------------------------------------------------------ VEHICLE EXCEPTION

#define APEX_exception_heli []
#define APEX_exception_plane []
#define APEX_exception_tank []

//------------------------------------------------------------ UAV

#define APEX_UAV ["B_UAV_02_CAS_F", "B_UAV_02_F", "B_UGV_01_F", "B_UGV_01_rcws_F"]

//------------------------------------------------------------ UNITS CLASSES

#define APEX_pilot []
#define APEX_crew []
#define APEX_mg []
#define APEX_at []
#define APEX_marksman []
#define APEX_sniper []
#define APEX_medic ["B_medic_F", "B_recon_medic_F", "B_G_medic_F", "O_medic_F", "I_medic_F", "O_recon_medic_f"]
#define APEX_officer []
#define APEX_arti []

//------------------------------------------------------------ SUPPLY DROP

#define APEX_supplyDrop []
#define APEX_supplyCrates []

//------------------------------------------------------------ BLUFOR REWARDS

#define AB_rewards = []

//------------------------------------------------------------ OPFOR REWARDS

#define AO_rewards = []

//------------------------------------------------------------ IA RadioTowers

#define APEX_RT ["Land_TTowerBig_2_F"]

//------------------------------------------------------------ BLUFOR IA Units

#define AB_pilot []
#define AB_crew []
#define AB_cas []
#define AB_patrolGroups []
#define AB_sniperGroups []
#define AB_aaTank []
#define AB_arti []
#define AB_static []
#define AB_tank []
#define AB_apc []
#define AB_car []
#define AB_airPatrol []
#define AB_garrison []

//------------------------------------------------------------ OPFOR IA Units

#define AO_pilot []
#define AO_crew []
#define AO_cas []
#define AO_patrolGroups []
#define AO_sniperGroups []
#define AO_aaTank []
#define AO_arti []
#define AO_static []
#define AO_tank []
#define AO_apc []
#define AO_car []
#define AO_airPatrol []
#define AO_garrison []
