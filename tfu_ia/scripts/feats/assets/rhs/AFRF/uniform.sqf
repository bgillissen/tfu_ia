/*
@filename: feats\assets\rhs\AFRF\uniform.sqf
Author:
	Rainman
Description:
	run on server
	call by feats\assets\rhs\AFRF\assets.sqf
	return a RHS AFRF uniform depending on given role and MAP_KEYWORDS
Params:
	STRING	unit role
Environment:
	missionNamespace:
		MAP_KEYWORDS
Return:
	STRING	an uniform classname
*/
params ["_role"];

if ( _role in "hq" ) exitWith { "rhs_uniform_m88_patchless" };

if ( _role in "jPilot" ) exitWith { "rhs_uniform_df15" };

if ( ("jungle" in MAP_KEYWORDS) || ("wood" in MAP_KEYWORDS) ) exitWith { "rhs_uniform_emr_patchless" };

if ( "desert" in MAP_KEYWORDS ) exitWith { "rhs_uniform_emr_des_patchless" };

if ( "dry" in MAP_KEYWORDS ) exitWith { "rhs_uniform_flora_patchless" };

"rhs_uniform_gorka_r_g"
