/*
@filename: mods\vanilla.sqf
Author:
	Ben
Description:
	Run once by server and players.
	define vanilla assets we are going to use, roles/gears for restrictions, vehicles rewards/features/restrictions
*/

private ["_backpacks", "_weapons", "_ammo", "_items", "_rewards",
         "_cargoBackpacks", "_cargoWeapons", "_cargoAmmo", "_cargoItems",
         "_iaPilot", "_iaCAS", "_iaSGroup", "_iaArti", "_iaAA", "_iaStatic", "_iaTank", "_iaAPC", "_iaCar", "_iaAir", "_iaGarrison"];

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

//------------------------------------------------------------ BLUFOR CARGO
						 
#define BLUFOR_cargoBackpacks []
#define BLUFOR_cargoWeapons []
#define BLUFOR_cargoAmmo [["SatchelCharge_Remote_Mag", 5],\
						  ["DemoCharge_Remote_Mag", 10]]
#define BLUFOR_cargoItems [["Laserdesignator", 5],\
						   ["Laserbatteries", 5],\
						   ["MineDetector", 5],\
						   ["NVGoggles", 5],\
						   ["FirstAidKit", 20],\
						   ["Medikit", 3],\
						   ["ToolKit", 3]]

//------------------------------------------------------------ OPFOR CARGO

#define OPFOR_cargoBackpacks []
#define OPFOR_cargoWeapons []
#define OPFOR_cargoAmmo [["SatchelCharge_Remote_Mag", 5],\
			   		  	 ["DemoCharge_Remote_Mag", 10]]
#define OPFOR_cargoItems BLUFOR_cargoItems

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
#define VANILLA_supplyCrates []

//------------------------------------------------------------ BLUFOR REWARDS

#define BLUFOR_rewards = []

//------------------------------------------------------------ OPFOR REWARDS

#define OPFOR_rewards = []

//------------------------------------------------------------ IA RadioTowers

#define VANILLA_RT ["Land_TTowerBig_2_F"]

//------------------------------------------------------------ BLUFOR IA Units

#define BLUFOR_pilot []
#define BLUFOR_crew []
#define BLUFOR_cas []
#define BLUFOR_patrolGroups []
#define BLUFOR_sniperGroups []
#define BLUFOR_aaTank []
#define BLUFOR_arti []
#define BLUFOR_static []
#define BLUFOR_tank []
#define BLUFOR_apc []
#define BLUFOR_car []
#define BLUFOR_airPatrol []
#define BLUFOR_garrison []

//------------------------------------------------------------ OPFOR IA Units

#define OPFOR_pilot []
#define OPFOR_crew []
#define OPFOR_cas []
#define OPFOR_patrolGroups []
#define OPFOR_sniperGroups []
#define OPFOR_aaTank []
#define OPFOR_arti []
#define OPFOR_static []
#define OPFOR_tank []
#define OPFOR_apc []
#define OPFOR_car []
#define OPFOR_airPatrol []
#define OPFOR_garrison []

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

if ( VA_blufor_backpacks ) then { 
	_backpacks append BLUFOR_backpacks; 
	_cargoBackpacks append BLUFOR_cargoBackpacks;
};
if ( VA_blufor_items ) then { 
	_items append BLUFOR_items;
	_cargoItems append BLUFOR_cargoItems; 
};
if ( VA_blufor_weapons ) then { 
	_weapons append BLUFOR_weapons;
	_ammo append BLUFOR_ammo;
	_cargoWeapons append BLUFOR_cargoWeapons;
	_cargoAmmo append BLUFOR_cargoAmmo;
};
if ( VA_opfor_backpacks ) then { 
	_backpacks append OPFOR_backpacks; 
	_cargoBackpacks append OPFOR_cargoBackpacks;
};
if ( VA_opfor_items ) then { 
	_items append OPFOR_items; 
	_cargoItems append OPFOR_cargoItems;
};
if ( VA_opfor_weapons ) then { 
	_weapons append OPFOR_weapons;
	_ammo append OPFOR_ammo;
	_cargoWeapons append OPFOR_cargoWeapons;
	_cargoAmmo append OPFOR_cargoAmmo;
};

if ( REWARD_blufor ) then { _rewards append BLUFOR_rewards; };
if ( REWARD_opfor ) then { _rewards append OPFOR_rewards; };


if ( IA_spawnVanilla ) then {
	if ( PLAYER_SIDE == "blufor" ) then {
		_iaPilot = OPFOR_pilot;
		_iaCrew = OPFOR_crew;
		_iaCAS = OPFOR_cas;
		_iaPGroup = OPFOR_patrolGroup;
		_iaSGroup = OPFOR_sniperGroup;
		_iaArti = OPFOR_arti;
		_iaAA = OPFOR_aaTank;
		_iaStatic = OPFOR_static;
		_iaTank = OPFOR_tank;
		_iaAPC = OPFOR_apc;
		_iaCar = OPFOR_car;
		_iaAir = OPFOR_airPatrol;
		_iaGarrison = OPFOR_garrison;
	} else {
		_iaPilot = BLUFOR_pilot;
		_iaCrew = BLUFOR_crew;
		_iaCAS = BLUFOR_cas;
		_iaSGroup = BLUFOR_sniperGroup;
		_iaArti = BLUFOR_arti;
		_iaAA = BLUFOR_aaTank;
		_iaStatic = BLUFOR_static;
		_iaTank = BLUFOR_tank;
		_iaAPC = BLUFOR_apc;
		_iaCar = BLUFOR_car;
		_iaAir = BLUFOR_airPatrol;
		_iaGarrison = BLUFOR_garrison;
	};
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
	[VANILLA_pilot, VANILLA_crew, VANILLA_mg, VANILLA_at, VANILLA_marksman, VANILLA_sniper, VANILLA_medic, VANILLA_officer, VANILLA_arti],
	[VANILLA_exception_heli, VANILLA_exception_plane, VANILLA_exception_tank],
	[_backpacks, _items, _weapons, _ammo],
	[_cargoBackpacks, _cargoItems, _cargoWeapons, _cargoAmmo],
	[VANILLA_supplyDrop, VANILLA_supplyCrates], _rewards, VANILLA_UAV, 
	[VANILLA_RadioTower, _iaPilot, _iaCrew, _iaCAS, _iaSGroup, _iaArti, _iaAA, _iaStatic, _iaTank, _iaAPC, _iaCar, _iaAir, _iaGarrison]
] call common_fnc_implentAssets;