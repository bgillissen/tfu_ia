/*
@filename: mods\tfar.sqf
Author:
	Ben
Description:
	Run once by server and players.
	define tfar gears we are going to use.
*/

#define MOD_tfar true;

//so player do not spawn with longrange radio as backpacks
tf_no_auto_long_range_radio = true;

//so player do not have Dagr in their inventory
TF_give_microdagr_to_soldier = false;

//To reduce the terrain interception coefficient
TF_terrain_interception_coefficient = 1;

#define TFAR_LR ["tf_rt1523g",\ 
				 "tf_rt1523g_big",\ 
				 "tf_rt1523g_black",\
				 "tf_rt1523g_fabric",\
				 "tf_rt1523g_green",\
				 "tf_rt1523g_rhs",\
				 "tf_rt1523g_sage"]

#define TFAR_SR ["tf_anprc152"]

[[], [], [], [], [], [], [], [], [], [], [], [], TFAR_LR, TFAR_SR, [], [], [], []] call common_fnc_implentAssets;

call compile preprocessFile "feats\tfar\common.sqf";