/*
@filename: feats\curator\serverRespawn.sqf
Author:
	Ben
Description:
*/

params ["_player"];

[[_player], false] call curator_fnc_addEditable;

_player spawn {
	private _puid = (getPlayerUID _this);
	{
		_x params ["_uid", "_slot"];
		if ( _uid isEqualTo _puid ) exitWith {
			private _gm = missionNamespace getVariable format["zeus_%1", _slot];
			diag_log format["Player was assigned, reassigning %1 to %2", _this, _slot];
			unassignCurator _gm;
			sleep 2;
			_this assignCurator _gm;
			_x set [2, _this];
			curatorAssigned set[_forEachIndex, _x];
			publicVariable "curatorAssigned";
		};
	} forEach curatorAssigned;
};