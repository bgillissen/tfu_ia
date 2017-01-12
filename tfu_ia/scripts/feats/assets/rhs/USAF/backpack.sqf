/*
@filename: feats\assets\rhs\USAF\backpack.sqf
Author:
	Ben
Description:
	run on server
	call by feats\assets\rhs\USAF\assets.sqf
	return a RHS USAF backpack depending on given role and MAP_KEYWORDS
Params:
	STRING	unit role
Environment:
	missionNamespace:
		MAP_KEYWORDS
Return:
	STRING	a backpack classname
*/
params ["_role"];

if ( ("jungle" in MAP_KEYWORDS) || ("wood" in MAP_KEYWORDS) ) exitWith { "rhsusf_assault_eagleaiii_coy" };

if ( "desert" in MAP_KEYWORDS || "dry" in MAP_KEYWORDS ) exitWith { "rhsusf_assault_eagleaiii_ocp" };

"rhsusf_falconii"