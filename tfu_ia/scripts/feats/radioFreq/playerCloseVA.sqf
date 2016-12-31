/*
@filename: feats\radioFreq\playerPickUp.sqf
Author:
	Ben
Description:
	run on player when player exit the VirtualArsenal
*/

if ( !MOD_tfar ) exitWith{};
if ( (["radioFreq"] call core_fnc_getConf) == 0 ) exitWith{};

if ( call TFAR_fnc_haveSWRadio ) then { call radioFreq_fnc_setShortRange; };
if ( call TFAR_fnc_haveLRRadio ) then { call radioFreq_fnc_setLongRange; };