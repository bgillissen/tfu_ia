/*
@filename: feats\mods\tfar\assetOpfor.sqf
Author:
	Ben
Description:
	run on server
	return OPFOR TFAR assets
*/

_out = [];

//------------------------------------------------------------ Arsenal TFAR BLUFOR

private _backpacks = ["tf_mr3000",
                      "tf_mr3000_bwmod",
                      "tf_mr3000_bwmod_tropen",
				 	  "tf_mr3000_multicam", 
				 	  "tf_mr3000_rhs",
				 	  "tf_mr6000l"];
private _items =  ["tf_fadak"];

//------------------------------------------------------------ FINITO, return

[_backpacks, _items]