/*
@filename: feats\ia\AO\serverPostInit.sqf
Author:
	Ben
Description:
	run on server side
	must be spawn not call
	it keeps track of the active AO thread, and create a new one when needed 
*/
AO_coord = [0,0,0];

if ( (["AO"] call core_fnc_getParam) == 0 ) exitWith {};

AO_stop = false;
AO_zone = nil;
AO_thread = nil;
AO_cas = nil;

private _zones = [];
private _markers = [];

private _checkDelay = ["ia", "checkDelay"] call core_fnc_getSetting;
private _cooldown = ["ia", "ao", "cooldown"] call core_fnc_getSetting;

while { true } do {	
	
	if ( count _zones == 0 ) then { 
		_zones = AO_zones;
	};
	
	AO_zone = floor random (count _zones - 1);
	private _zone = _zones select AO_zone;
	_zones = _zones - [_zone];
	
	private _markbuff = AO_markers select AO_zone;

	for "_i" from 0 to ((_zone select 1) - 1) do {
		private _m = selectRandom _markbuff;
		_markers = _markers + [_m];
		_markbuff = _markbuff - [_m];
	};
	_markbuff = nil;
	
	{
		[true, "AO_stop"] call zeusMission_fnc_checkAndWait;
		if ( AO_stop ) exitWith {};
		AO_coord = getMarkerPos _x; 
		if !( AO_coord isEqualTo [0,0,0] ) then {
			AO_main = [_x] spawn AO_fnc_threadAO;
			waitUntil {
				sleep _checkDelay;
				scriptDone AO_main
			};
		};
		if ( !zeusMission ) then {
			[_cooldown, _checkDelay, "AO_stop"] call common_fnc_smartSleep;
			if ( AO_stop ) exitWith {};
		};
	} count _markers;

	if ( AO_stop ) exitWith {};
};