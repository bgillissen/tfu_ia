/*
@filename: feats\voiceControl\player.sqf
Credit:
	KiloSwiss
Author:
	Ben
Description:
	This script is used to register the events needed to trigger an alarm sound when player try to speak in an unauthorized channel.
*/

private ["_uid"];

if ( PARAMS_voiceControl == 0 ) then exitWith{};

_uid = getPlayerUID player;

VC_isOn = false;
VC_currentTxt = "";
VC_channelId = -1;

[_uid] execVM "feats\voiceControl\thread.sqf";

waitUntil { !isNull findDisplay 46 };

findDisplay 46 displayAddEventHandler ["KeyDown", voiceControl_fnc_keyDown];
findDisplay 46 displayAddEventHandler ["KeyUp", voiceControl_fnc_keyUp];
findDisplay 46 displayAddEventHandler ["MouseButtonDown", voiceControl_fnc_keyDown];
findDisplay 46 displayAddEventHandler ["MouseButtonUp", voiceControl_fnc_keyUp];
findDisplay 46 displayAddEventHandler ["JoystickButton", voiceControl_fnc_keyDown];