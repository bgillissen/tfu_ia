/*
@filename: mods\tfar\implent.sqf
Author:
	Ben
Description:
	Run once by server and players.
	implent TFAR assets
*/

//force right billboard to display our tfar tips
#undef DB_rightMode
#define DB_rightMode "tfar"

//so player do not spawn with longrange radio as backpacks
tf_no_auto_long_range_radio = true;

//so player do not have Dagr in their inventory
TF_give_microdagr_to_soldier = false;

//To reduce the terrain interception coefficient
TF_terrain_interception_coefficient = 1;

if ( PLAYER_SIDE == west ) then {				 	 	 
	[[], [], [TFAR_BLUFOR_LR, TFAR_BLUFOR_SR, [], []], [], [], [], [], []] call common_fnc_implentAssets;
} else {
	[[], [], [TFAR_OPFOR_LR, TFAR_OPFOR_SR, [], []], [], [], [], [], []] call common_fnc_implentAssets;
};