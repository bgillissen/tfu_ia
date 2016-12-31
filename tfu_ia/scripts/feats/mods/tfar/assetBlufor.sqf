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

private _backpacks = ["tf_rt1523g", 
				 	   "tf_rt1523g_big",
				 	   "tf_rt1523g_black",
				 	   "tf_rt1523g_fabric",
				 	   "tf_rt1523g_green",
				 	   "tf_rt1523g_rhs",
				 	   "tf_rt1523g_sage"];
private _items =  ["tf_anprc152"];

_out set [A__BACKPACKS, _backpacks];
_out set [A__ITEMS, _items];

//------------------------------------------------------------ FINITO, return

_out