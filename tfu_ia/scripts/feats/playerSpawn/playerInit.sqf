/*
@filename: feats\playerSpawn\playerInit.sqf
Author:
	Ben
Description:
	this run on player
	tp player on the active base spawn marker depending on his role (heliPilot, jetPilot, crew, inf)
*/

private _type = typeOf player;

if ( _type in U_hPilot ) exitWith {
	player setPos (getMarkerPos "BS_HPILOT"); 
};

if ( _type in U_jPilot ) exitWith { 
	player setPos (getMarkerPos "BS_JPILOT"); 
};

if ( _type in U_crew ) exitWith { 
	player setPos (getMarkerPos "BS_CREW"); 
};

player setPos (getMarkerPos "BS_INF");