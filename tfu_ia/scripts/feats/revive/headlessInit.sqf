/*
@filename: feats\revive\headlessInit.sqf
Author:
	Ben
Description:
	run on headless,
*/

if ( MOD_ace ) exitWith {};

private _reviveScript = (["revive_script"] call core_fnc_getParam);

if ( _reviveScript == 1 ) exitWith {
	call compileFinal preprocessFileLineNumbers "feats\revive\ais\headlessInit.sqf";
};