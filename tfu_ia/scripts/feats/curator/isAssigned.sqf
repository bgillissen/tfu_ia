/*
@filename: feats\curator\isAssigned.sqf
Author:
	Ben
Description:
	run server/player side.
	tell if the given player is assigned to a curator module.
*/

params ["_player"];

private _puid = (getPlayerUID _player);

private _out = false;
{
	_x params ["_uid"];
	if ( _uid isEqualTo _puid) exitWith { _out = true; };
} forEach(curatorAssigned);

_out