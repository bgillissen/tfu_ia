/*
@filename: mods\tfar.sqf
Author:
	Ben
Description:
	Run once by server and players.
	define tfar gears we are going to use.
*/

#define MOD_tfar true;

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