/*
@filename: feats\mods\tfar\assetBlufor.sqf
Author:
	Ben
Description:
	run on server
	return BLUFOR TFAR assets
*/

_out = [];

//------------------------------------------------------------ Arsenal TFAR BLUFOR

private _backpacks = ["tf_anarc210",
                      "tf_rt1523g", 
				 	  "tf_rt1523g_big",
				 	  "tf_rt1523g_big_bwmod",
				 	  "tf_rt1523g_big_bwmod_tropen",
				 	  "tf_rt1523g_big_rhs",
				 	  "tf_rt1523g_black",
				 	  "tf_rt1523g_bwmod",
				 	  "tf_rt1523g_fabric",
				 	  "tf_rt1523g_green",
				 	  "tf_rt1523g_rhs",
				 	  "tf_rt1523g_sage"];
private _items =  ["tf_anprc152"];

//------------------------------------------------------------ FINITO, return

[_backpacks, _items]