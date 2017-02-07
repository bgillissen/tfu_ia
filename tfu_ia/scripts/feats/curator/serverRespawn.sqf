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
		_x set [2, _player];
		curatorAssigned set[_forEachIndex, _x];
	};
} forEach curatorAssigned;


[_player, false] call curator_fnc_addEditable;