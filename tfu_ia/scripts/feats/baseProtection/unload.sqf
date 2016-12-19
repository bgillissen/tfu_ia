/*
@filename: feats\baseProtection\unload.sqf
Author:
	Ben
Description:
	this is run on player side when player has clicked on CONTINUE after having fire a shot in safe zone
	it close the centered Hint, and remove the eventHandler
*/

_this select 0 displayRemoveEventHandler ["unload", hintC_EH];
hintSilent "";