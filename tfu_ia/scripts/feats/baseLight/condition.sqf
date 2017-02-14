/*
@filename: feats\baseLight\condition.sqf
Author:
	Ben
Description:
	run on player,
*/
params ["_state"];

if ( baseLight isEqualTo _state ) exitWith { false };

private _rank = (["baseLight", "rank"] call core_fnc_getSetting);
private _prank = (player getVariable ["MD_rank", 0]);

//diag_log format["baseLight condition : %1 --- rank: %2 --- prank: %3", (_prank >= _rank), _rank, _prank];

( _prank >= _rank )