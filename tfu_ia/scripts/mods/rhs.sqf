/*
@filename: mods\rhs.sqf
Author:
	Ben
Description:
	Run once by server and players.
	define RHS assets we are going to use, roles/gears for restrictions, vehicles rewards/features/restrictions
*/

private ["_backpacks", "_items", "_weapons", "_ammo", "_rewards"];

#define MOD_rhs true;

//------------------------------------------------------------ USAF ASSETS

#define USAF_backpacks []
#define USAF_weapons []
#define USAF_ammo []
#define USAF_items []

//------------------------------------------------------------ AFRF ASSETS

#define AFRF_backpacks []
#define AFRF_weapons []
#define AFRF_ammo []
#define AFRF_items []

//------------------------------------------------------------ GEAR RESTRICTIONS

#define RHS_restricted_launcher []
#define RHS_restricted_MG []
#define RHS_restricted_mRifle []
#define RHS_restricted_mScope []
#define RHS_restricted_sRifle []
#define RHS_restricted_sScope []
#define RHS_restricted_oScope []

//------------------------------------------------------------ VEHICLE EXCEPTION

#define RHS_exception_heli []
#define RHS_exception_plane []
#define RHS_exception_tank []

//------------------------------------------------------------ UNITS CLASSES

#define RHS_pilot []
#define RHS_crew ["rhsusf_army_ocp_crewman"]
#define RHS_mg []
#define RHS_at []
#define RHS_marksman []
#define RHS_sniper []
#define RHS_medic []
#define RHS_officer []
#define RHS_arti ["rhsusf_army_ocp_fso",\
			 	  "rhsusf_army_ocp_crewman"]

//------------------------------------------------------------ SUPPLY DROP

#define RHS_supplyDrop ["RHS_UH60M",\ 
						"RHS_CH_47F_10",\ 
						"rhsusf_CH53E_USMC_D",\ 
						"RHS_C130J"]

//------------------------------------------------------------ USAF REWARDS

#define USAF_rewards []

//------------------------------------------------------------ AFRF REWARDS

#define AFRF_rewards []

//------------------------------------------------------------ USAF IA Units

#define USAF_patrolGroups []
#define USAF_sniperGroups []
#define USAF_AA []
#define USAF_statics []
#define USAF_VEH []

//------------------------------------------------------------ AFRF IA Units

#define AFRF_patrolGroups []
#define AFRF_sniperGroups []
#define AFRF_AA []
#define AFRF_statics []
#define AFRF_VEH []


//------------------------------------------------------------ IMPLENTING ASSETS

_backpacks = [];
_items = [];
_weapons = [];
_ammo = [];
_rewards = [];

if ( VA_usaf_backpacks ) then { _backpacks = USAF_backpacks; };
if ( VA_usaf_items ) then { _items = USAF_items; };
if ( VA_usaf_weapons ) then { 
	_weapons = USAF_weapons;
	_ammo = USAF_ammo;
};
if ( VA_afrf_backpacks ) then { _backpacks = _backpacks + AFRF_backpacks; };
if ( VA_afrf_items ) then { _items = _items + AFRF_items; };
if ( VA_afrf_weapons ) then { 
	_weapons = _weapons + AFRF_weapons;
	_ammo = _ammo + AFRF_ammo;
};

if ( REWARD_usaf ) then { _rewards = USAF_rewards; };
if ( REWARD_afrf ) then { _rewards = _rewards + AFRF_rewards; };

[
	RHS_pilot, RHS_crew, RHS_mg, RHS_at, RHS_marksman, RHS_sniper, RHS_medic, RHS_officer, RHS_arti,
	RHS_exception_heli, RHS_exception_plane, RHS_exception_tank,
	_backpacks, _items, _weapons, _ammo,
	RHS_supplyDrop, _rewards, []
] call common_fnc_implentAssets;