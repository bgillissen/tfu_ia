/*
@filename: feats\assets\rhs\GREF\init.sqf
Author:
	Ben
Description:
	run on server,
	implent RHS GREF assets
*/

#define EAST 0
#define WEST 1
#define IND 2

["rhs", [["GREFI", (call gi_fnc_assets), [IND]]]] call assets_fnc_implent;
["rhs", [["GREFB", (call gb_fnc_assets), [WEST]]]] call assets_fnc_implent;