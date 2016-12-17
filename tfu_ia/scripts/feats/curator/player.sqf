/*
@filename: feats\curator\player.sqf
Author:
	Ben
Description:
	run once on player side only.
	define vars to quickly see if player is a curator
	add an eventHandler to   
*/

isCurator = [player] call curator_fnc_isCurator;
isAssigned = [player] call curator_fnc_isAssigned;