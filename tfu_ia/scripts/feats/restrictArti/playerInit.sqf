/*
@filename: feats\restrictArti\playerInit.sqf
Author:
	Ben
Description:
	run on player side,
	restrict avaibility of the artillery computer to the class defined in U_arti
*/

if ( (["restrictArti"] call core_fnc_getConf) == 1 ) then {
	enableEngineArtillery false;
	if ( (player getVariable "role") isEqualTo "arti" ) then {
		enableEngineArtillery true;
	}
} else {
	enableEngineArtillery true;
};