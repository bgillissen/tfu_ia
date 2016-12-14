/*
@filename: feats\voiceControl\event.sqf
Credit:
	KiloSwiss
Author:
	Ben
Description:
	must be spawn, not called.
	This script is used to trigger an alarm sound when player try to speak in an unauthorized channel.
*/

param ["_currentTxt"];

VC_currentTxt = _currentTxt;
VC_channelId = [VC_currentTxt] call voiceControl_fnc_channelId;
if ((VC_channelId select 1) >= 0 && !((VC_channelId select 1) in VC_allowed)) then {
	playSound "Alarm";
	cutText[format[VC_message, (VC_channelId select 0), actionKeysNames ["nextChannel",1], actionKeysNames ["prevChannel",1]], "PLAIN", 1];
	setCurrentChannel 5;
};