/*
@filename: mods\tfar\init.sqf
Author:
	Ben
Description:
	run on server,
	implent TFAR assets
*/

TFAR_SR = [];
TFAR_LR = [];

private _o = call compileFinal preprocessFileLineNumbers "feats\mods\tfar\assetOpfor.sqf";
private _b = call compileFinal preprocessFileLineNumbers "feats\mods\tfar\assetBlufor.sqf";
private _i = call compileFinal preprocessFileLineNumbers "feats\mods\tfar\assetInd.sqf";

{
	_x params ["_src", "_side"];
	if ( _side in ALLIES ) then {
		TFAR_LR append (_src select 0);
		TFAR_SR append (_src select 1);
	};
} count [[_o, east], [_b, west], [_i, independent]];

//those are needed client side by radioFreq and va (when filtered)
publicVariable "TFAR_SR";
publicVariable "TFAR_LR";

[TFAR_LR, TFAR_SR, [], []] call mods_fnc_implentArsenal;