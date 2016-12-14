/*
@filename: common\globalHint.sqf
Author:
	unknown, taken from ahoyworld I&A
Description:
	used to send formated globalHint
*/

param["_hint"];

hint parseText format["%1", _hint];