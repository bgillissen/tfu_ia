/*
@filename: feats\mods\apex\init.sqf
Author:
	Ben
Description:
	run on server.
	implent apex assets
*/

private _c = call compileFinal preprocessFileLineNumbers "feats\mods\apex\assetCommon.sqf";
private _o = call compileFinal preprocessFileLineNumbers "feats\mods\apex\assetOpfor.sqf";
private _b = call compileFinal preprocessFileLineNumbers "feats\mods\apex\assetBlufor.sqf";
private _i = call compileFinal preprocessFileLineNumbers "feats\mods\apex\assetInd.sqf";

private _data = [["AC", _c, [east, west, indepedent],
                 ["AO", _o, [east]],
                 ["AB", _b, [west]],
                 ["AI", _i, [independent]]];

["apex", _data] call mods_fnc_implent;