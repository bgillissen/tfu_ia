/*
@filename: feats\assets\rhs\AFRF\primWeap.sqf
Author:
	Rainman
Description:
	run on server
	call by feats\assets\rhs\AFRF\assets.sqf
	return a RHS AFRF primary weapon depending on given role and MAP_KEYWORDS
Params:
	STRING	unit role
Environment:
	missionNamespace:
		MAP_KEYWORDS
Return:
	STRING	a primary weapon classname
*/
params['_role'];

if ( _role in ["tl", "sl", "grenadier"] ) exitWith { "rhs_weap_ak74m_gp25_npz" };
if ( _role isEqualTo "hmg" ) exitWith { "rhs_weap_pkp" };
if ( _role isEqualTo "lmg" ) exitWith { "rhs_weap_pkm" };
if ( _role isEqualTo "sniper" ) exitWith { "rhs_weap_svdp" };
if ( _role isEqualTo "marksman" ) exitWith { "rhs_weap_ak74m_zenitco01" };
if ( _role isEqualTo "hPilot" ) exitWith { "rhs_weap_aks74u" };

"rhs_weap_ak74m_npz"
