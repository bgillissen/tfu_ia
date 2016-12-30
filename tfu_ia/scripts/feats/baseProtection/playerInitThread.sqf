/*
@filename: feats\baseProtection\playerInitThread.sqf
Author:
	Ben
Description:
	this is run on player side when a player join
	keep track of player distance from the saveZone and add/remove the eventHandler that prevent him to fire accordingly
*/

if ( (["baseProtection"] call core_fnc_getConf) == 0 ) exitWith {};

BP_inBase = false;

private _delay = ["baseProtection", "sleepDelay"] call BIS_fnc_GetCfgData;

private _coord = getMarkerPos "SZ";

while { true } do {
	if ( BP_inBase ) then {
		BP_inBase = [false, true] select ((player distance _coord) > SZ_RADIUS);
	} else {
		BP_inBase = [false, true] select ((player distance _coord) < SZ_RADIUS);
	};
	sleep _delay;
};