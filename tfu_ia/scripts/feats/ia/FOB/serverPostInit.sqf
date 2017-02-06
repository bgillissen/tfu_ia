/*
@filename: feats\ia\FOB\serverPostInitThread.sqf
Author:
	Ben
Description:
	this run on server,
	it keeps track of the active FOB thread, and spawn a new one when needed 
*/

if ( (["FOBMission"] call core_fnc_getParam) == 0 ) exitWith {};

#define EMPTYARRAY []

FOB_stop = false;
FOB_deployed = [];
{
	FOB_deployed set [_forEachIndex, EMPTYARRAY];
} forEach AO_zones;

FOB_main = scriptNull;

private _checkDelay = ["ia", "checkDelay"] call core_fnc_getSetting;
private _cooldown = ["ia", "fob", "cooldown"] call core_fnc_getSetting;
private _markers = [];
private _types = [];

diag_log "FOB loop start";

while { true } do {
	diag_log "FOB inloop";
	[false, "FOB_stop"] call zeusMission_fnc_checkAndWait;
	if ( FOB_stop ) exitWith {};
	
	if ( (["AO"] call core_fnc_getParam) == 0 ) then {
		AO_zone = selectRandom AO_zones;
		AO_key = AO_zones find AO_zone;
	} else {
		diag_log "Waiting for an AO_zone with FOBS";
		waitUntil {
			sleep _checkDelay;
			private _out = false;
			if !( isNil "AO_zone") then {
				//diag_log format["Waiting for an AO_zone with FOBS: %1 (%2)", AO_zone, count getArray(AO_zone >> "fobs")];
				_out = ( (count getArray(AO_zone >> "fobs")) != 0 );
			};
			( _out || FOB_stop )
		};
		if ( FOB_stop ) exitWith {};
		AO_key = AO_zones find AO_zone;
	};
	
	if ( count _markers == 0 ) then {
		_markers = getArray(AO_zone >> "fobs");
		diag_log format["FOBS markers in active zone: %1 ", _markers];
	};
	if ( count _types == 0 ) then {
		_types = ["ia", "fob", "pool"] call core_fnc_getSetting;
	};
	if ( count _markers > 0 ) then {
		private _pool = [];
		{
			if !( _x in (FOB_deployed select AO_key) ) then { 
				_pool pushback _x; 
			};
		} forEach _markers;
	
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
	[_cooldown, _checkDelay, "FOB_stop"] call common_fnc_smartSleep;
	if ( FOB_stop ) exitWith {};
};