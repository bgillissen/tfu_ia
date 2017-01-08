/*
@filename: feats\curator\playerPostInit.sqf
Author:
	Ben
Description:
	run on player.
	define vars to quickly see if player is a curator  
*/

if ( !isMultiplayer ) exitWith {
	isCurator = true;
	isAssigned = true;
	player assignCurator zeus_0;
	curatorAssigned append [["", 0, player]];
};

isCurator = [player] call curator_fnc_isCurator;
isAssigned = [player] call curator_fnc_isAssigned;