/*
@filename: feats\assets\rhs\AFRF\backpack.sqf
Author:
	Rainman
Description:
	run on server
	call by feats\assets\rhs\AFRF\assets.sqf
	return a RHS AFRF backpack depending on given role and MAP_KEYWORDS
Params:
	STRING	unit role
Environment:
	missionNamespace:
		MAP_KEYWORDS
Return:
	STRING	a backpack classname
*/
params ["_role"];

if ( _role in ["tl", "sl", "jtac"] ) exitWith { "" };
if ( ("jungle" in MAP_KEYWORDS) || ("wood" in MAP_KEYWORDS) ) exitWith { "rhs_assault_umbts" };
if ( "desert" in MAP_KEYWORDS || "dry" in MAP_KEYWORDS ) exitWith { "rhs_sidor" };

"rhs_assault_umbts"
