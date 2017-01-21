/*
@filename: feats\revive\headlessDestroy.sqf
Author:
	Ben
Description:
	run on headless when a player has join,
*/

if ( MOD_ace ) exitWith {};

private _reviveScript = (["revive_script"] call core_fnc_getParam);

if ( _reviveScript == 1 ) exitWith {
	_this call compileFinal preprocessFileLineNumbers "feats\revive\ais\headlessDestroy.sqf";
};