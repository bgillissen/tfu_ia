/*
@filename: mods\rhsUSAF.sqf
Author:
	Ben
Description:
	Run once by server and players.
	define RHS USAF assets we are going to use, roles/gears for restrictions, vehicles rewards/features/restrictions
*/

private ["_backpacks", "_items", "_weapons", "_ammo", "_rewards",
         "_cargoBackpacks", "_cargoWeapons", "_cargoAmmo", "_cargoItems",
         "_iaPilot", "_iaCAS", "_iaSGroup", "_iaArti", "_iaAA", "_iaStatic", "_iaTank", "_iaAPC", "_iaCar", "_iaAir", "_iaGarrison"];

#define MOD_rhsUSAF true;

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

//------------------------------------------------------------ UNIT CLASSES FOR RESTRICTIONS

#define USAF_pilot []
#define USAF_crew ["rhsusf_army_ocp_crewman"]
#define USAF_mg []
#define USAF_at []
#define USAF_marksman []
#define USAF_sniper []
#define USAF_medic []
#define USAF_officer []
#define USAF_arti ["rhsusf_army_ocp_fso",\
			 	  "rhsusf_army_ocp_crewman"]

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

if ( VA_usaf_backpacks ) then { 
	_backpacks append _backpacks; 
	_cargoBackpacks append USAF_cargoBackpacks;
};
if ( VA_usaf_items ) then { 
	_items append AFRF_items;
	_cargoItems append USAF_cargoItems;
};
if ( VA_usaf_weapons ) then { 
	_weapons append USAF_weapons;
	_ammo append USAF_ammo;
	_cargoWeapons append USAF_cargoWeapons;
	_cargoAmmo append USAF_cargoAmmo;
};

if ( REWARD_usaf ) then { _rewards append USAF_rewards; };

if ( IA_spawnUSAF && PLAYER_SIDE == "opfor" ) then {
	_iaPilot = USAF_pilot;
	_iaCrew = USAF_crew;
	_iaCAS = USAF_cas;
	_iaPGroup = USAF_patrolGroup;
	_iaSGroup = USAF_sniperGroup;
	_iaArti = USAF_arti;
	_iaAA = USAF_aaTank;
	_iaStatic = USAF_static;
	_iaTank = USAF_tank;
	_iaAPC = USAF_apc;
	_iaCar = USAF_car;
	_iaAir = USAF_airPatrol;
	_iaGarrison = USAF_garrison;
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
	[USAF_pilot, USAF_crew, USAF_mg, USAF_at, USAF_marksman, USAF_sniper, USAF_medic, USAF_officer, USAF_arti],
	[USAF_exception_heli, USAF_exception_plane, USAF_exception_tank],
	[_backpacks, _items, _weapons, _ammo],
	[_cargoBackpacks, _cargoItems, _cargoWeapons, _cargoAmmo],
	[USAF_supplyDrop, USAF_supplyCrates], _rewards, [], 
	[USAF_RT, _iaPilot, _iaCrew, _iaCAS, _iaPGroup, _iaSGroup, _iaArti, _iaAA, _iaStatic, _iaTank, _iaAPC, _iaCar, _iaAir, _iaGarrison]
] call common_fnc_implentAssets;
