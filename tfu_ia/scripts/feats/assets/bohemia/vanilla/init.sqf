/*
@filename: feats\assets\bohemia\vanilla\init.sqf
Author:
	Ben
Description:
	run on server.
	implent vanilla assets
*/

private _data = [["VC", (call vanilla_fnc_common), [0, 1, 2], false],
                 ["VO", (call vanilla_fnc_opfor), [0]],
                 ["VB", (call vanilla_fnc_blufor), [1]],
                 ["VI", (call vanilla_fnc_ind), [2]]];

["vanilla", _data] call assets_fnc_implent;