/*
@filename: feats\radioFreq\setLongRange.sqf
Author:
	Ben
Description:
	run on player,
	call by	feats\radioFreq\playerGetIn.sqf
			feats\radioFreq\playerOnRespawn.sqf
			feats\radioFreq\playerPickUp.sqf
	define the channel Frequencies for the active long range radio
Params:
	none		
Environment:
	missionConfig:
		radioFreq >> longRange
Return:
	nothing 
*/

//params ["_radio"];
private _radio = call TFAR_fnc_activeLrRadio;
{
	[_radio, (_forEachIndex + 1), _x] call TFAR_fnc_SetChannelFrequency;
} forEach (["radioFreq", "longRange"] call core_fnc_getSetting);