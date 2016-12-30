/*
@filename: feats\voiceControl\playerInit.sqf
Credit:
	KiloSwiss
Author:
	Ben
Description:
	run on player
	this is used to register the events needed to trigger an alarm sound when player try to speak in an unauthorized channel.
	it also keep the player's authorized channels updated,
	
*/

if ( (["voiceControl"] call core_fnc_getConf) == 0 ) exitWith {};

VC_isOn = false;
VC_currentTxt = "";
VC_channelId = -1;
VC_allowed = [];
VC_open = [];
VC_message = ["voiceControl", "message"] call BIS_fnc_GetCfgData;

waitUntil { !isNull findDisplay 46 };

findDisplay 46 displayAddEventHandler ["KeyDown", voiceControl_fnc_keyDown];
findDisplay 46 displayAddEventHandler ["KeyUp", voiceControl_fnc_keyUp];
findDisplay 46 displayAddEventHandler ["MouseButtonDown", voiceControl_fnc_keyDown];
findDisplay 46 displayAddEventHandler ["MouseButtonUp", voiceControl_fnc_keyUp];
findDisplay 46 displayAddEventHandler ["JoystickButton", voiceControl_fnc_keyDown];

private _uid = getPlayerUID player;

private _delay = ["voiceControl", "loopDelay"] call BIS_fnc_GetCfgData;
private _disabled = ["voiceControl", "disabled"] call BIS_fnc_GetCfgData;
private _players = ["voiceControl", "players"] call BIS_fnc_GetCfgData;
private _groupLeader = ["voiceControl", "groupLeader"] call BIS_fnc_GetCfgData;
private _admins = ["voiceControl", "admins"] call BIS_fnc_GetCfgData;
private _adminList = ["voiceControl", "adminList"] call BIS_fnc_GetCfgData;

while { true } do { 
	
	if( _uid in _adminList ) then {
		VC_allowed = _admins;
	} else {
		if( serverCommandAvailable "#logout" ) then {
			VC_allowed = _admins;
		} else {
			if(count units group player == 1) then {
				VC_allowed = _players;
			} else {
				if(player != leader group player) then {
					VC_allowed = _players;
				} else {
					VC_allowed = _groupLeader;
					if(vehicle player != player && effectiveCommander (vehicle player) == player) then {
						VC_allowed = VC_allowed + [2]; 
					};                                                                    
				};
			};
		};
	};

	if !(VC_open isEqualTo VC_allowed) then {
		for "_i" from 0 to 6 do {
			_i enableChannel [true, ([false, true] select ( (_i in VC_allowed) && !(_i in _disabled) ) )];
		};
		VC_open = VC_allowed;
	};
	sleep _delay;
};