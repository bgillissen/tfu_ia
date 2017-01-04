/*
@filename: mods\ace\init.sqf
Author:
	Ben
Description:
	run on server
	implent ACE assets
*/

private _data = call compileFinal preprocessFileLineNumbers "feats\mods\ace\assets.sqf";

["rhs", [["ACE", _data, independent]]] call mods_fnc_megaImplent;