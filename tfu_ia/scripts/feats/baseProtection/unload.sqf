/*
@filename: feats\baseProtection\unload.sqf
Author:
	Ben
Description:
	this run on player side when player has clicked on CONTINUE after having fire a shot in safe zone
	remove the eventHandler and close the centered hint 
*/

disableSerialization;

params ["_display"];

_display displayRemoveEventHandler ["unload", hintC_EH];

hintSilent "";