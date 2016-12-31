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
if ( (["radioFreq"] call core_fnc_getConf) == 0 ) exitWith{};

[] spawn {
	if ( call TFAR_fnc_haveSWRadio ) then { 
		for "_i" from 1 to 999 do {
			private _cur = format["tf_rf7800str_%1", _i];
			if ( (call TFAR_fnc_activeSwRadio) == _cur ) exitWith {
				player unlinkItem _cur;
				private _radio = [(TFAR_OPFOR_SR select 0), (TFAR_BLUFOR_SR select 0)] select ( PLAYER_SIDE isEqualTo west );
				player linkItem _radio;
			};
		};
		sleep 3;
		call radioFreq_fnc_setShortRange;
		
	};
	if ( call TFAR_fnc_haveLRRadio ) then { call radioFreq_fnc_setLongRange; };
};