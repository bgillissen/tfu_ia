/*
@filename: feats\tfar\player.sqf
Author:
	Ben
Description:
	run once on player side only,
	define needed functions,
	add eventHandlers to preset the radio frequencies when needed.
*/

#ifdef MOD_tfar

if ( PARAMS_radioFreqPreset == 0 ) then { exitWith{}; }; 

tfar_setLongRange = {
	_radio = call TFAR_fnc_activeLrRadio; 
	[_radio, 1, TFAR_LR_FREQ_1] call TFAR_fnc_SetChannelFrequency;
	[_radio, 2, TFAR_LR_FREQ_2] call TFAR_fnc_SetChannelFrequency;
	[_radio, 3, TFAR_LR_FREQ_3] call TFAR_fnc_SetChannelFrequency;
	[_radio, 4, TFAR_LR_FREQ_4] call TFAR_fnc_SetChannelFrequency;
	[_radio, 5, TFAR_LR_FREQ_5] call TFAR_fnc_SetChannelFrequency;
	[_radio, 6, TFAR_LR_FREQ_6] call TFAR_fnc_SetChannelFrequency;
	[_radio, 7, TFAR_LR_FREQ_7] call TFAR_fnc_SetChannelFrequency;
	[_radio, 8, TFAR_LR_FREQ_8] call TFAR_fnc_SetChannelFrequency;
	[_radio, 9, TFAR_LR_FREQ_9] call TFAR_fnc_SetChannelFrequency;	
};

tfar_setShortRange = {
	_radio = call TFAR_fnc_activeSwRadio;
	[_radio, 1, TFAR_SR_FREQ_1] call TFAR_fnc_SetChannelFrequency;
	[_radio, 2, TFAR_SR_FREQ_2] call TFAR_fnc_SetChannelFrequency;
	[_radio, 3, TFAR_SR_FREQ_3] call TFAR_fnc_SetChannelFrequency;
	[_radio, 4, TFAR_SR_FREQ_4] call TFAR_fnc_SetChannelFrequency;
	[_radio, 5, TFAR_SR_FREQ_5] call TFAR_fnc_SetChannelFrequency;
	[_radio, 6, TFAR_SR_FREQ_6] call TFAR_fnc_SetChannelFrequency;
	[_radio, 7, TFAR_SR_FREQ_7] call TFAR_fnc_SetChannelFrequency;
	[_radio, 8, TFAR_SR_FREQ_8] call TFAR_fnc_SetChannelFrequency;
};

tfar_boardIn = {
	_pos = _this select 0;
	_veh = _this select 1;		
	if ( _pos == "cargo" ) exitWith{}; 
	if ( _veh call TFAR_fnc_hasVehicleRadio ) then {
		_veh setVariable ["tf_side", "west", true];
		call tfar_setLongRange;
	}; 
}; 

tfar_pickUp = {
{
	_item = _this select 0; 
	if ( _item in TFAR_SR ) then {
		call tfar_setShortRange;
	} else {
		if ( _item in TFAR_LR ) then { call tfar_setLongRange; };
	}
};

tfar_closeArsenal = {
{ 
   	if ( !( isNil { _this getVariable "VAcatch" } ) && { !( isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] ) ) } ) then { 
       	_this setVariable [ "VAcatch", nil ];
       	_thread = _this spawn { 
           	waitUntil { isNull ( uiNamespace getVariable [ "BIS_fnc_arsenal_cam", objNull ] )  };
           	sleep 2;
			if ( call TFAR_fnc_haveLRRadio ) then { call tfar_setLongRange; };
			sleep 2;
			if ( call TFAR_fnc_haveSWRadio ) then { call tfar_setShortRange; }; 
			_this setVariable [ "VAcatch", "VAcatch" ];
       	}; 
   	};
};

tfar_onRespawn = {
	for "_i" from 1 to 999 do {
		scopeName "radioLoop";
		_cur = format["tf_rf7800str_%1",_i];
		if ( (call TFAR_fnc_activeSwRadio) == _cur ) then {
			player unlinkItem _cur;
			player linkItem "tf_anprc152";
			systemChat "RF-7800 replaced by an AN/RPC-152";
			breakOut "radioLoop";
		};
	};
	sleep 3;
	if ( call TFAR_fnc_haveSWRadio ) then { call tfar_setShortRange; };
	if ( call TFAR_fnc_haveLRRadio ) then { call tfar_setLongRange; };
};

//when player enter a vehicle
player addEventHandler ["GetInMan", {[_this select 1, _this select 2] call tfar_boardIn;}];

//when player pick up a radio from container
player addEventHandler ["Take", {[_this select 2] call tfar_pickUp;}]; 

//when a player close the arsenal	
player setVariable [ "VAcatch", [ "VAcatch", "onEachFrame", {call tfar_closeArsenal}, player ] call BIS_fnc_addStackedEventHandler ];

#endif