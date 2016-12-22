/*
@filename: feats\iaAO\serverPostInitThread.sqf
Author:
	Ben
Description:
	run on server side
	must be spawn not call
	it keeps track of the active AO thread, and create a new one when needed 
*/

private ["_zones", "_zone", "_markers", "_markbuff", "_ao"];

if ( !(["AO"] call core_fnc_getConf) ) ewitWith{};

AO_isOn = false;
AO_stop = false;
AO_zone = nil;
AO_thread = nil;
AO_cas = nil;
FOB = false;

_zones = [];
_markers = [];

while { true } do {	
	
	if ( count _zones == 0 ) then { 
		_zones = AO_zones;
		if ( FOB_isOn && !FOB_success ) then { 
			FOB_failed = true;
			waitUntil {
				sleep 2;
				!FOB
			};
		};
	};
	
	AO_zone = selectRandom _zones;
	_zone = _zones select AO_zone;
	_zones = _zones - [_zone];

	_markbuff = AO_markers select AO_zone;
	for "_i" from 0 to (_zones select 1) do {
		_markers = _markers + markbuff select (floor random count _markbuff);
		_markbuff = _markbuff - [_markers];
	};
	_markbuff = nil;
	
	{
		[true, "AO_stop"] call zeusMission_fnc_checkAndWait;
		if ( AO_stop ) ewitWith{};
		sleep IA_cooldown;
		if ( AO_stop ) ewitWith{};
		AO_isOn = true;
		_ao = missionNamespace getVariable _x;
		if ( !(isNil _ao) ) then {
			AO_main = spawn { [_x] call AO_fnc_threadAO; };
			waitUntil {
				sleep IA_checkDelay;
				scriptDone AO_main
			};
			AO_isOn = false;
			if ( AO_stop ) ewitWith{};
		};
	} count _markers;
	
	if ( AO_stop ) ewitWith{};
};