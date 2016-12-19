/*
@filename: feats\baseProtection\fired.sqf
Author:
	Ben
Description:
	this is run on player side when a player fire a shot in safe zone (Fired eventHandler)
	it remove the projectile and display a centered Hint
*/

deleteVehicle (_this select 6);

hintC BP_MSG;

hintC_EH = findDisplay 57 displayAddEventHandler ["unload", {_this spawn baseProtection_fnc_unload;}];