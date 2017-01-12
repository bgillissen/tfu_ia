/*
@filename: feats\assets\rhs\USAF\vest.sqf
Author:
	Ben
Description:
	run on server
	call by feats\assets\rhs\USAF\assets.sqf
	return a RHS USAF vest depending on given role and MAP_KEYWORDS
Params:
	STRING	unit role
Environment:
	missionNamespace:
		MAP_KEYWORDS
Return:
	STRING	a vest classname
*/
params ["_role"];

_vest = "rhsusf_spc_corpsman";
if ( _role in ["tl", "sl"] ) then { _vest = "rhsusf_spc_squadleader"; };
if ( _role in ["hmg", "lmg"] ) then { _vest = "rhsusf_spc_mg"; };
if ( _role in ["hPilot", "crew"] ) then { _vest = "rhsusf_spc_crewman"; };
if ( _role isEqualTo "grenadier" ) then { _vest = "rhsusf_spc_teamleader"; };
if ( _role isEqualTo "marksman" ) then { _vest = "rhsusf_spc_marksman"; };
if ( _role isEqualTo "rifleman" ) then { _vest = "rhsusf_spc_rifleman"; };
if ( "desert" in MAP_KEYWORDS ) then { 
	_vest = "rhsusf_iotv_ocp_Rifleman";
	if ( _role in ["tl", "sl"] ) then { _vest = "rhsusf_iotv_ocp_Squadleader"; };
	if ( _role isEqualTo "grenadier" ) then { _vest = "rhsusf_iotv_ocp_Grenadier"; };
	if ( _role isEqualTo "medic" ) then { _vest = "rhsusf_iotv_ocp_Medic"; };
	if ( _role in ["hPilot", "crew", "repair", "demo"] ) then { _vest = "rhsusf_iotv_ocp_Repair"; };
};

_vest