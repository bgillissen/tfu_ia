/*
@filename: feats\curator\playerPostInit.sqf
Author:
	Ben
Description:
	run on player.
	define vars to quickly see if player is a curator  
*/

isCurator = [player] call curator_fnc_isCurator;
isAssigned = [player] call curator_fnc_isAssigned;