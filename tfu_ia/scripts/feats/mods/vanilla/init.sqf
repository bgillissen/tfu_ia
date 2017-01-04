/*
@filename: feats\mods\vanilla\init.sqf
Author:
	Ben
Description:
	run on server.
	implent vanilla assets
*/

private _c = call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\assetCommon.sqf";
private _o = call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\assetOpfor.sqf";
private _b = call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\assetBlufor.sqf";
private _i = call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\assetInd.sqf";

private _data = [["VC", _c, [east, west, independent], false],
                 ["VO", _o, [east]],
                 ["VB", _b, [west]],
                 ["VI", _i, [independent]]
                ];

["vanilla", _data] call mods_fnc_implent;