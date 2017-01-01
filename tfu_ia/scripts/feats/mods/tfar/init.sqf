/*
@filename: mods\tfar\init.sqf
Author:
	Ben
Description:
	run on server,
	implent TFAR assets
*/

private _r = PLAYER_SIDE call {
	if ( _this == west ) exitWith {
		call compileFinal preprocessFileLineNumbers "feats\mods\tfar\assetBlufor.sqf";
	};
	if ( _this == east ) exitWith {
		call compileFinal preprocessFileLineNumbers "feats\mods\tfar\assetOpfor.sqf";
	};
	if ( _this == independent ) exitWith {
		call compileFinal preprocessFileLineNumbers "feats\mods\tfar\assetInd.sqf";
	};
	[[],[]]
};

TFAR_SR = (_r select 1);

TFAR_LR = (_r select 0);

//those are needed client side by radioFreq and va (when filtered)
publicVariable "TFAR_SR";
publicVariable "TFAR_LR";

[TFAR_LR, TFAR_SR, [], []] call mods_fnc_implentArsenal;