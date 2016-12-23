/*
@filename: feats\intro\playerPostInit.sqf
Author:
	Ben
Description:
	run once on player side when the player has finished loading
	display the server rules dialog on join.
*/

if ( (["intro"] call core_fnc_getConf) ) then spawn intro_fnc_show;