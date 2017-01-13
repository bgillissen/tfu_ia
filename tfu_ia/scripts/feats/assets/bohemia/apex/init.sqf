/*
@filename: feats\assets\bohemia\apex\init.sqf
Author:
	Ben
Description:
	run on server.
	implent vanilla assets
*/

private _data = [["AC", (call apex_fnc_common), [0, 1, 2], false],
                 ["AO", (call apexOpfor_fnc_assets), [0]],
                 ["AB", (call apexBlufor_fnc_assets), [1]],
                 ["AI", (call apexInd_fnc_assets), [2]]];

["apex", _data] call assets_fnc_implent;
