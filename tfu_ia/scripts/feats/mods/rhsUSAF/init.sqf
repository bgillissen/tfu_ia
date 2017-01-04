/*
@filename: feats\mods\rhsUSAF\init.sqf
Author:
	Ben
Description:
	run on server,
	implent RHS USAF assets
*/

private _data = call compileFinal preprocessFileLineNumbers "feats\mods\rhsUSAF\assets.sqf";

["rhs", [["USAF", _data, [west], false]]] call mods_fnc_implent;