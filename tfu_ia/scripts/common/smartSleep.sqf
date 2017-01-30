/*
@filename: common\smartSleep.sqf
Author:
	Ben
Description:
	this run on server,
	it waits for given duration or the given _code return true,
	it checks each _checkDelay
*/

params [["_duration", 30], ["_checkDelay", 10], ["_condition", "false"]];

private _end = (time + _duration);
private _code = compile _condition;

waitUntil {
	sleep _checkDelay;
	if ( call _code ) exitWith {};
	(time > _end);
};