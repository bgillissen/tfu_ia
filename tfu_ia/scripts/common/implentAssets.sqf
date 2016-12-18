/*
@filename: common\implentAssets.sqf
Author:
	Ben
Description:
	This is used to append the assets added by a loaded mod to our list of available assets.
*/

param ["_units", "_veh", "_va", "_cargo", "_supply", "_rewards" , "_uav", "_ia"];

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
	if (count _ia select 8 > 0) then IA_static append _ia select 8;
	if (count _ia select 9 > 0) then IA_tank append _ia select 9;
	if (count _ia select 10 > 0) then IA_apc append _ia select 10;
	if (count _ia select 11 > 0) then IA_car append _ia select 11;
	if (count _ia select 12 > 0) then IA_airPatrol append _ia select 12;
	if (count _ia select 13 > 0) then IA_garrison append _ia select 13;
};