/*
@filename: feats\ia\SIDE\misUrban.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run on server,
	spawn by feats\ia\SIDE\serverPostInitTheard.sqf, 
	a crate to "activate" on a predefined marker in an urban area.
Params:
	none
Environment:
	missionNamespace:
		MAP_URBAN
		URBAN_MARKERS
		S_crates
		SIDE_stop
		zeusMission
	missionConfig:
		ia >> oa >> circle
		ia >> side >> research >> hqType
		ia >> side >> minDistFromBase
		ia >> side >> minDistFromAO
		ia >> side >> urban >> action
		ia >> side >> size
		ia >> side >> urban >> title
		ia >> side >> briefing
		ia >> side >> urban >> briefing
		ia >> checkDelay
		ia >> side >> urban >> planted
		ia >> side >> boomDelay
		ia >> side >> successHint
Return:
		nothing 
*/

if ( MAP_URBAN isEqualTo 0 ) exitWith {};

if ( isNil "URBAN_markers" ) then {
	URBAN_markers = [];
	for "_x" from 1 to MAP_URBAN do { 
		URBAN_markers append [format["Urban_%1", _x]]; 
	};
};

if ( isNil "URBAN_pool" ) then {
	URBAN_pool = URBAN_markers;
};
if ( (count URBAN_pool) == 0 ) then {
	URBAN_pool = URBAN_markers;
};

private _aoCoord = getMarkerPos (["ia", "ao", "circle"] call core_fnc_getSetting);
private _baseCoord = getMarkerPos "SZ";
private _accepted = false;

private _minDistFromBase = ["ia", "side", "minDistFromBase"] call core_fnc_getSetting;
private _minDistFromAO = ["ia", "side", "minDistFromAO"] call core_fnc_getSetting;
while (!_accepted) do {
	{
		_coord = getMarkerPos _x;
		if ( (_coord distance _baseCoord) > _minDistFromBase ) then {
			if ( (_coord distance _aoCoord) > _minDistFromAO ) exitWith {
				_accepted = true;
				URBAN_pool = URBAN_pool - [_x];
			};
		};
	} count URBAN_pool;
};
_aoCoord = nil;
_szCoord = nil;
_accepted = nil;
_minDistFromBase = nil;
_minDistFromAO = nil;

//objective crate
private _crate = (selectRandom S_crates) createVehicle _coord;
_crate allowDamage false;
private _action = ["ia", "side", "urban", "action"] call core_fnc_getSetting;
[_crate, _action] remoteExec ["SIDE_fnc_addAction", allPlayers - entities "HeadlessClient_F"];
_action= nil;

//spawn units
private _groups = [_coord, 15, 20, 2, 20, 0, 0, 0, 0, 2, 0, (100 + random 200)] call SIDE_fnc_placeEnemies;

//markers
private _title = ["ia", "side", "urban", "title"] call core_fnc_getSetting;
private _size = ["ia", "side", "size"] call core_fnc_getSetting;
[_coord, _title, _size] call SIDE_fnc_placeMarkers;
//briefing
private _briefing = ["ia", "side", "briefing"] call core_fnc_getSetting;
private _desc = ["ia", "side", "urban", "briefing"] call core_fnc_getSetting;
[format[_briefing, _title, _desc]] remoteExec ["common_fnc_globalHint", 0, false];
["NewSideMission", _title] remoteExec ["common_fnc_globalNotification" ,0 , false];
_title = nil;
_size = nil;
_briefing = nil;
_desc = nil;

private _checkDelay = ["ia", "checkDelay"] call core_fnc_getSetting;

while ( true ) do {
	if ( SIDE_success ) exitWith {
		private _planted = ["ia", "side", "urban", "planted"] call core_fnc_getSetting;
		private _delay = ["ia", "side", "boomDelay"] call core_fnc_getSetting;
		[format[_planted, _delay]] remoteExec ["common_fnc_globalSideChat", 0, false];
		_planted = nil;
		sleep _delay;
		_delay = nil;
		[getPos _crate, false] spawn SIDE_fnc_boom;
		deleteVehicle _crate;
		private _reward = call common_fnc_giveReward;
		private _hint = ["ia", "side", "successHint"] call core_fnc_getSetting;
		[format[_hint, _reward]] remoteExec ["common_fnc_globalHint", 0, false];
		_hint = nil;
		_reward = nil;
		[false, _coord, _groups, []] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _coord, _groups, []] spawn SIDE_fnc_cleanup;
	};
	sleep _checkDelay;
};