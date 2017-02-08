/*
@filename: feats\assets\rhs\AFRF\vest.sqf
Author:
	Rainman
Description:
	run on server
	call by feats\assets\rhs\AFRF\assets.sqf
	return a RHS AFRF vest depending on given role and MAP_KEYWORDS
Params:
	STRING	unit role
Environment:
	missionNamespace:
		MAP_KEYWORDS
Return:
	STRING	a vest classname
*/
params ["_role"];

_vest = "rhs_6b13_EMR_6sh92";

if ( _role in ["jPilot", "hPilot"] ) exitWith { "" };
if ( _role in ["tl", "sl", "grenadier"] ) then { _vest = "rhs_6b13_EMR_6sh92_vog"; };
if ( _role in ["hPilot", "crew"] ) then { _vest = "rhs_vydra_3m"; };
if ( "desert" in MAP_KEYWORDS ) then {
	_vest = "rhs_6b23_ML_6sh92";
	if ( _role in ["tl", "sl", "grenadier"] ) then { _vest = "rhs_6b23_ML_6sh92_vog"; };
	if ( _role isEqualTo "medic" ) then { _vest = "rhs_6b23_ML_medic"; };
};

_vest
