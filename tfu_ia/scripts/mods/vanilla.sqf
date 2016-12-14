/*
@filename: mods\vanilla.sqf
Author:
	Ben
Description:
	Run once by server and players.
	define vanilla assets we are going to use, roles/gears for restrictions, vehicles rewards/features/restrictions
*/

private ["_backpacks", "_items", "_weapons", "_ammo", "_rewards"];

#define MOD_vanilla true;

//------------------------------------------------------------ BLUFOR ASSETS

#define BLUFOR_backpacks []
#define BLUFOR_weapons []
#define BLUFOR_ammo []
#define BLUFOR_items []

//------------------------------------------------------------ OPFOR ASSETS

#define OPFOR_backpacks []
#define OPFOR_weapons []
#define OPFOR_ammo []
#define OPFOR_items []

//------------------------------------------------------------ GEAR RESTRICTIONS

#define VANILLA_restricted_launcher []
#define VANILLA_restricted_MG []
#define VANILLA_restricted_mRifle []
#define VANILLA_restricted_mScope []
#define VANILLA_restricted_sRifle []
#define VANILLA_restricted_sScope []
#define VANILLA_restricted_oScope []

//------------------------------------------------------------ VEHICLE EXCEPTION

#define VANILLA_exception_heli []
#define VANILLA_exception_plane []
#define VANILLA_exception_tank []

//------------------------------------------------------------ UAV

#define VANILLA_UAV ["B_UAV_02_CAS_F", "B_UAV_02_F", "B_UGV_01_F", "B_UGV_01_rcws_F"]

//------------------------------------------------------------ UNITS CLASSES

#define VANILLA_pilot []
#define VANILLA_crew []
#define VANILLA_mg []
#define VANILLA_at []
#define VANILLA_marksman []
#define VANILLA_sniper []
#define VANILLA_medic ["B_medic_F", "B_recon_medic_F", "B_G_medic_F", "O_medic_F", "I_medic_F", "O_recon_medic_f"]
#define VANILLA_officer []
#define VANILLA_arti []

//------------------------------------------------------------ SUPPLY DROP

#define VANILLA_supplyDrop []

//------------------------------------------------------------ BLUFOR REWARDS

#define BLUFOR_rewards = []

//------------------------------------------------------------ OPFOR REWARDS

#define OPFOR_rewards = []

//------------------------------------------------------------ BLUFOR IA Units

#define BLUFOR_patrolGroups []
#define BLUFOR_sniperGroups []
#define BLUFOR_AA []
#define BLUFOR_statics []
#define BLUFOR_VEH []

//------------------------------------------------------------ OPFOR IA Units

#define OPFOR_patrolGroups []
#define OPFOR_sniperGroups []
#define OPFOR_AA []
#define OPFOR_statics []
#define OPFOR_VEH []

//------------------------------------------------------------ IMPLENTING ASSETS

_backpacks = [];
_items = [];
_weapons = [];
_ammo = [];
_rewards = [];
_uav = [];

if ( VA_blufor_backpacks ) then { _backpacks = BLUFOR_backpacks; };
if ( VA_blufor_items ) then { _items = BLUFOR_items; };
if ( VA_blufor_weapons ) then { 
	_weapons = BLUFOR_weapons;
	_ammo = BLUFOR_ammo;
};
if ( VA_opfor_backpacks ) then { _backpacks = _backpacks + OPFOR_backpacks; };
if ( VA_opfor_items ) then { _items = _items + OPFOR_items; };
if ( VA_opfor_weapons ) then { 
	_weapons = _weapons + OPFOR_weapons;
	_ammo = _ammo + OPFOR_ammo;
};

if ( REWARD_blufor ) then { _rewards = BLUFOR_rewards; };
if ( REWARD_opfor ) then { _rewards = _rewards + OPFOR_rewards; };

[
	VANILLA_pilot, VANILLA_crew, VANILLA_mg, VANILLA_at, VANILLA_marksman, VANILLA_sniper, VANILLA_medic, VANILLA_officer, VANILLA_arti,
	VANILLA_exception_heli, VANILLA_exception_plane, VANILLA_exception_tank,
	_backpacks, _items, _weapons, _ammo,
	VANILLA_supplyDrop, _rewards, VANILLA_UAV
] call common_fnc_implentAssets;