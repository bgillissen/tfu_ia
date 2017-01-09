/*
@filename: feats\mods\rhsGREF\init.sqf
Author:
	Ben
Description:
	run on server,
	implent RHS GREF assets
*/

#define EAST 0
#define WEST 1
#define IND 2

["rhs", [["GREFI", (call rhsGREF_fnc_ind), [IND]]]] call assets_fnc_implent;
["rhs", [["GREFB", (call rhsGREF_fnc_blufor), [WEST]]]] call assets_fnc_implent;