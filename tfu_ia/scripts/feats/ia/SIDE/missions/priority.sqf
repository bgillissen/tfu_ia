/*
@filename: feats\ia\SIDE\misPriotiry.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	run on server,
	spawn by feats\ia\SIDE\serverPostInitTheard.sqf,
	fortified and protected Arti or AA batteries
Params:
	none
Environment:
	missionNamespace:
		SIDE_stop
		zeusMission
	missionConfig:
		ia >> oa >> circle
		ia >> side >> minDistFromBase
		ia >> side >> priority >> minDistFromAO
		ia >> side >> priority >> maxDistFromAO
		ia >> side >> priority >> artiProb
		ia >> side >> priority >> infiniteAmmo
		ia >> side >> priority >> extraHealth
		ia >> side >> priority >> HBarrier
		ia >> side >> priority >> arti >> title
		ia >> side >> priority >> aa >> title
		ia >> side >> size
		ia >> side >> priority >> briefing
		ia >> side >> priority >> arti >> briefing
		ia >> side >> priority >> aa >> briefing
		ia >> checkDelay
		ia >> side >> priority >> success
		ia >> side >> priority >> arti >> notification
		ia >> side >> priority >> aa >> notification
	missionParameters:
		ArtilleryTargetTickTimeMax
		ArtilleryTargetTickTimeMin
Return:
	nothing
*/

private _baseCoord = getMarkerPos "SZ";
private _flatPos = [0,0,0];
private _minDistFromBase = ["ia", "side", "minDistFromBase"] call core_fnc_getSetting;
private _minDistFromAO = ["ia", "side", "minDistFromAO"] call core_fnc_getSetting;
private _maxDistFromAO = ["ia", "side", "priority", "maxDistFromAO"] call core_fnc_getSetting;
private _found = false;

