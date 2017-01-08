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
	if ( call TFAR_fnc_haveSWRadio ) then {
		private _radio = call TFAR_fnc_activeSwRadio;
		private _found = false;
		{
			if ( ([_radio, _x] call TFAR_fnc_isSameRadio)) exitWith {
				_found = true;
			};
		} count TFAR_SR;
		if ( !_found ) then {
			player unlinkItem _radio;
			player linkItem (TFAR_SR select 0);
		};
		waitUntil {		
			sleep 0.5;
			( count ([true, (TFAR_SR select 0)] call radioFreq_fnc_searchRadios) == 0);
		};
		sleep 2;
		call radioFreq_fnc_setShortRange;
		
	};
	if ( call TFAR_fnc_haveLRRadio ) then { 
		call radioFreq_fnc_setLongRange; 
	};
};