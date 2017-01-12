/*
@filename: feats\assets\rhs\USAF\primWeap.sqf
Author:
	Ben
Description:
	run on server
	call by feats\assets\rhs\USAF\assets.sqf
	return a RHS USAF primary weapon depending on given role and MAP_KEYWORDS
Params:
	STRING	unit role
Environment:
	missionNamespace:
		MAP_KEYWORDS
Return:
	STRING	a primary weapon classname
*/
params['_role'];

if ( _role isEqualTo "hmg" ) exitWith { "rhs_weap_m240B" };
if ( _role isEqualTo "lmg" ) exitWith { "rhs_weap_m249_pip_S_vfg" };

private "_weap";

if ( "desert" in MAP_KEYWORDS ) then { 
	_weap = "rhs_weap_m4a1_blockII_d";
	if ( _role isEqualTo "grenadier" ) then {_weap = "rhs_weap_m4a1_blockII_m203_d"; };
	if ( _role isEqualTo "sniper" ) then {_weap = "rhs_weap_M107_d"; };
	if ( _role isEqualTo "marksman" ) then {_weap = "rhs_weap_sr25_ec_d"; };
	if ( _role isEqualTo "hPilot" ) then { _weap = "rhsusf_weap_MP7A1_desert"; };
} else {
	if ( ("jungle" in MAP_KEYWORDS) || ("wood" in MAP_KEYWORDS) ) then {
		_weap = "rhs_weap_m4a1_blockII_wd";
		if ( _role isEqualTo "grenadier" ) then {_weap = "rhs_weap_m4a1_blockII_m203_wd"; };
		if ( _role isEqualTo "sniper" ) then {_weap = "rhs_weap_M107_w"; };
		if ( _role isEqualTo "marksman" ) then {_weap = "rhs_weap_sr25_ec_wd"; };
		if ( _role isEqualTo "hPilot" ) then { _weap = "rhsusf_weap_MP7A1_base_f"; };
	} else {
		_weap = "rhs_weap_m4a1_blockII_bk";
		if ( _role isEqualTo "grenadier" ) then {_weap = "rhs_weap_m4a1_blockII_m203_bk"; };
		if ( _role isEqualTo "sniper" ) then {_weap = "rhs_weap_M107"; };
		if ( _role isEqualTo "marksman" ) then {_weap = "rhs_weap_sr25_ec"; };
		if ( _role isEqualTo "hPilot" ) then { _weap = "rhsusf_weap_MP7A1_base_f"; };
	};
};

_weap