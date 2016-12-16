/*
@filename: ia\ao\thread.sqf
Author:
	Ben
Description:
	this script is executed once on server side only,
	must be spawn not call
	it keeps track of the active AO thread, and spawn a new one when needed 
*/

private ["_zones", "_zone", "_markers", "_markbuff", "_ao", "_aoThread"];

AO = nil;
AO_zone = nil;
FOB = false;

_zones = [];
_markers = [];

while { true } do {	
	
	if ( count _zones == 0 ) then { 
		_zones = AO_zones;
		if ( FOB && !FOB_success ) then { 
			FOB_failed = true;
			waitUntil {
				sleep 2;
				(FOB == false)
			};
		};
	};
	
	AO_zone =  floor random count _zones;
	_zone = _zones select AO_zone;
	_zones = _zones - _zone;

	_markbuff = AO_markers select AO_zone;
	for "_i" from 0 to (_zones select 1) do {
		_markers = _markers + markbuff select floor random count _markbuff;
		_markbuff = _markbuff - _markers;
	};
	_markbuff = nil;
	
	{
		[true] call zeusMission_fnc_checkAndWait;
		AO = true;
		_ao = missionNamespace getVariable _x;
		if ( !(isNil _ao) ) then {
			_aoThread = spawn { [_x] call AO_fnc_aoThread; };
			waitUntil {
				sleep IA_checkDelay;
				scriptDone _aoThread
			};
			AO = false;
			sleep IA_loopDelay;
		};
	} forEach _markers;
};