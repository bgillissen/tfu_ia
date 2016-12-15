/*
@filename: feats\hearPlugs\player.sqf
Author:
	Ben
Description:
	Run once on player side only,
	display the server rules box on join.
*/
private ["_handle"];

if ( PARAMS_intro == 1 ) then _handle = createdialog "SRV_RULES";