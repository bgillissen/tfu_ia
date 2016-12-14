/*
@filename: feats\tfar\player.sqf
Author:
	Ben
Description:
	run once on player side only,
	add eventHandlers to preset the radio frequencies when needed.
*/

#ifdef MOD_tfar

if ( PARAMS_radioFreq == 0 ) then { exitWith{}; }; 

//when player enter a vehicle
player addEventHandler ["GetInMan", {[_this select 1, _this select 2] call radioFreq_fnc_onBoardIn;}];

//when player pick up a radio from container
player addEventHandler ["Take", {[_this select 2] call radioFreq_fnc_onPickUp;}]; 

//when a player close the arsenal
player setVariable [ "VAcatch", [ "VAcatch", "onEachFrame", {call radioFreq_fnc_closeArsenal}, player ] call BIS_fnc_addStackedEventHandler ];

#endif