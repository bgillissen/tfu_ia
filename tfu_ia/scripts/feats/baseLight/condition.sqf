/*
@filename: feats\baseLight\condition.sqf
Author:
	Ben
Description:
	run on player,
*/

private _rank = (["baseLight", "rank"] call core_fnc_getSetting);
private _prank = player getVariable ["MD_rank", 0];

(_prank >= _rank)