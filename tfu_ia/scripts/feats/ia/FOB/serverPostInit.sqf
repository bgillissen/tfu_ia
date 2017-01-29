/*
@filename: feats\ia\FOB\serverPostInitThread.sqf
Author:
	Ben
Description:
	this run on server,
	it keeps track of the active FOB thread, and spawn a new one when needed 
*/

if ( (["FOB"] call core_fnc_getParam) == 0 ) exitWith {};

FOB_stop = false;
FOB_deployed = [];
FOB_main = nil;

private _checkDelay = ["ia", "checkDelay"] call core_fnc_getSetting;
private _cooldown = ["ia", "fob", "cooldown"] call core_fnc_getSetting;
private _markers = [];
private _types = [];

while { true } do {
	
	[false, "FOB_stop"] call zeusMission_fnc_checkAndWait;
	[_cooldown, _checkDelay, "FOB_stop"] call common_smartSleep;
	if ( FOB_stop ) exitWith {};
	waitUntil {
		sleep _checkDelay;
		( !(isNil AO_zone) && (count (FOB_markers select AO_zone) != 0 ) )
	};
	if ( FOB_stop ) exitWith {};
	if ( count _markers == 0 ) then {
		_markers = FOB_markers select AO_zone;
	};
	if ( count _types == 0 ) then {
		_types = ["ia", "fob", "pool"] call core_fnc_getSetting;
	};
	if ( count _markers > 0 ) then {
		
		if ( isNil (FOB_deployed select AO_zone) ) then {
			FOB_deployed set [AO_zone, []];
		};
		private _pool = [];
		{
			if ( !(_x in (FOB_deployed select AO_zone)) ) then { _pool append [_x]; };
		} count _markers;
	
		if ( count _pool > 0 ) then {
			private _marker =  selectRandom _pool;
			_markers = _markers - [_marker];
	
			private _type = selectRandom _types;
			_types = _types -[_type];
			FOB_main = [_marker, _type, AO_zone] spawn FOB_fnc_thread;
			waitUntil {
				sleep _checkDelay;
				scriptDone FOB_main
			};
		};
	};
};