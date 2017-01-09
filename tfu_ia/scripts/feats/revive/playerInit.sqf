/*
@filename: feats\revive\playerInit.sqf
Author:
	Ben
Description:
	run on player,
*/

private _reviveScript = (["revive_script"] call core_fnc_getParam);

if ( _reviveScript == 0 ) exitWith {
	call compileFinal preprocessFileLineNumbers "feats\revive\onelife\playerInit.sqf";
};

if ( MOD_ace ) exitWith {};

if ( _reviveScript == 1 ) exitWith {
	call compileFinal preprocessFileLineNumbers "feats\revive\btc\playerInit.sqf";
};

if ( _reviveScript == 2 ) exitWith {

};