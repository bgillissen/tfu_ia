/*
@filename: feats\curator\isAssigned.sqf
Author:
	Ben
Description:
	run server/player side.
	tell if the given player is assigned to a curator module.
*/

params ["_player"];
private ["_out"];

_out = false;

{
	if ( _x select 0 == getPlayerUID _player) exitWith { _out = true; };
} forEach(curatorAssigned);

_out