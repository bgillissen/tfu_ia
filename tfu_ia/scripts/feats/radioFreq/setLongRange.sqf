/*
@filename: feats\radioFreq\setLongRange.sqf
Author:
	Ben
Description:
	define the channel Frequencies for the active long range radio
*/

private ["_radio"];

_radio = call TFAR_fnc_activeLrRadio; 
[_radio, 1, RF_LR_FREQ_1] call TFAR_fnc_SetChannelFrequency;
[_radio, 2, RF_LR_FREQ_2] call TFAR_fnc_SetChannelFrequency;
[_radio, 3, RF_LR_FREQ_3] call TFAR_fnc_SetChannelFrequency;
[_radio, 4, RF_LR_FREQ_4] call TFAR_fnc_SetChannelFrequency;
[_radio, 5, RF_LR_FREQ_5] call TFAR_fnc_SetChannelFrequency;
[_radio, 6, RF_LR_FREQ_6] call TFAR_fnc_SetChannelFrequency;
[_radio, 7, RF_LR_FREQ_7] call TFAR_fnc_SetChannelFrequency;
[_radio, 8, RF_LR_FREQ_8] call TFAR_fnc_SetChannelFrequency;
[_radio, 9, RF_LR_FREQ_9] call TFAR_fnc_SetChannelFrequency;