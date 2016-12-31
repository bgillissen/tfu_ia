/*
@filename: feats\baseProtection\playerInitThread.sqf
Author:
	Ben
Description:
	this is run on player side when a player join
	keep track of player distance from the saveZone and add/remove the eventHandler that prevent him to fire accordingly
*/

if ( (["baseProtection"] call core_fnc_getConf) == 0 ) exitWith {};

private _delay = ["baseProtection", "sleepDelay"] call BIS_fnc_GetCfgData;

private _coord = getMarkerPos "SZ";

BP_inBase = true;

waitUntil {
	!BLACKSCREEN
};

while { true } do {
	BP_inBase = [false, true] select ((player distance _coord) < SZ_RADIUS);
	sleep _delay;
};