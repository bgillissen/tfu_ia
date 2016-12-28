/*
@filename: feats\intro\playerPostInit.sqf
Author:
	Ben
Description:
	run on player,
	display the server's rule dialog on join.
Params:
	none
Environment:
	missionParamaters:
		intro
Return:
	nothing	
*/

if ( (["intro"] call core_fnc_getConf) ) then {
	spawn intro_fnc_show;
};