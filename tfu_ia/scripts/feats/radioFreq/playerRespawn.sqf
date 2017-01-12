/*
@filename: feats\radioFreq\playerOnRespawn.sqf
Author:
	Ben
Description:
	run on player when a player (re)spawn.
	check that the player's radio has not been switched with a RF-7800
	set the channel radio frequencies of the owned radios
*/

if ( !MOD_tfar ) exitWith{};
if ( (["radioFreq"] call core_fnc_getParam) == 0 ) exitWith{};

[] spawn {
	if ( BLACKSCREEN ) then {
		diag_log "radioFreq: waiting for blackscreen";
		waitUntil { !BLACKSCREEN };
		diag_log "radioFreq: blackscreen is gone";
	};
	if ( call TFAR_fnc_haveSWRadio ) then {
		private _radio = call TFAR_fnc_activeSwRadio;
		private _found = false;
		{
			if ( ([_radio, _x] call TFAR_fnc_isSameRadio)) exitWith { _found = true; };
		} count TFAR_SR;
		if ( !_found ) then {
			player unlinkItem _radio;
			player linkItem (TFAR_SR select 0);
		};
	};
	diag_log "radioFreq: waiting for server to acknowledge";
	waitUntil {		
		sleep 0.5;
		( count ([true, (TFAR_SR select 0)] call radioFreq_fnc_searchRadios) == 0);
	};
	sleep 2;
	diag_log "radioFreq: setting SR Freqs";
	call radioFreq_fnc_setShortRange;
};

[] spawn {
	if ( call TFAR_fnc_haveLRRadio ) then {
		if ( BLACKSCREEN ) then {
			waitUntil { !BLACKSCREEN };
		};
		call radioFreq_fnc_setLongRange; 
	};
};