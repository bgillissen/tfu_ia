/*
@filename: common\globalNotification.sqf
Author:
	unknown, taken from ahoyworld I&A
Description:
	run on server
	used to ask players to display a notification
*/

_this remoteExec ["common_fnc_globalNotificationPlayer", PLAYER_SIDE, false];