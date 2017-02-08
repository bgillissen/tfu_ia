/*
@filename: feats\assets\rhs\AFRF\handWeap.sqf
Author:
	Rainman
Description:
	run on server
	call by feats\assets\rhs\AFRF\assets.sqf
	return a RHS AFRF hand weapon depending on given role and MAP_KEYWORDS
Params:
	STRING	unit role
Environment:
	missionNamespace:
		MAP_KEYWORDS
Return:
	STRING	a hand weapon classname
*/
params['_role'];

if ( _role in ["hq", "jPilot", "hPilot"] ) exitWith { "" };

"rhs_weap_pya"
