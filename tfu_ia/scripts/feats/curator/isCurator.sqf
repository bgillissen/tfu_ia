/*
@filename: feats\curator\isCurator.sqf
Author:
	Ben
Description:
	run server/player side.
	tell if the given player is in the allowed curator list
*/

params ["_player"];

( (getPlayerUID _player) in curatorUIDs )
/*
{
	if ( _x == (getPlayerUID _player) ) exitWith { true };
} count curatorUIDs;

false*/