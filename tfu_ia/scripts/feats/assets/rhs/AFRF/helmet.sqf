/*
@filename: feats\assets\rhs\AFRF\helmet.sqf
Author:
	Rainman
Description:
	run on server
	call by feats\assets\rhs\AFRF\assets.sqf
	return a RHS AFRF helmet depending on given role and MAP_KEYWORDS
Params:
	STRING	unit role
Environment:
	missionNamespace:
		MAP_KEYWORDS
Return:
	STRING	a helmet classname
*/
params ["_role"];

if ( _role isEqualTo "hq" ) exitWith { "rhs_beret_milp" };
if ( _role isEqualTo "hPilot" ) exitWith { "rhs_zsh7a_mike_green_alt" };
if ( _role isEqualTo "jPilot" ) exitWith { "rhs_zsh7a_alt" };
if ( _role isEqualTo "crew" ) exitWith { "rhs_tsh4_ess_bala" };

if ( ("desert" in MAP_KEYWORDS) || ("dry" in MAP_KEYWORDS) ) exitWith {
	"rhs_6b27m_ml"
};

"rhs_6b47"
