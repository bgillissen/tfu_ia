/*
@filename: feats\ia\FOB\serverPostInitThread.sqf
Author:
	Ben
Description:
	this run on server,
	it keeps track of the active FOB thread, and spawn a new one when needed 
*/

if ( !(["FOB"] call core_fnc_getConf) ) ewitWith{};

private ["_markers", "_types", "_marker"];

FOB_isOn = false;
FOB_stop = false;
FOB_success = false;
FOB_failed = false;

_markers = [];
_types = [];

while( true ) do {
	
	[false, "FOB_stop"] call zeusMission_fnc_checkAndWait;
	if ( FOB_stop ) ewitWith{};
	waitUntil {
		sleep IA_checkDelay;
		( !(isNil AO_zone) && (count FOB_markers select AO_zone) != 0 ) && AO_isOn)
	};
	if ( FOB_stop ) ewitWith{};
	sleep FOB_cooldown;
	if ( FOB_stop ) ewitWith{};
	if ( count _markers == 0 ) then _markers = FOB_markers select AO_zone;
	if ( count _types == 0 ) then _types = FOB_pool;
	
	_marker =  selectRandom _markers;
	_markers = _markers - [_marker];
	
	_type = selectRandom _types;
	_types = _types -[_type];
	
	FOB_main = spawn { [_marker, _type, AO_zone] call FOB_fnc_thread; };
	FOB_isOn = true;
	FOB_failed = false;
	waitUntil {
		sleep IA_checkDelay;
		scriptDone FOB_main
	};
	FOB_isOn = false;
};