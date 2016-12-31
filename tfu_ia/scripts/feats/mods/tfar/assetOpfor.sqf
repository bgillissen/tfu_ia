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
				 	  "tf_mr3000_multicam", 
				 	  "tf_mr3000_rhs"];
private _items =  ["tf_fadak"];

_out set [A__BACKPACKS, _backpacks];
_out set [A__ITEMS, _items];

//------------------------------------------------------------ FINITO, return

_out