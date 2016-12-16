/*
@filename: feats\radioFreq\playerOnRespawn.sqf
Author:
	Ben
Description:
	called on player side when a player (re)spawn.
	check that the player's radio has not been switched with one RF-7800
	set the channel radio frequencies of the owned radios
*/

#ifdef MOD_tfar

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

if ( call TFAR_fnc_haveSWRadio ) then { call radioFreq_fnc_setShortRange; };
if ( call TFAR_fnc_haveLRRadio ) then { call radioFreq_fnc_setLongRange; };

#endif