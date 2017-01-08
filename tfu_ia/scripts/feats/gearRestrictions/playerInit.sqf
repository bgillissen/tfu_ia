/*
@filename: feats\gearRestriction\playerInit.sqf
Author:
	Ben
Description:
	run on player side,
	restrict avaibility of the artillery computer to the player with an arti  role
*/

if ( (["restrictArti"] call core_fnc_getParam) == 1 ) then {
	private _allowed = (["gearRestrictions", "artiRoles"] call core_fnc_getSetting);
	enableEngineArtillery ((player getVariable "role") in _allowed);
} else {
	enableEngineArtillery true;
};