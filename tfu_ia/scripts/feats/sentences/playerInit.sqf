/*
@filename: feats\sentences\playerInit.sqf
Author:
	Ben
Description:
	run on player
	enable or disable the radio transmissions to heard or seen on screen
*/

enableSentences ([false, true] select (["sentences"] call core_fnc_getParam));