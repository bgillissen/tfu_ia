/*
@filename: common\smartSleep.sqf
Author:
	Ben
Description:
	this run on server,
	it waits for given duration or the given _code return true,
	it checks each _checkDelay
*/

params ["_duration", "_checkDelay", "_condition"];

private _end = (time + _duration);
private _code = compile _condition;

waitUntil {
	sleep _checkDelay;
	if ( call _code ) ewitWith {};
	(time > _end)
};