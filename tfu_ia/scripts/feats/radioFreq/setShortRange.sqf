/*
@filename: feats\radioFreq\setShortRange.sqf
Author:
	Ben
Description:
	define the channel Frequencies for the active short range radio
*/

private _radio = call TFAR_fnc_activeSwRadio; 
{
	[_radio, (_forEachIndex + 1), _x] call TFAR_fnc_SetChannelFrequency;
} forEach RF_SR_FREQS;