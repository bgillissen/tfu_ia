/*
@filename: mods\rhsAFRF.sqf
Author:
	Ben
Description:
	Run once by server and players.
	define RHS AFRF assets we are going to use, roles/gears for restrictions, vehicles rewards/features/restrictions
*/

private ["_backpacks", "_items", "_weapons", "_ammo", "_rewards",
         "_cargoBackpacks", "_cargoWeapons", "_cargoAmmo", "_cargoItems",
         "_iaPilot", "_iaCAS", "_iaSGroup", "_iaArti", "_iaAA", "_iaStatic", "_iaTank", "_iaAPC", "_iaCar", "_iaAir", "_iaGarrison"];

#define MOD_rhsAFRF true;

//------------------------------------------------------------ GEAR

#define AFRF_backpacks []
#define AFRF_weapons []
#define AFRF_ammo []
#define AFRF_items []

//------------------------------------------------------------ GEAR RESTRICTIONS

#define AFRF_restricted_launcher []
#define AFRF_restricted_MG []
#define AFRF_restricted_mRifle []
#define AFRF_restricted_mScope []
#define AFRF_restricted_sRifle []
#define AFRF_restricted_sScope []
#define AFRF_restricted_oScope []

//------------------------------------------------------------ CARGO
						 
#define AFRF_cargoBackpacks []
#define AFRF_cargoWeapons []
#define AFRF_cargoAmmo []
#define AFRF_cargoItems []

//------------------------------------------------------------ VEHICLE EXCEPTION

#define AFRF_exception_heli []
#define AFRF_exception_plane []
#define AFRF_exception_tank []

//------------------------------------------------------------ UNIT CLASSES FOR RESTRICTIONS

#define AFRF_pilot []
#define AFRF_crew ["rhsusf_army_ocp_crewman"]
#define AFRF_mg []
#define AFRF_at []
#define AFRF_marksman []
#define AFRF_sniper []
#define AFRF_medic []
#define AFRF_officer []
#define AFRF_arti ["rhsusf_army_ocp_fso",\
			 	  "rhsusf_army_ocp_crewman"]

//------------------------------------------------------------ SUPPLY DROP VEHICLES

#define AFRF_supplyDrop []
#define AFRF_supplyCrates []

//------------------------------------------------------------ REWARDS

#define AFRF_rewards []

//------------------------------------------------------------ IA RadioTowers

#define AFRF_RT []
						
//------------------------------------------------------------ IA Units

#define AFRF_pilot ["rhs_pilot_combat_heli"]
#define AFRF_crew ["rhs_msv_emr_combatcrew"]
#define AFRF_cas []
#define AFRF_patrolGroups [["configFile", "CfgGroups", "East", "rhs_faction_msv", "rhs_group_rus_msv_infantry"]]
#define AFRF_sniperGroups [["configFile", "CfgGroups", "East", "rhs_faction_msv", "rhs_group_rus_msv_infantry", "rhs_group_rus_msv_infantry_squad_sniper"]]
#define AFRF_arti []						
#define AFRF_aaTank ["rhs_zsu234_aa"]
#define AFRF_static ["RHS_AGS30_Tripod_MSV","rhs_KORD_MSV","RHS_NSV_Tripod_MSV","rhs_Igla_AA_pod_msv","rhs_D30_vdv","rhs_2b14_82mm_vdv"]
#define AFRF_tank ["rhs_t72bd_tv","rhs_t80","rhs_t90_tv"]
#define AFRF_apc ["rhs_tigr_sts_msv","rhsgref_BRDM2_HQ_msv","rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_bmp1_msv","rhs_bmp1d_msv","rhs_bmp1k_msv","rhs_bmp1p_msv","rhs_bmp3_late_msv"]
#define AFRF_car []
#define AFRF_airPatrol ["RHS_Mi24P_vdv", "RHS_Ka52_vvsc"]
#define AFRF_garrison ["rhsgref_ins_g_machinegunner", "rhsgref_ins_g_rifleman"]
						
//------------------------------------------------------------ IMPLENTING ASSETS

_backpacks = [];
_items = [];
_weapons = [];
_ammo = [];
_cargoBackpacks = [];
_cargoItems = [];
_cargoWeapons = [];
_cargoAmmo = [];
_rewards = [];

if ( VA_afrf_backpacks ) then { 
	_backpacks append AFRF_backpacks; 
	_cargoBackpacks append AFRF_cargoBackpacks;
};
if ( VA_afrf_items ) then {
	_items append AFRF_items; 
	_cargoItems append AFRF_cargoItems;
};
if ( VA_afrf_weapons ) then { 
	_weapons append AFRF_weapons;
	_ammo append AFRF_ammo;
	_cargoWeapons append AFRF_cargoWeapons;
	_cargoAmmo append AFRF_cargoAmmo;
};

if ( REWARD_afrf ) then { _rewards append AFRF_rewards; };

if ( IA_spawnAFRF && PLAYER_SIDE == "blufor" ) then {
	_iaPilot = AFRF_pilot;
	_iaCrew = AFRF_crew;
	_iaCAS = AFRF_cas;
	_iaPGroup = AFRF_patrolGroup;
	_iaSGroup = AFRF_sniperGroup;
	_iaArti = AFRF_arti;
	_iaAA = AFRF_aaTank;
	_iaStatic = AFRF_static;
	_iaTank = AFRF_tank;
	_iaAPC = AFRF_apc;
	_iaCar = AFRF_car;
	_iaAir = AFRF_airPatrol;
	_iaGarrison = AFRF_garrison;
} else {
	_iaPilot = [];
	_iaCrew = [];
	_iaCAS = [];
	_iaPGroup = [];
	_iaSGroup = [];
	_iaArti = [];
	_iaAA = [];
	_iaStatic = [];
	_iaTank = [];
	_iaAPC = [];
	_iaCar = [];
	_iaAir = [];
	_iaGarrison = [];
};		

[
	[AFRF_pilot, AFRF_crew, AFRF_mg, AFRF_at, AFRF_marksman, AFRF_sniper, AFRF_medic, AFRF_officer, AFRF_arti],
	[AFRF_exception_heli, AFRF_exception_plane, AFRF_exception_tank],
	[_backpacks, _items, _weapons, _ammo],
	[_cargoBackpacks, _cargoItems, _cargoWeapons, _cargoAmmo],
	[AFRF_supplyDrop, AFRF_supplyCrates], _rewards, [], 
	[AFRF_RT, _iaPilot, _iaCrew, _iaCAS, _iaPGroup, _iaSGroup, _iaArti, _iaAA, _iaStatic, _iaTank, _iaAPC, _iaCar, _iaAir, _iaGarrison]
] call common_fnc_implentAssets;