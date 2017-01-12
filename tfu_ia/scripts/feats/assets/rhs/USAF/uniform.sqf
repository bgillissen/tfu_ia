/*
@filename: feats\assets\rhs\USAF\uniform.sqf
Author:
	Ben
Description:
	run on server
	call by feats\assets\rhs\USAF\assets.sqf
	return a RHS USAF uniform depending on given role and MAP_KEYWORDS
Params:
	STRING	unit role
Environment:
	missionNamespace:
		MAP_KEYWORDS
Return:
	STRING	an uniform classname
*/
params ["_role"];

if ( _role in ["hq", "jPilot"] ) exitWith { "rhs_uniform_g3_blk" };

if ( ("jungle" in MAP_KEYWORDS) || ("wood" in MAP_KEYWORDS) ) exitWith { "rhs_uniform_g3_m81" };

if ( "desert" in MAP_KEYWORDS ) exitWith { "rhs_uniform_g3_tan" };

if ( "dry" in MAP_KEYWORDS ) exitWith { "rhs_uniform_g3_mc" };

"rhs_uniform_g3_rgr"