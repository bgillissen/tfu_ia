/*
@filename: feats\assets\bohemia\apex\init.sqf
Author:
	Ben
Description:
	run on server.
	implent vanilla assets
*/

private _data = [["AC", (call apex_fnc_common), [0, 1, 2], false],
                 ["AO", (call apex_fnc_opfor), [0]],
                 ["AB", (call apex_fnc_blufor), [1]],
                 ["AI", (call apex_fnc_ind), [2]]];

["apex", _data] call assets_fnc_implent;
