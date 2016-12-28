/*
@filename: feats\radioFreq\setShortRange.sqf
Author:
	Ben
Description:
	run on player,
	call by	feats\radioFreq\playerGetIn.sqf
			feats\radioFreq\playerOnRespawn.sqf
			feats\radioFreq\playerPickUp.sqf
	define the channel Frequencies for the active short range radio
Params:
	none		
Environment:
	missionConfig:
		radioFreq >> shortRange
Return:
	nothing 
*/

private _radio = call TFAR_fnc_activeSwRadio; 
{
	[_radio, (_forEachIndex + 1), _x] call TFAR_fnc_SetChannelFrequency;
} forEach (["radioFreq", "shortRange"] call BIS_fnc_GetCfgData);