/*
@filename: feats\playerSpawn\teleport.sqf
Author:
	Ben
Description:
	run on player
	tp player on the active base spawn marker depending on his role (heliPilot, jetPilot, crew, inf)
*/
private _marker = (player getVariable "role") call {
	if ( _this isEqualTo "hPilot" ) exitWith { "BS_HPILOT" };
	if ( _this isEqualTo "jPilot" ) exitWith { "BS_JPILOT" };
	if ( _this isEqualTo "crew" ) exitWith { "BS_CREW" };
	"BS_INF"
};

player setDir (markerDir _marker);
player setPos (getMarkerPos _marker);