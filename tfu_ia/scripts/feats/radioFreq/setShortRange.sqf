/*
@filename: feats\radioFreq\setShortRange.sqf
Author:
	Ben
Description:
	define the channel Frequencies for the active short range radio
*/

private ["_radio"];

_radio = call TFAR_fnc_activeSwRadio;
[_radio, 1, RF_SR_FREQ_1] call TFAR_fnc_SetChannelFrequency;
[_radio, 2, RF_SR_FREQ_2] call TFAR_fnc_SetChannelFrequency;
[_radio, 3, RF_SR_FREQ_3] call TFAR_fnc_SetChannelFrequency;
[_radio, 4, RF_SR_FREQ_4] call TFAR_fnc_SetChannelFrequency;
[_radio, 5, RF_SR_FREQ_5] call TFAR_fnc_SetChannelFrequency;
[_radio, 6, RF_SR_FREQ_6] call TFAR_fnc_SetChannelFrequency;
[_radio, 7, RF_SR_FREQ_7] call TFAR_fnc_SetChannelFrequency;
[_radio, 8, RF_SR_FREQ_8] call TFAR_fnc_SetChannelFrequency;	