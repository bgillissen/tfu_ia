/*
@filename: feats\baseProtection\playerFired.sqf
Author:
	Ben
Description:
	this is run on player when a player fire (onShoot feature event)
	 if player is in Safe Zone it remove the projectile and display a centered Hint
*/

if ( !BP_inBase ) exitWith {};

if !( player call memberData_fnc_baseProtection ) exitWith {};

deleteVehicle (_this select 6);

hintC (["baseProtection", "msg"] call core_fnc_getSetting);

disableSerialization;

hintC_EH = findDisplay 57 displayAddEventHandler ["Unload", {_this spawn baseProtection_fnc_unload;}];