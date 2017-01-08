/*
@filename: feats\assets\bohemia\vanilla\init.sqf
Author:
	Ben
Description:
	run on server.
	implent vanilla assets
*/

private _data = [["VC", (call vanilla_fnc_common), [east, west, independent], false],
                 ["VO", (call vanilla_fnc_opfor), [east]],
                 ["VB", (call vanilla_fnc_blufor), [west]],
                 ["VI", (call vanilla_fnc_ind), [independent]]];

["vanilla", _data] call assets_fnc_implent;