//find a flat position, not too close from base, and not too far, not too close from the active AO (if one)
while { !_found } do {
	_position = [[[_baseCoord, 2000]], ["water","out"]] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [5, 0, 0.2, 5, 0, false];
	while {(count _flatPos) < 2} do {
		_position = [[[_baseCoord, 6000]],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [5, 0, 0.2, 5, 0, false];
	};
	if ((_flatPos distance _baseCoord) > _mindistFromBase) then {
		if ( AO_coord isEqualTo [0,0,0] ) then {
			_found = true;
		} else {
			if ((_flatPos distance AO_coord) <= _maxDistFromAO) then {
				_found = ( (_flatPos distance AO_coord) >= _minDistFromAO );
			};
		};
	};
};
_minDistFromBase = nil;
_minDistFromAO = nil;
_maxDistFromAO = nil;
_found = nil;

_flatPos params["_cX", "_cY", "_cZ"];

private _tankCoords = [[_cX - 2, _cY - 2, _cZ], [_cX + 2, _cY + 2, _cZ]];
private _tankDir = (random 360);
private _truckCoord = [_cX + 20, _cY + random 20, _cZ];

//arti or AA ?
private _isArti  = (random 100 <= (["ia", "side", "priority", "artiProb"] call core_fnc_getSetting));

private "_poolName";
if ( _isArti ) then {
	_poolName = "arti";
} else {
	_poolName = "aa";
};

([_poolName] call ia_fnc_randomSide) params ["_side", "_pool", "_key"];

if ( (count _pool) == 0 ) exitWith {
	diag_log "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<  Priority empty pool!";
};
//spawn objective vehicles
private _tank1 = (selectRandom _pool) createVehicle (_tankCoords select 0);
_tank1 setDir _tankDir;
private _tank2 = (selectRandom _pool) createVehicle (_tankCoords select 1);
_tank2 setDir _tankDir;
_pool = nil;
/*
//spawn an ammo truck
private _truck = (selectRandom (S_ammo select _key)) createVehicle _truckCoord;
_truck setDir (random 360);
*/
{
	_x lock 3;
	_x allowCrewInImmobile true;
} forEach [_tank2, _tank1];

//spawn tanks crew
private _groups = [];
_group = createGroup _side;
for "_x" from 1 to 4 do {
	(selectRandom (S_crew select _key)) createUnit [_flatPos, _group];
};
((units _group) select 0) assignAsCommander _tank1;
((units _group) select 0) moveInCommander _tank1;
((units _group) select 0) setVariable ["NOAI", true, true];
((units _group) select 1) assignAsCommander _tank2;
((units _group) select 1) moveInCommander _tank2;
((units _group) select 1) setVariable ["NOAI", true, true];
((units _group) select 2) assignAsGunner _tank1;
((units _group) select 2) moveInGunner _tank1;
((units _group) select 2) setVariable ["NOAI", true, true];
((units _group) select 3) assignAsGunner _tank2;
((units _group) select 3) moveInGunner _tank2;
((units _group) select 3) setVariable ["NOAI", true, true];
[(units _group), 6] call common_fnc_setSkill;
_group setBehaviour "COMBAT";
_group setCombatMode "RED";	
_group allowFleeing 0;
_groups append [_group];

_tank1 engineOn true;
_tank2 engineOn true;
if ( AO_coord isEqualTo [0,0,0] ) then {
	_tank1 doWatch (getMarkerPos "SZ");
	_tank2 doWatch (getMarkerPos "SZ");
} else {
	_tank1 doWatch AO_coord;
	_tank2 doWatch AO_coord;
};

[[_tank1, _tank2] + (units _group), false] call curator_fnc_addEditable;

private _infAmmo = [false, true] select (["ia", "side", "priority", "infiniteAmmo"] call core_fnc_getSetting);
private _stronger = [false, true] select (["ia", "side", "priority", "extraHealth"] call core_fnc_getSetting);
if ( _infAmmo ) then {
	_tank1 setVariable ["fired_EH", (_tank1 addEventHandler ["Fired",{ (_this select 0) setVehicleAmmo 1 }])];
	_tank2 setVariable ["fired_EH", (_tank2 addEventHandler ["Fired",{ (_this select 0) setVehicleAmmo 1 }])];
};
if ( _stronger ) then {
	_tank1 setVariable ["damage_EH", ([_tank1] call SIDE_fnc_reduceDamage)];
	_tank2 setVariable ["damage_EH", ([_tank2] call SIDE_fnc_reduceDamage)];
};

//H-barrier ring
private _distance = 16;
private _dir = 0;
private _protect = ["ia", "side", "priority", "HBarrier"] call core_fnc_getSetting;
for "_c" from 0 to 7 do {
	private _pos = [_flatPos, _distance, _dir] call BIS_fnc_relPos;
	private _barrier = _protect createVehicle _pos;
	_barrier setDir _dir;
	_dir = _dir + 45;
	_barrier allowDamage false; 
	_barrier enableSimulation false;
	_groups append [_barrier];
	_barrier = nil;
};
_distance = nil;
_dir = nil;
_protect = nil;

//spawn units
private _size = ["ia", "side", "size"] call core_fnc_getSetting;
private _aaCount = 0;
if ( _isArti ) then { _aaCount = 2; };
_groups append ([_flatPos, 0, 4, 2, 0, 0, _aaCount, 2, 2, 3, 0, (_size + (random 150))] call SIDE_fnc_placeEnemies);

//markers
private _cfg  = ["aa", "arti"] select (_isArti);
private _title = ["ia", "side", "priority", _cfg, "title"] call core_fnc_getSetting;
[_flatPos, _title, _size] call SIDE_fnc_placeMarkers;

//briefing
private _briefing = ["ia", "side", "priority", "briefing"] call core_fnc_getSetting;
private _desc = ["ia", "side", "priority", _cfg, "briefing"] call core_fnc_getSetting;
format[_briefing, _title, _desc] call global_fnc_hint;
["NewSideMission", _title] call global_fnc_notification;
_cfg = nil;
_title = nil;
_briefing = nil;
_desc = nil;

private ["_frCoord", "_tickMax", "_tickMin"];
if ( _isArti ) then {
	_frCoord = getMarkerPos "FR";
	_tickMax = ["ArtilleryTargetTickTimeMax"] call core_fnc_getParam;
	_tickMin = ["ArtilleryTargetTickTimeMin"] call core_fnc_getParam;
};

private _checkDelay = ["ia", "checkDelay"] call core_fnc_getSetting;

while { true } do {
	{
		if (!alive _x) then {
			if ( _stronger ) then {
				_x removeEventHandler ["HandleDamage", (_x getVariable "damage_EH")];
			};
			if ( _infAmmo ) then {
				_x removeEventHandler ["Fired", (_x getVariable "fired_EH")];
			};
		};
	} forEach [_tank1, _tank2];
	
	if ( (!alive _tank1) && (!alive _tank2) ) exitWith {
		private _hint = ["ia", "side", "priority", "success"] call core_fnc_getSetting;
		_hint call global_fnc_hint;
		_hint = nil;
		private _notif = ["ia", "side", "priority", _cfg, "notification"] call core_fnc_getSetting;
		["CompletedPriorityTarget", _notif] call global_fnc_notification;
		_notif = nil;
		[false, _flatPos, _size, _groups, [_tank1, _tank2]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _size, _groups, [_tank1, _tank2]] spawn SIDE_fnc_cleanup;
	};
	if ( _isArti ) then {
		[[_tank1, _tank2], [_baseCoord, _frCoord]] call SIDE_fnc_artiFire;
		private "_tick"; 
		if (_tickMax <= _tickMin) then {
			_tick = _tickMin;
		} else {
			_tick = (_tickMax + (random (_tickMax - _tickMin)));
		};
		private _end = time + _tick;
		waitUntil {
			sleep _checkDelay;
			( (time >= _end) || SIDE_stop || zeusMission )
		};
	} else {
		[[_tank1, _tank2]] call SIDE_fnc_aaFire;
	};
	sleep _checkDelay;
};