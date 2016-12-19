/*
@filename: feats\curator\srvRequest.sqf
Author:
	Ben
Description:
	this script is executed server side when a player want to become zeus
	check if player is we got a free slot, then if player is one of our allowed curators 
	if so, search for a free slot and assign it to him.
*/ 
params ["_player"];
private ["_granted", "_curslot", "_inuse", "_freeSlot"];

if ( [_player] call curator_fnc_isAssigned ) then exitWith{};

if ( count curatorAssigned >= CURATOR_slot) then {
	exitWith{ 
		format[CURATOR_noSlotMsg,(count curatorAssigned), CURATOR_slot] remoteExec ["systemChat", _player, false];
	};
};

if ( !()[_player] call curator_fnc_isCurator) ) then {
	["HQ", [format[CURATOR_failedMsg, name _player]] common_fnc_globalChat;
};

for ("_curSlot" from 0 to CURATOR_slot) do {
	_inuse = false;
	{
		if ( _x select 1 == _curSlot) then exitWith{ _inuse = true; };
	} forEach(curatorAssigned);
	if ( !_inuse ) then exitWith{ _freeSlot = _curSlot };
};
	
_player assignCurator (missionNamespace getVariable format["zeus_%1", _freeSlot]);
curatorAssigned append [_x, _freeSlot];
publicVariable "curatorAssigned";

["HQ", [format[CURATOR_ascendMsg, (count curatorAssigned), CURATOR_slot, name _player]] common_fnc_globalChat;