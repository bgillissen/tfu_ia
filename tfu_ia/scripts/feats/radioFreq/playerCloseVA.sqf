/*
@filename: feats\radioFreq\playerPickUp.sqf
Author:
	Ben
Description:
	run on player when player exit the VirtualArsenal
*/

if ( !MOD_tfar ) exitWith{};
if ( (["radioFreq"] call core_fnc_getParam) == 0 ) exitWith{};

[] spawn {
	waitUntil {		
		sleep 0.5;
		( count ([true] call radioFreq_fnc_searchRadios) == 0);
	};
	sleep 2;
	if ( call TFAR_fnc_haveSWRadio ) then { call radioFreq_fnc_setShortRange; };
	if ( call TFAR_fnc_haveLRRadio ) then { call radioFreq_fnc_setLongRange; };
};