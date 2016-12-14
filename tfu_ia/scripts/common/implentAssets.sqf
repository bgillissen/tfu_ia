/*
@filename: common\implentAssets.sqf
Author:
	Ben
Description:
	This is used to append the assets added by a loaded mod to our list of available assets.
*/

param [
		"_pilot", "_crew", "_mg", "_at", "_marksman", "_sniper", "_medic", "_officer", "_arti",
		"_heli", "_plane", "_tank",
		"_backpacks", "_items", "_weapons", "_ammo",
		"_supplyDrop", "_rewards" , "_uav"
	  ];

UNIT_pilot = UNIT_pilot + _pilot;
UNIT_crew  = UNIT_crew + _crew;
UNIT_mg = UNIT_mg + _mg;
UNIT_at = UNIT_at + _at;
UNIT_marksman = UNIT_marksman + _marksman;
UNIT_sniper = UNIT_sniper + _sniper;
UNIT_medic = UNIT_medic + _medic;
UNIT_officer = UNIT_officer + _officer;
UNIT_arti = UNIT_arti + _arti;

VEH_except_heli = VEH_except_heli + _heli;
VEH_except_plane = VEH_except_plane + _plane;
VEH_except_tank = VEH_except_tank + _tank;

if ( PARAMS_filterArsenal == 1 ) then {
	VA_backpacks = VA_backpacks + _backpacks;
	VA_items = VA_items + _items; 
	VA_weapons = VA_weapons + _weapons;
	VA_ammo = VA_ammo + _ammo;
};

if ( PARAMS_supplyDrop == 1 ) then { VEH_supplyDrop =  VEH_supplyDrop + _supplyDrop; };

if ( PARAMS_Side_enable == 1 || PARAMS_FOB_enable == 1 ) then { VEH_rewards = VEH_rewards + _rewards; };

VEH_uav = VEH_uav + _uav;