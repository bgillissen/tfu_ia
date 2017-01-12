
params['_role'];

if ( _role isEqualTo "hmg" ) exitWith { "" };
if ( _role isEqualTo "lmg" ) exitWith { "rhs_weap_m249_pip_S_vfg" };

private "_weap";

if ( "desert" in MAP_KEYWORDS ) then { 
	_weap = "rhs_weap_m4a1_blockII_d";
	if ( _role isEqualTo "grenadier" ) then {_weap = "rhs_weap_m4a1_blockII_m230_d"; };
	if ( _role isEqualTo "sniper" ) then {_weap = ""; };
	if ( _role isEqualTo "marksman" ) then {_weap = ""; };
	if ( _role in ["hPilot", "jPilot"] ) then { _weap = "rhsusf_weap_MP7A1_d"; };
} else {
	if ( ("jungle" in MAP_KEYWORDS) || ("wood" in MAP_KEYWORDS) ) then {
		_weap = "rhs_weap_m4a1_blockII_wd";
		if ( _role isEqualTo "grenadier" ) then {_weap = "rhs_weap_m4a1_blockII_m230_wd"; };
		if ( _role isEqualTo "sniper" ) then {_weap = ""; };
		if ( _role isEqualTo "marksman" ) then {_weap = ""; };
		if ( _role in ["hPilot", "jPilot"] ) then { _weap = "rhsusf_weap_MP7A1_base_f"; };
	} else {
		_weap = "rhs_weap_m4a1_blockII";
		if ( _role isEqualTo "grenadier" ) then {_weap = "rhs_weap_m4a1_blockII_m230"; };
		if ( _role isEqualTo "sniper" ) then {_weap = ""; };
		if ( _role isEqualTo "marksman" ) then {_weap = ""; };
		if ( _role in ["hPilot", "jPilot"] ) then { _weap = "rhsusf_weap_MP7A1_base_f"; };
	};
};

_weap