/*
@filename: feats\restrictArti\playerInit.sqf
Author:
	Ben
Description:
	run on player side,
	restrict avaibility of the artillery computer to the class defined in U_arti
*/

if ( ["restrictArti"] call core_fnc_getConf ) then {
	enableEngineArtillery false;
	if ( (typeOf player) in U_arti) then enableEngineArtillery true;
} else {
	enableEngineArtillery true;
};