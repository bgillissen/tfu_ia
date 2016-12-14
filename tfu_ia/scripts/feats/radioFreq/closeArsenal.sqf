/*
@filename: feats\radioFreq\setShortRange.sqf
Author:
	Ben
Description:
	define the radio channel frequencies when the player leave of the arsenal
*/

if ( !( isNil { _this getVariable "VAcatch" } ) && { !( isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] ) ) } ) then { 
	_this setVariable [ "VAcatch", nil ];
    _thread = _this spawn { 
    waitUntil { isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] )  };
    sleep 2;
	if ( call TFAR_fnc_haveLRRadio ) then { call radioFreq_fnc_setLongRange; };
	sleep 2;
	if ( call TFAR_fnc_haveSWRadio ) then { call radioFreq_fnc_setShortRange; }; 
	_this setVariable [ "VAcatch", "VAcatch" ]; 
};