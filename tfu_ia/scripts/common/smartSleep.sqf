/*
@filename: common\smartSleep.sqf
Author:
	Ben
Description:
	this run on server,
	it waits for given duration or the given _code return true,
	it checks each _checkDelay
*/

params [["_duration", 30], ["_checkDelay", 10], ["_condition", "false"], ["_ctxt", ""]];

private _end = (time + _duration);
private _code = compile _condition;

waitUntil {
	sleep _checkDelay;
	//diag_log format["smartSleep: %3 | %1 --- %2", (call _code), (time > _end), _ctxt];
	( (call _code) || (time > _end) );
};