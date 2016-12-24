/*
@filename: feats\radioFreq\setLongRange.sqf
Author:
	Ben
Description:
	define the channel Frequencies for the active long range radio
*/

private _radio = call TFAR_fnc_activeLrRadio; 
{
	[_radio, (_forEachIndex + 1), _x] call TFAR_fnc_SetChannelFrequency;
} forEach RF_LR_FREQS;