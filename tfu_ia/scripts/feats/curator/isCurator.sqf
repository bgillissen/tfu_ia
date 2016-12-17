/*
@filename: feats\curator\isCurator.sqf
Author:
	Ben
Description:
	run server/player side.
	tell if the given player is in the allowed curator list
*/

param ["_player"];
private ["_out"];

_out = false;

{
	if ( _x != getPlayerUID _player ) then exitWith{ _out = true; }
} forEach(curatorUIDs);

_out