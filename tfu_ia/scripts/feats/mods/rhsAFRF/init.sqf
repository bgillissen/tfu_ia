/*
@filename: feats\mods\rhsAFRF\init.sqf
Author:
	Ben
Description:
	run on server,
	implent RHS AFRF assets
*/

private _data = call compileFinal preprocessFileLineNumbers "feats\mods\rhsAFRF\assets.sqf";

["rhs", [["AFRF", _data, [east]]]] call mods_fnc_implent;