/*
@filename: common\globalSideChat.sqf
Author:
	unknown, taken from ahoyworld I&A
Description:
	used to send message on the side channel globaly
*/

param ["_from", "_message"];

[WEST,"_from"] sideChat _message;