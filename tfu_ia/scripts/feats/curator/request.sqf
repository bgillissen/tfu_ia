/*
@filename: feats\curator\request.sqf
Author:
	Ben
Description:
	this script is executed server side when a player want to become zeus
	check if we got a free slot, then if player is one of our allowed curators 
	if so, search for a free slot and assign it to him.
*/

params ["_player"];

if ( [_player] call curator_fnc_isAssigned ) exitWith {};

//private _totSlot = ["curator", "slot"] call BIS_fnc_getCfgData;
private _totSlot = TOT_CURATOR; 
		
if ( count curatorAssigned >= _totSlot) exitWith { 
	format[CURATOR_noSlotMsg, (count curatorAssigned), _totSlot] remoteExec ["systemChat", _player, false];
};

if ( !([_player] call curator_fnc_isCurator) ) then {
	["HQ", format[CURATOR_failedMsg, (name _player)]] call common_fnc_globalSideChat;
};

private "_freeslot";

for ("_curSlot" from 0 to (_totSlot-1)) do {
	_inuse = false;
	{
		if ( _x select 1 == _curSlot) exitWith{ _inuse = true; };
	} forEach(curatorAssigned);
	if ( !_inuse ) exitWith{ _freeSlot = _curSlot };
};
private _gm = missionNamespace getVariable format["zeus_%1", _freeSlot];
_player assignCurator _gm;
curatorAssigned append [[(getPlayerUID _player), _freeSlot]];
publicVariable "curatorAssigned";

["HQ", format[CURATOR_ascendMsg, (count curatorAssigned), _totSlot, (name _player)]] call common_fnc_globalSideChat;