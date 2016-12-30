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

private _checkDelay = ["ia", "checkDelay"] call BIS_fnc_GetCfgData;
private _cooldown = ["ia", "fob", "cooldown"] call BIS_fnc_GetCfgData;

private _missions = [];

if ( isNil "SIDE_EH" ) then {
	SIDE_EH = "SIDE_success" addPublicVariableEventHandler { SIDE_success = true; };
};

while { true } do {
	
	[false, "SIDE_stop"] call zeusMission_fnc_checkAndWait;
	[_cooldown, _checkDelay, "SIDE_stop"] call common_fnc_smartSleep;
	if ( SIDE_stop ) exitWith {};
	if ( (count _missions) == 0 ) then {
		_missions = ["ia", "side", "missions"] call BIS_fnc_GetCfgData;
	};
	private _type = selectRandom _missions;
	_missions = _missions - [_type];
	private _fncName = format["SIDE_fnc_%1", _type];
	
	SIDE_main = [] spawn _fncName;
	waitUntil {
		sleep _checkDelay;
		scriptDone SIDE_main
	};
	SIDE_success = false;
};