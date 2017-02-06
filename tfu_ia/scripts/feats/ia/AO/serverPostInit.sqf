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

if ( isNil "AO_zones" ) then {
	AO_zones = "true" configClasses (missionConfigFile >> "settings" >> "maps" >> toUpper(worldName) >> "zones");
};

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
	
	AO_zone = selectRandom _zones;
	_zones = _zones - [AO_zone];
	
	private _markbuff = getArray(AO_zone >> "aos");
	private _blacklist = getArray(missionconfigFile >> "settings" >> "maps" >> toUpper(worldName) >> "bases" >> BASE_NAME >> "blacklist");
	{
		if ( _x in _blacklist ) then { _markbuff deleteAt _forEachIndex; };
	} forEach _markbuff;
	
	if ( (count _markbuff) > 0 ) then {
		for "_i" from 0 to (getNumber(AO_zone >> "consecutiveAOS") - 1) do {
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
};