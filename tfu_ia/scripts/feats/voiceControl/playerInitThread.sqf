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

if ( !(["voiceControl"] call core_fnc_getConf)) exitWith {};

VC_isOn = false;
VC_currentTxt = "";
VC_channelId = -1;

waitUntil { !isNull findDisplay 46 };

findDisplay 46 displayAddEventHandler ["KeyDown", voiceControl_fnc_keyDown];
findDisplay 46 displayAddEventHandler ["KeyUp", voiceControl_fnc_keyUp];
findDisplay 46 displayAddEventHandler ["MouseButtonDown", voiceControl_fnc_keyDown];
findDisplay 46 displayAddEventHandler ["MouseButtonUp", voiceControl_fnc_keyUp];
findDisplay 46 displayAddEventHandler ["JoystickButton", voiceControl_fnc_keyDown];

private _uid = getPlayerUID player;

while { true } do { 
	
	if( _uid in VC_adminList ) then {
		VC_allowed = VC_admins;
	} else {
		if( serverCommandAvailable "#logout" ) then {
			VC_allowed = VC_admins;
		} else {
			if(count units group player == 1) then {
				VC_allowed = VC_players;
			} else {
				if(player != leader group player) then {
					VC_allowed = VC_players;
				} else {
					VC_allowed = VC_groupleader;
					if(vehicle player != player && effectiveCommander (vehicle player) == player) then {
						VC_allowed = VC_allowed + [2]; 
					};                                                                    
				};
			};
		};
	};

	if( isNil "VC_open" ) then { VC_open = [] };
	if !(VC_open isEqualTo VC_allowed) then {
		for "_i" from 0 to 6 do {
			_i enableChannel [true, ([false, true] select ( (_i in VC_allowed) && !(_i in VC_disabled) ) )];
			//_i enableChannel ( if (_i in VC_allowed) then [ {true},{if(_i in VC_disabled)then [{false},{true}] }] );
		};
		VC_open = VC_allowed;
	};
	sleep VC_loopDelay;
};