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

(getMarkerPos _marker) params ["_x", "_y", "_z"];

private _xRand = random 3.5;
if ( (random 1) < 0.5 ) then { _xRand = (_xRand - (2 * _xRand )); };
private _yRand = random 3.5;
if ( (random 1) < 0.5 ) then { _yRand = (_yRand - (2 * _yRand)); };

player setPos [(_x + _xRand), (_y + _yRand), _z];