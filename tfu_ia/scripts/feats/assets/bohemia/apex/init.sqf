/*
@filename: feats\assets\bohemia\apex\init.sqf
Author:
	Ben
Description:
	run on server.
	implent vanilla assets
*/

private _data = [["AC", (call apex_fnc_common), [0, 1, 2], false],
                 ["AO", (call ao_fnc_assets), [0]],
                 ["AB", (call ab_fnc_assets), [1]],
                 ["AI", (call ai_fnc_assets), [2]]];

["apex", _data] call assets_fnc_implent;
