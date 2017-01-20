/*
@filename: feats\revive\serverDestroy.sqf
Author:
	Ben
Description:
	run on player,
*/

if ( MOD_ace ) exitWith {};

private _reviveScript = (["revive_script"] call core_fnc_getParam);

if ( _reviveScript == 0 ) exitWith {
	call compileFinal preprocessFileLineNumbers "feats\revive\btc\serverDestroy.sqf";
};

if ( _reviveScript == 1 ) exitWith {
	call compileFinal preprocessFileLineNumbers "feats\revive\ais\serverDestroy.sqf";
};