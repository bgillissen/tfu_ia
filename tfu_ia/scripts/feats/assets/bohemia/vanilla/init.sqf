/*
@filename: feats\assets\bohemia\vanilla\init.sqf
Author:
	Ben
Description:
	run on server.
	implent vanilla assets
*/

private _data = [["VC", (call vanilla_fnc_common), [0, 1, 2], false],
                 ["VO", (call vo_fnc_assets), [0]],
                 ["VB", (call vb_fnc_assets), [1]],
                 ["VI", (call vi_fnc_assets), [2]]];

["vanilla", _data] call assets_fnc_implent;