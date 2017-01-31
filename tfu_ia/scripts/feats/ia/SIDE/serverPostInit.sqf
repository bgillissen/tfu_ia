/*
@filename: feats\ia\SIDE\serverPostInitThread.sqf
Author:
	Ben
Description:
	this run on server,
	it keep track of the active SIDE mission thread, and spawn a new one when needed 
*/

if ( (["sideMission"] call core_fnc_getParam) == 0 ) exitWith {};

SIDE_stop = false;
SIDE_success = false;
publicVariable "SIDE_success";

private _checkDelay = ["ia", "checkDelay"] call core_fnc_getSetting;
private _cooldown = ["ia", "side", "cooldown"] call core_fnc_getSetting;

private _missions = [];

if ( isNil "SIDE_EH" ) then {
	SIDE_EH = "SIDE_success" addPublicVariableEventHandler { SIDE_success = true; };
};

while { true } do {
	[false, "SIDE_stop"] call zeusMission_fnc_checkAndWait;
	if ( SIDE_stop ) exitWith {};
	if ( (count _missions) == 0 ) then {
		_missions = ["ia", "side", "missions"] call core_fnc_getSetting;
	};
	//private _type = selectRandom _missions;
	private _type = "intel";
	_missions = _missions - [_type];
	private _fncName = format["SIDE_fnc_%1", _type];
	private _code = compile format["[] spawn SIDE_fnc_%1", _type];
	SIDE_main = call _code;
	waitUntil {
		sleep _checkDelay;
		scriptDone SIDE_main
	};
	diag_log format["SIDE FINISHED --- %1", SIDE_main];
	SIDE_success = false;
	publicVariable "SIDE_success";
	if ( !zeusMission ) then {
		[_cooldown, _checkDelay, "SIDE_stop"] call common_fnc_smartSleep;
		if ( SIDE_stop ) exitWith {};
	};
};