/*
@filename: feats\playerSpawn\playerInit.sqf
Author:
	Ben
Description:
	this run on player
	tp player on the active base spawn marker depending on his role (heliPilot, jetPilot, crew, inf)
*/

private _role = player getVariable "role";

if ( _role == "hPilot" ) exitWith {
	player setPos (getMarkerPos "BS_HPILOT"); 
};

if ( _role ==  "jPilot" ) exitWith { 
	player setPos (getMarkerPos "BS_JPILOT"); 
};

if ( _role == "crew" ) exitWith { 
	player setPos (getMarkerPos "BS_CREW"); 
};

player setPos (getMarkerPos "BS_INF");