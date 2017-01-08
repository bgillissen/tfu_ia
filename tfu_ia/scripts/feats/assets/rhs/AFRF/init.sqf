/*
@filename: feats\mods\rhsAFRF\init.sqf
Author:
	Ben
Description:
	run on server,
	implent RHS AFRF assets
*/

["rhs", [["AFRF", (call rhsAFRF_fnc_assets), (["assets", "afrf", "sides"] call core_fnc_getSetting)]]] call assets_fnc_implent;