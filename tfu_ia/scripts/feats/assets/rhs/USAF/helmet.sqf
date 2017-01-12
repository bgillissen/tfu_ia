/*
@filename: feats\assets\rhs\USAF\helmet.sqf
Author:
	Ben
Description:
	run on server
	call by feats\assets\rhs\USAF\assets.sqf
	return a RHS USAF helmet depending on given role and MAP_KEYWORDS
Params:
	STRING	unit role
Environment:
	missionNamespace:
		MAP_KEYWORDS
Return:
	STRING	a helmet classname
*/
params ["_role"];

if ( _role isEqualTo "hq" ) exitWith { "rhsusf_bowman_cap" };
if ( _role isEqualTo "hPilot" ) exitWith { "rhsusf_hgu56p" };
if ( _role isEqualTo "jPilot" ) exitWith { "rhsusf_hgu56p_mask" };

if ( ("desert" in MAP_KEYWORDS) || ("dry" in MAP_KEYWORDS) ) exitWith {
	if ( _role in ["tl", "sl", "jtac"] ) exitWith { "rhsusf_ach_helmet_headset_ocp" };
	if ( _role isEqualTo "crew" ) exitWith { "rhsusf_cvc_helmet" };
	"rhsusf_ach_helmet_ocp"	
};

if ( _role isEqualTo "crew" ) exitWith { "rhsusf_cvc_green_helmet" };
"rhsusf_ach_helmet_M81" 