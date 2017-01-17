/*
@filename: feats\revive\serverInit.sqf
Author:
	Ben
Description:
	run on server,
*/

if ( MOD_ace ) exitWith {};

private _reviveScript = (["revive_script"] call core_fnc_getParam);

if ( _reviveScript == 0 ) exitWith {
	call compileFinal preprocessFileLineNumbers "feats\revive\btc\serverInit.sqf";
};

if ( _reviveScript == 1 ) exitWith {
	call compileFinal preprocessFileLineNumbers "feats\revive\ais\init.sqf";
};