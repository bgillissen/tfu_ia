/*
@filename: common\global\hintPlayer.sqf
Description:
	run on player (local hint) and server (global hint)
	used to send formated hint
*/

hint parseText format["%1", _this];