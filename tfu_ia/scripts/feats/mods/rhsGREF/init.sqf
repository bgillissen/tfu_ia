/*
@filename: feats\mods\rhsGREF\init.sqf
Author:
	Ben
Description:
	run on server,
	implent RHS GREF assets
*/

private _data = call compileFinal preprocessFileLineNumbers "feats\mods\rhsGREF\assets.sqf";

["rhs", [["GREF", _data, [independent]]]] call mods_fnc_implent;