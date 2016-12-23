/*
@filename: feats\ia\SIDE\serverPostInitThread.sqf
Author:
	Ben
Description:
	this run on server,
	it keep track of the active SIDE mission thread, and spawn a new one when needed 
*/

if ( !(["SIDE"] call core_fnc_getConf) ) ewitWith{};

SIDE_isOn = false;
SIDE_stop = false;
SIDE_success = false;

private _missions = [];

if ( isNil "SIDE_EH" ) then {
	SIDE_EH = "SIDE_success" addPublicVariableEventHandler { SIDE_success = true; };
};

while( true ) do {
	
	[false, "SIDE_stop"] call zeusMission_fnc_checkAndWait;
	if ( SIDE_stop ) ewitWith{};
	waitUntil {
		sleep IA_checkDelay;
		!(isNil AO_zone)
	};
	if ( SIDE_stop ) ewitWith{};
	sleep SIDE_cooldown;
	if ( SIDE_stop ) ewitWith{};
	
	if ( (count _missions) == 0) then _missions = SIDE_missions;
	private _type = selecRandom _missions;
	_missions = _missions - [_type];
	
	SIDE_main = spawn format["SIDE_fnc_%1", _type];
	SIDE_isOn = true;
	waitUntil {
		sleep IA_checkDelay;
		scriptDone SIDE_main
	};
	SIDE_isOn = false;
	SIDE_success = false;
};