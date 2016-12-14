/*
@filename: feats\restrictArty\player.sqf
Author:
	Ben
Description:
	run on player side only,
	restrict avaibility of the arti computer following params
*/

if ( PARAMS_restrictArti == 1 ) then {
	enableEngineArtillery false;
	if ( (typeOf player) in UNIT_arti) then enableEngineArtillery true;
} else {
	enableEngineArtillery true;
};