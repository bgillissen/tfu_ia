/*
@filename: feats\revive\playerJoin.sqf
Author:
	Ben
Description:
	this script is run on player when a player has join the server,
	to start the the new player FSM
*/
if ( MOD_ace ) exitWith {};

private _reviveScript = (["revive_script"] call core_fnc_getParam);

if ( _reviveScript == 1 ) exitWith {
	_this call compileFinal preprocessFileLineNumbers "feats\revive\ais\playerJoin.sqf";
};