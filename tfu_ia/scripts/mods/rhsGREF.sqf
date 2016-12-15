/*
@filename: mods\rhsGREF.sqf
Author:
	Ben
Description:
	Run once by server and players.
	define RHS GREF assets we are going to use, roles/gears for restrictions, vehicles rewards/features/restrictions
*/

private ["_backpacks", "_items", "_weapons", "_ammo", "_rewards",
         "_iaPilot", "_iaCAS", "_iaSGroup", "_iaArti", "_iaAA", "_iaStatic", "_iaTank", "_iaAPC", "_iaCar", "_iaAir", "_iaGarrison"];

#define MOD_rhs true;

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

//------------------------------------------------------------ SUPPLY DROP VEHICLES

#define GREF_supplyDrop ["RHS_UH60M",\ 
						 "RHS_CH_47F_10",\ 
						 "rhsusf_CH53E_USMC_D",\ 
						 "RHS_C130J"]

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
						
//------------------------------------------------------------ IMPLENTING ASSETS

_backpacks = [];
_items = [];
_weapons = [];
_ammo = [];
_rewards = [];

if ( VA_gref_backpacks ) then { _backpacks append _backpacks; };
if ( VA_gref_items ) then { _items append AFRF_items; };
if ( VA_gref_weapons ) then { 
	_weapons append GREF_weapons;
	_ammo append GREF_ammo;
};

if ( REWARD_gref ) then { _rewards append GREF_rewards; };

if ( IA_spawnGREF && IND_ARE_ENEMY ) then {
	_iaPilot = GREF_pilot;
	_iaCrew = GREF_crew;
	_iaCAS = GREF_cas;
	_iaPGroup = GREF_patrolGroup;
	_iaSGroup = GREF_sniperGroup;
	_iaArti = GREF_arti;
	_iaAA = GREF_aaTank;
	_iaStatic = GREF_static;
	_iaTank = GREF_tank;
	_iaAPC = GREF_apc;
	_iaCar = GREF_car;
	_iaAir = GREF_airPatrol;
	_iaGarrison = GREF_garrison;
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
	[GREF_pilot, GREF_crew, GREF_mg, GREF_at, GREF_marksman, GREF_sniper, GREF_medic, GREF_officer, GREF_arti],
	[GREF_exception_heli, GREF_exception_plane, GREF_exception_tank],
	[_backpacks, _items, _weapons, _ammo],
	GREF_supplyDrop, _rewards, [], 
	[GREF_RT, _iaPilot, _iaCrew, _iaCAS, _iaPGroup, _iaSGroup, _iaArti, _iaAA, _iaStatic, _iaTank, _iaAPC, _iaCar, _iaAir, _iaGarrison]
] call common_fnc_implentAssets;
