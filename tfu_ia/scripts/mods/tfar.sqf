/*
@filename: mods\tfar.sqf
Author:
	Ben
Description:
	Run once by server and players.
	define tfar settings and the gears we are going to use.
*/

#define MOD_tfar true;

//force right billboard to display our tfar tips
#undef DB_right
#define DB_right "tfar"

//so player do not spawn with longrange radio as backpacks
tf_no_auto_long_range_radio = true;

//so player do not have Dagr in their inventory
TF_give_microdagr_to_soldier = false;

//To reduce the terrain interception coefficient
TF_terrain_interception_coefficient = 1;


#define TFAR_BLUFOR_LR [ "tf_rt1523g",\ 
				 	 	 "tf_rt1523g_big",\ 
				 	 	 "tf_rt1523g_black",\
				 	 	 "tf_rt1523g_fabric",\
				 	 	 "tf_rt1523g_green",\
				 	 	 "tf_rt1523g_rhs",\
				 	 	 "tf_rt1523g_sage"]

#define TFAR_OPFOR_LR [ "tf_mr3000",\ 
				 	 	"tf_mr3000_multicam",\ 
				 	 	"tf_mr3000_rhs"]
				 	 	
#define TFAR_BLUFOR_SR ["tf_anprc152"]

#define TFAR_OPFOR_SR ["tf_fadak"]

if ( PLAYER_SIDE == "blufor" ) then {				 	 	 
	[[], [], [TFAR_BLUFOR_LR, TFAR_BLUFOR_SR, [], []], [], [], [], [], []] call common_fnc_implentAssets;
} else {
	[[], [], [TFAR_OPFOR_LR, TFAR_OPFOR_SR, [], []], [], [], [], [], []] call common_fnc_implentAssets;
};