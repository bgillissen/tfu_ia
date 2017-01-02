/*
@filename: feats\noRenegade\playerInit.sqf
Author:
	Ben
Description:
	run on player,
	register an eventHandler that trigger when the player's rating is changed,
	it prevent player becoming a renegade by always returning 0 as rating modification
*/

if ( (["noRenegade"] call core_fnc_getConf) == 0 ) exitWith {};


if ( isNil "NR_EH" ) then {
	diag_log "HandleRating EH registered";
	NR_EH = player addEventHandler ["HandleRating", { 0 }];
};