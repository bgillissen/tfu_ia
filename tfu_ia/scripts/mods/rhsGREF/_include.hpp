/*
@filename: mods\rhsGREF.sqf
Author:
	Ben
Description:
	Run once by server and players.
	define RHS GREF assets
*/

//------------------------------------------------------------ GEAR

#define GREF_backpacks []
#define GREF_weapons []
#define GREF_ammo []
#define GREF_items []

//------------------------------------------------------------ GEAR RESTRICTIONS

#define GREF_restricted_launcher []
#define GREF_restricted_MG []
#define GREF_restricted_mRifle []
#define GREF_restricted_mScope []
#define GREF_restricted_sRifle []
#define GREF_restricted_sScope []
#define GREF_restricted_oScope []

//------------------------------------------------------------ VEHICLE EXCEPTION

#define GREF_exception_heli []
#define GREF_exception_plane []
#define GREF_exception_tank []

//------------------------------------------------------------ CARGO
						 
#define GREF_cargoBackpacks []
#define GREF_cargoWeapons []
#define GREF_cargoAmmo []
#define GREF_cargoItems []

//------------------------------------------------------------ UNIT CLASSES FOR RESTRICTIONS

#define GREF_pilot []
#define GREF_crew ["rhsusf_army_ocp_crewman"]
#define GREF_mg []
#define GREF_at []
#define GREF_marksman []
#define GREF_sniper []
#define GREF_medic []
#define GREF_officer []
#define GREF_arti ["rhsusf_army_ocp_fso",\
			 	  "rhsusf_army_ocp_crewman"]

//------------------------------------------------------------ SUPPLY DROP

#define GREF_supplyDrop []
#define GREF_supplyCrates []

//------------------------------------------------------------ REWARDS

#define GREF_rewards []

//------------------------------------------------------------ IA RadioTowers

#define GREF_RT []
						
//------------------------------------------------------------ IA Units

#define GREF_pilot []
#define GREF_crew []
#define GREF_cas []
#define GREF_patrolGroups [["configFile", "CfgGroups", "West", ""]]
#define GREF_sniperGroups [["configFile", "CfgGroups", "West", ""]]
#define GREF_arti []						
#define GREF_aaTank []
#define GREF_static []
#define GREF_tank []
#define GREF_apc []
#define GREF_car []
#define GREF_airPatrol []
#define GREF_garrison []
