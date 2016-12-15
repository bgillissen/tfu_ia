/*
@filename: common\implentAssets.sqf
Author:
	Ben
Description:
	This is used to append the assets added by a loaded mod to our list of available assets.
*/

param ["_units", "_veh", "_va", "_supplyDrop", "_rewards" , "_uav", "_ia"];

if ( count _units > 0 ) then  {
	if (count _units select 0 > 0) then UNIT_pilot append _units select 0;
	if (count _units select 1 > 0) then UNIT_crew append _units select 1;
	if (count _units select 2 > 0) then UNIT_mg append _units select 2;
	if (count _units select 3 > 0) then UNIT_at append _units select 3;
	if (count _units select 4 > 0) then UNIT_marksman append _units select 4;
	if (count _units select 5 > 0) then UNIT_sniper append _units select 5;
	if (count _units select 6 > 0) then UNIT_medic append _units select 6;
	if (count _units select 7 > 0) then UNIT_officer append _units select 7;
	if (count _units select 8 > 0) then UNIT_arti append _units select 8;
};

if ( count _veh > 0 ) then  {
	if (count _veh select 0 > 0) then VEH_except_heli append _veh select 0;
	if (count _veh select 1 > 0) then VEH_except_plane append _veh select 1;
	if (count _veh select 2 > 0) then VEH_except_tank append _veh select 2;
};

if ( (PARAMS_filterArsenal == 1) && (count _va > 0) ) then {
	if (count _va select 0 > 0) then VA_backpacks append _va select 0;
	if (count _va select 1 > 0) then VA_items append _va select 1; 
	if (count _va select 2 > 0) then VA_weapons append _va select 2;
	if (count _va select 3 > 0) then VA_ammo append _va select 3;
};

if ( PARAMS_supplyDrop == 1 && (count _supplyDrop > 0) then { VEH_supplyDrop append _supplyDrop; };

if ( (PARAMS_SIDE == 1 || PARAMS_FOB == 1) && (count _rewards > 0) ) then { VEH_rewards append _rewards; };

if (count _uav > 0) then VEH_uav append _uav;

if ( count _ia > 0 ) then  {
	if (count _ia select 0 > 0) then IA_radioTower append _iaselect 0;
	if (count _ia select 1 > 0) then IA_pilot append _ia select 1;
	if (count _ia select 2 > 0) then IA_crew  append _ia select 2;
	if (count _ia select 3 > 0) then IA_cas = append _ia select 3;
	if (count _ia select 4 > 0) then IA_patrolGroups append _ia select 4;
	if (count _ia select 5 > 0) then IA_sniperGroups append _ia select 5;
	if (count _ia select 6 > 0) then IA_aaTank append _ia select 6;
	if (count _ia select 7 > 0) then IA_arti append _ia select 7;
	if (count _ia select 8 > 0) then IA_statics append _ia select 8;
	if (count _ia select 9 > 0) then IA_tank append _ia select 9;
	if (count _ia select 10 > 0) then IA_apc append _ia select 10;
	if (count _ia select 11 > 0) then IA_car append _ia select 11;
	if (count _ia select 12 > 0) then IA_airPatrol append _ia select 12;
	if (count _ia select 13 > 0) then IA_garrison append _ia select 13;
};