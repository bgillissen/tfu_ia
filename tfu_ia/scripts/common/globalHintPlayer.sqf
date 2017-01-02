/*
@filename: common\globalHint.sqf
Author:
	unknown, taken from ahoyworld I&A
Description:
	run on player (local hint) and server (global hint)
	used to send formated hint
*/

params ["_hint"];

hint parseText format["%1", _hint];