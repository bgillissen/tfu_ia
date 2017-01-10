/*
@filename: feats\curator\serverRespawn.sqf
Author:
	Ben
Description:
*/

params ["_player"];

private _puid = (getPlayerUID _player);

{
	_x params ["_uid", "_slot"];
	if ( _uid isEqualTo _puid) exitWith { 
		private _gm = missionNamespace getVariable format["zeus_%1", _slot];
		_player assignCurator _gm; 
	};
} forEach curatorAssigned;