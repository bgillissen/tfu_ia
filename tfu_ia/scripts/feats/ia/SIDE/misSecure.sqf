/*
@filename: feats\ia\SIDE\misSecure.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	run on server,
	spawn by feats\ia\SIDE\serverPostInitTheard.sqf,
	a radar or chopper to secure, we put a laptop to "activate" in a cargo house 
	and some maned guard tower around.
Params:
	none
Environment:
	missionNamespace:
		SIDE_stop
		zeusMission
		S_airPatrol
	missionConfig:
		ia >> oa >> circle
		ia >> side >> minDistFromBase
		ia >> side >> minDistFromAO
		ia >> side >> secure >> radarProb
		ia >> side >> secure >> radar >> title
		ia >> side >> secure >> radar >> briefing
		ia >> side >> secure >> chopper >> title
		ia >> side >> secure >> chopper >> briefing
		ia >> side >> table
		ia >> side >> laptop
		ia >> side >> secure >> action
		ia >> side >> garrisonSkill
		ia >> side >> size
		ia >> side >> failHint
		ia >> side >> secure >> planted
		ia >> side >> boomDelay
		ia >> side >> successHint
Return:
		nothing
*/

private _aoCoord = [0,0,0];
if ( !isNil "AO_circle" ) then { 
	_aoCoord = getMarkerPos AO_circle; 
};
private _baseCoord = getMarkerPos "SZ";
private _cargoType = "Land_Cargo_House_V3_F";
private _flatPos = [0,0,0];
private _minDistFromBase = ["ia", "side", "minDistFromBase"] call core_fnc_getSetting;
private _minDistFromAO = ["ia", "side", "minDistFromAO"] call core_fnc_getSetting;
private _found = false;
private "_flatPos";

while { !_found } do {
	_position = [] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [5, 1, 0.2, (sizeOf _cargoType), 0, false];
	while {(count _flatPos) < 2} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [10, 1, 0.2, sizeOf _cargoType, 0, false];
	};
	if ( (_flatPos distance _baseCoord) >= _minDistFromBase ) then {
		if ( _aoCoord isEqualTo [0,0,0] ) then {
			_found = true;
		} else {
			if ( (_flatPos distance _aoCoord) >= _minDistFromAO ) then {
				_found = true;
			};
		};
	};
};
_aoCoord = nil;
_baseCoord = nil;
_minDistFromBase = nil;
_minDistFromAO = nil;
_found = nil;

//private _isRadar = [false, true] select (random 100 <= (["ia", "side", "secure", "radarProb"] call core_fnc_getSetting));
_isRadar = true;
private ["_title", "_desc", "_pool"];
//if ( _isRadar ) then {
	_title = ["ia", "side", "secure", "radar", "title"] call core_fnc_getSetting;
	_desc = ["ia", "side", "secure", "radar", "briefing"] call core_fnc_getSetting;
	 _pool = ["Land_Radar_Small_F"];
/*} else {
	_title = ["ia", "side", "secure", "chopper", "title"] call core_fnc_getSetting;
	_desc = ["ia", "side", "secure", "chopper", "briefing"] call core_fnc_getSetting;
	_pool = S_aPatrol;
};*/

//spawn objective
private _obj = (selectRandom _pool) createVehicle ([_flatPos, 25, 35, 10, 0, 0.5, 0] call BIS_fnc_findSafePos);
_obj setDir random 360;
if ( !_isRadar ) then {
	_obj lock 3;
};

//cargo house
private _cargo = _cargoType createVehicle _flatPos;
_cargo setDir random 360;

(getPos _cargo) params ["_cargoX", "_cargoY", "_cargoZ"];

//table, laptop
private _tableType = ["ia", "side", "table"] call core_fnc_getSetting;
private _table = _tableType createVehicle [_cargoX, _cargoY, (_cargoZ + 15)];
_tableType = nil;

[_cargo, _table, [0, 3.75, 0.8]] call BIS_fnc_relPosObject;
_table enableSimulationGlobal true;

