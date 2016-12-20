/*
@filename: feats\baseProtection\playerInitThread.sqf
Author:
	Ben
Description:
	this is run on player side when a player join
	keep track of player distance from the saveZone and add/remove the eventHandler that prevent him to fire accordingly
*/

BP_inBase = false;

if ( !(["baseProtection"] call core_fnc_getConf) ) exitWith {};

private _coord = getMarkerPos "SZ";

while {true} do {
	if ( BP_inBase ) then {
		BP_inBase = [false, true] select (player distance _coord) > SZ_RADIUS);
	} else {
		BP_inBase = [false, true] select (player distance _coord) < SZ_RADIUS);
	};
	sleep BP_sleepDelay;
};