/*
@filename: feats\ia\SIDE\serverPostInitThread.sqf
Author:
	Ben
Description:
	this run on server,
	it keep track of the active SIDE mission thread, and spawn a new one when needed 
*/
if ( (["SIDE"] call core_fnc_getConf) == 0 ) exitWith {};

SIDE_stop = false;
SIDE_success = false;
publicVariable "SIDE_success";

private _checkDelay = ["ia", "checkDelay"] call BIS_fnc_GetCfgData;
private _cooldown = ["ia", "fob", "cooldown"] call BIS_fnc_GetCfgData;

private _missions = [];

if ( isNil "SIDE_EH" ) then {
	SIDE_EH = "SIDE_success" addPublicVariableEventHandler { SIDE_success = true; };
};

while { true } do {
	
	diag_log "<<<<<<<<<<<<<<<<<<< check and wait";
	[false, "SIDE_stop"] call zeusMission_fnc_checkAndWait;
	if ( SIDE_stop ) exitWith {};
	diag_log "<<<<<<<<<<<<<<<<<<< no SIDE_stop, no zeusMission";
	if ( (count _missions) == 0 ) then {
		_missions = ["ia", "side", "missions"] call BIS_fnc_GetCfgData;
	};
	//private _type = selectRandom _missions;
	_type = "secure";
	_missions = _missions - [_type];
	private _fncName = format["SIDE_fnc_%1", _type];
	private _code = format["[] spawn SIDE_fnc_%1", _type];
	diag_log format["<<<<<<<<<<<<<<<<<<< %1", _code];
	//SIDE_main = call compile _code;
	SIDE_main = [] spawn SIDE_fnc_secure;
	diag_log SIDE_main;
	waitUntil {
		sleep _checkDelay;
		scriptDone SIDE_main
	};
	diag_log "SIDE_main has finished";
	SIDE_success = false;
	publicVariable "SIDE_success";
	if ( !zeusMission ) then {
		diag_log format["<<<<<<<<<<<<<<<<<<< smart sleep (%1min)", _cooldown / 60];
		[_cooldown, _checkDelay, "SIDE_stop"] call common_fnc_smartSleep;
		if ( SIDE_stop ) exitWith {};
	};
};