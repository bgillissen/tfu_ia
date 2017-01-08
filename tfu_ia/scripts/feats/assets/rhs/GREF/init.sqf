/*
@filename: feats\mods\rhsGREF\init.sqf
Author:
	Ben
Description:
	run on server,
	implent RHS GREF assets
*/

["rhs", [["GREF", (call rhsGREF_fnc_assets), (["assets", "gref", "sides"] call core_fnc_getSetting)]]] call assets_fnc_implent;