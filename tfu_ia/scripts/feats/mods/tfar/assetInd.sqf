/*
@filename: feats\mods\tfar\assetInd.sqf
Author:
	Ben
Description:
	run on server
	return Independent TFAR assets
*/

_out = [];

//------------------------------------------------------------ Arsenal TFAR IND

private _backpacks = ["TFAR_anprc155",
                      "TFAR_anprc155_coyote"];
private _items =  ["TFAR_anprc148jem"];

_out set [A__BACKPACKS, _backpacks];
_out set [A__ITEMS, _items];

//------------------------------------------------------------ FINITO, return

_out