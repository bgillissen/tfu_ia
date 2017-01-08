/*
@filename: feats\mods\rhsUSAF\init.sqf
Author:
	Ben
Description:
	run on server,
	implent RHS USAF assets
*/

["rhs", [["USAF", (call rhsUSAF_fnc_assets), (["assets", "usaf", "sides"] call core_fnc_getSetting), false]]] call assets_fnc_implent;