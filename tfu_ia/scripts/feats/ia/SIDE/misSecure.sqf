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

private _aoCoord = getMarkerPos AO_circle;
private _baseCoord = getMarkerPos "SZ";
private _cargoType = "Land_Cargo_House_V3_F";
private _flatPos = [0,0,0];
private _minDistFromBase = ["ia", "side", "minDistFromBase"] call BIS_fnc_GetCfgData;
private _minDistFromAO = ["ia", "side", "minDistFromAO"] call BIS_fnc_GetCfgData;

//find a flat position
while ( true ) do {
	_position = [] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [5, 1, 0.2, (sizeOf _cargoType), 0, false];
	while {(count _flatPos) < 2} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [10, 1, 0.2, sizeOf _cargoType, 0, false];
	};
	if ( (_flatPos distance _baseCoord) >= _minDistFromBase ) then {
		if ( _aoCoord isEqualTo [0,0,0] ) exitWith {};
		if ( (_flatPos distance _aoCoord) >= _minDistFromAO ) exitWith {};
	};
};
_aoCoord = nil;
_baseCoord = nil;
_minDistFromBase = nil;
_minDistFromAO = nil;

private _isRadar = [false, true] select (random 100 <= (["ia", "side", "secure", "radarProb"] call BIS_fnc_GetCfgData));

private ["_title", "_desc", "_pool"];
if ( _isRadar ) then {
	_title = ["ia", "side", "secure", "radar", "title"] call BIS_fnc_GetCfgData;
	_desc = ["ia", "side", "secure", "radar", "briefing"] call BIS_fnc_GetCfgData;
	 _pool = ["Land_Radar_Small_F"];
} else {
	_title = ["ia", "side", "secure", "chopper", "title"] call BIS_fnc_GetCfgData;
	_desc = ["ia", "side", "secure", "chopper", "briefing"] call BIS_fnc_GetCfgData;
	_pool = S_airPatrol;
};

//spawn objective
private _obj = (selectRandom _pool) createVehicle ([_flatPos, 25, 35, 10, 0, 0.5, 0] call BIS_fnc_findSafePos);
_obj setDir random 360;
if ( !isRadar ) then {
	_obj lock 3;
};

//cargo house
private _cargo = _cargoType createVehicle _objPos;
_cargo setDir random 360;

(getPos _cargo) params["_cargoX", "_cargoY", "_cargoZ"];

//table, laptop
private _tableType = ["ia", "side", "table"] call BIS_fnc_GetCfgData;
private _table = _tableType createVehicle [_cargoX, _cargoY, (_cargoY+1)];
_table enableSimulation true;
_tableType = nil;

private _laptopType = ["ia", "side", "laptop"] call BIS_fnc_GetCfgData;
private _laptop = SIDE_laptop createVehicle [_cargoX, _cargoY, (_cargoY+5)];
_laptopType = nil;

[_table, _laptop, [0,0,0.83]] call BIS_fnc_relPosObject;
_laptop enableSimulation true;

private _action = ["ia", "side", "secure", "action"] call BIS_fnc_GetCfgData;
[_laptop, _action] remoteExec ["SIDE_fnc_addAction", allPlayers - entities "HeadlessClient_F"];
_action = nil;

private _groups = [];

//Populated watchTower
private _skill = ["ia", "side", "garrisonSkill"] call BIS_fnc_GetCfgData;
private _tower1 = "Land_Cargo_Patrol_V3_F" createVehicle ([_flatPos, 50, 0] call BIS_fnc_relPos);
_tower1 setDir 180;
_groups append [_tower1, _skill] call IA_fnc_forcedGarrison;
private _tower2 = "Land_Cargo_Patrol_V3_F" createVehicle ([_flatPos, 50, 120] call BIS_fnc_relPos);
_tower2 setDir 300;
_groups append [_tower2, _skill] call IA_fnc_forcedGarrison;
private _tower3 = "Land_Cargo_Patrol_V3_F" createVehicle ([_flatPos, 50, 240] call BIS_fnc_relPos);
_tower3 setDir 60;
_groups append [_tower3, _skill] call IA_fnc_forcedGarrison;
_skill = nil;

//spawn units
private _size = ["ia", "side", "size"] call BIS_fnc_GetCfgData;
_groups append [_flatPos, 0, 4, 2, 0, 2, 1, 1, 2, 3, 0, (_size + (random 150))] call SIDE_fnc_placeEnemies;

//markers
private _title = ["ia", "side", "secure", "title"] call BIS_fnc_GetCfgData; 
[_flatPos, _title, SIDE_size] call SIDE_fnc_placeMarkers;
//briefing
private _briefing = ["ia", "side", "briefing"] call BIS_fnc_GetCfgData;
[format[_briefing, _title, _desc]] remoteExec ["common_fnc_globalHint", 0, false];
["NewSideMission", _title] remoteExec ["common_fnc_globalNotification" ,0 , false];
_title = nil;
_size = nil;
_briefing = nil;
_desc = nil;


private _checkDelay = ["ia", "checkDelay"] call BIS_fnc_GetCfgData;

while ( true ) do {
	if (!alive _cargo || !alive _obj) exitWith {
		private _fail = ["ia", "side", "failHint"] call BIS_fnc_GetCfgData;
		[_fail] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_laptop, _table, _cargo, _obj, _tower1, _tower2, _tower3]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_success ) exitWith {
		private _planted = ["ia", "side", "secure", "planted"] call BIS_fnc_GetCfgData;
		private _delay = ["ia", "side", "boomDelay"] call BIS_fnc_GetCfgData;
		[format[_planted, _delay]] remoteExec ["common_fnc_globalSideChat", 0, false];
		sleep _delay;
		[[_cargoX, _cargoY, (_cargoZ+2)], false] spawn SIDE_fnc_boom;
		deleteVehicle _laptop;
		deleteVehicle _table;
		private _reward = call common_fnc_giveReward;
		private _hint = ["ia", "side", "successHint"] call BIS_fnc_GetCfgData;
		[format[_hint, _reward]] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_cargo, _obj, _tower1, _tower2, _tower3]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _groups, [_laptop, _table, _cargo, _obj, _tower1, _tower2, _tower3]] spawn SIDE_fnc_cleanup;
	};
	sleep _checkDelay;
};