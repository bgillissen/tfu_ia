/*
@filename: common\global\notification.sqf
Description:
	run on server
	used to ask players to display a notification
*/

_this remoteExec ["global_fnc_notificationPlayer", 0, false];