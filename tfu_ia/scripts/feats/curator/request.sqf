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

if ( [_player] call curator_fnc_isAssigned ) exitWith {
	[_player, "You have already ascended!"] call common_fnc_systemChat;
};

if ( count curatorAssigned >= TOT_CURATOR) exitWith {
	_msg = ["curator", "noSlotMsg"] call core_fnc_getSetting;
	[_player, format[_msg, (count curatorAssigned), _totSlot]] call common_fnc_systemChat;
};

if ( !([_player] call curator_fnc_isCurator) ) exitWith {
	_msg = ["curator", "failedMsg"] call core_fnc_getSetting;
	[PLAYER_SIDE, "HQ", format[_msg, (name _player)]] call common_fnc_globalSideChatServer;
};

private "_freeslot";

for "_curSlot" from 0 to (TOT_CURATOR - 1) do {
	private _inuse = false;
	{
		if ( _x select 1 == _curSlot) then { _inuse = true; };
	} count curatorAssigned;
	if ( !_inuse ) then { _freeSlot = _curSlot };
};

private _gm = missionNamespace getVariable format["zeus_%1", _freeSlot];
_player assignCurator _gm;

curatorAssigned append [[(getPlayerUID _player), _freeSlot, _player]];

publicVariable "curatorAssigned";

//(owner _player) publicVariableClient "curatorAssigned";

if ( !isDedicated ) then { 
	isAssigned = [player] call curator_fnc_isAssigned; 
};

_msg = ["curator", "ascendMsg"] call core_fnc_getSetting;
[PLAYER_SIDE, "HQ", format[_msg, (count curatorAssigned), (TOT_CURATOR + 1), (name _player)]] call common_fnc_globalSideChatServer;