sleep 0.5;

private _laptopType = selectRandom (["ia", "side", "laptop"] call core_fnc_getSetting);
private _laptop = _laptopType createVehicle [_cargoX, _cargoY, (_cargoZ + 15)];

_laptopType = nil;

[_table, _laptop, [0,0,0.80]] call BIS_fnc_relPosObject;
_laptop enableSimulationGlobal false;
_laptop setDir (getdir _table - 180);

private _action = ["ia", "side", "secure", "action"] call core_fnc_getSetting;
[_laptop, _action] call SIDE_fnc_addAction;
_action = nil;

//watchTower
private _tower1 = "Land_Cargo_Patrol_V3_F" createVehicle ([_flatPos, 50, 0] call BIS_fnc_relPos);
_tower1 setDir 180;
private _tower2 = "Land_Cargo_Patrol_V3_F" createVehicle ([_flatPos, 50, 120] call BIS_fnc_relPos);
_tower2 setDir 300;
private _tower3 = "Land_Cargo_Patrol_V3_F" createVehicle ([_flatPos, 50, 240] call BIS_fnc_relPos);
_tower3 setDir 60;
_skill = nil;

private _groups = [];

//spawn units in watch towers
private _skill = ["ia", "side", "garrisonSkill"] call core_fnc_getSetting;
{
	_groups append [([_x, _skill] call IA_fnc_forcedGarrison)];
	true
} count [_tower1, _tower2, _tower3];
_skill = nil;

//spawn patrols
private _size = ["ia", "side", "size"] call core_fnc_getSetting;
_groups append ([_flatPos, 0, 4, 2, 0, 2, 1, 1, 2, 3, 1, (_size + (random 150))] call SIDE_fnc_placeEnemies);

diag_log "--------------";
diag_log _groups;
diag_log "--------------";

//markers
[_flatPos, _title, _size] call SIDE_fnc_placeMarkers;
//briefing
private _briefing = ["ia", "side", "briefing"] call core_fnc_getSetting;
[format[_briefing, _title, _desc]] call common_fnc_globalHint;
["NewSideMission", _title] call common_fnc_globalNotification;
_title = nil;
_briefing = nil;
_desc = nil;


private _checkDelay = ["ia", "checkDelay"] call core_fnc_getSetting;

while { true } do {
	if (!alive _cargo || !alive _obj) exitWith {
		private _fail = ["ia", "side", "failHint"] call core_fnc_getSetting;
		[_fail] call common_fnc_globalHint;
		[false, _flatPos, _size, _groups, [_laptop, _table, _cargo, _obj, _tower1, _tower2, _tower3]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_success ) exitWith {
		//plan message
		private _planted = ["ia", "side", "secure", "planted"] call core_fnc_getSetting;
		private _delay = ["ia", "side", "boomDelay"] call core_fnc_getSetting;
		[PLAYER_SIDE, "HQ", format[_planted, _delay]] call common_fnc_globalSideChatServer;
		//time to move away
		sleep _delay;
		//blow objectif and cargo
		(getPos _obj) params ["_objX", "_objY", "_objZ"];
		diag_log "boom";
		[[_cargoX, _cargoY, (_cargoZ+2)], false] spawn SIDE_fnc_boom;		
		[[_objX, _objY, (_objZ+15)], false] spawn SIDE_fnc_boom;
		deleteVehicle _laptop;
		deleteVehicle _table;
		//give a reward
		private _reward = call IA_fnc_giveReward;
		private _hint = ["ia", "side", "successHint"] call core_fnc_getSetting;
		[format[_hint, _reward]] call common_fnc_globalHint;
		//cleanup
		[false, _flatPos, _size, _groups, [_cargo, _obj, _tower1, _tower2, _tower3]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _size, _groups, [_laptop, _table, _cargo, _obj, _tower1, _tower2, _tower3]] spawn SIDE_fnc_cleanup;
	};
	sleep _checkDelay;
};