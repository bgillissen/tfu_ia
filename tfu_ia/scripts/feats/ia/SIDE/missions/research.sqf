/*
@filename: feats\ia\SIDE\misResearch.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	run on server,
	spawn by feats\ia\SIDE\serverPostInitTheard.sqf, 
	a Research bunker with a laptop to "activate" inside. 
Params:
	none
Environment:
	missionNamespace:
		SIDE_stop
		zeusMission
	missionConfig:
		ia >> oa >> circle
		ia >> side >> research >> hqType
		ia >> side >> minDistFromBase
		ia >> side >> minDistFromAO
		ia >> side >> table
		ia >> side >> laptop
		ia >> side >> research >> action
		ia >> side >> size
		ia >> side >> garrisonSkill
		ia >> side >> research >> title
		ia >> side >> briefing
		ia >> side >> research >> briefing
		ia >> checkDelay
		ia >> side >> failHint
		ia >> side >> research >> planted
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
private _hqType = ["ia", "side", "research", "hqType"] call core_fnc_getSetting;
private _flatPos = [0,0,0];
private _minDistFromBase = ["ia", "side", "minDistFromBase"] call core_fnc_getSetting;
private _minDistFromAO = ["ia", "side", "minDistFromAO"] call core_fnc_getSetting;
private _found = false;

//find a flat position, near coast
while { !_found } do {
	_position = [] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [5, 1, 0.2, (sizeOf _hqType), 0, false];
	while {(count _flatPos) < 2} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [10, 1, 0.2, sizeOf _hqType, 0, false];
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

//objective building
private _hq = _hqType createVehicle _flatPos;
_hq setDir (random 360);
_hq setVectorUp [0,0,1];
_hqType = nil;

(getPos _hq) params["_hqX", "_hqY", "_hqZ"];

//objective table, laptop
private _tableType = ["ia", "side", "table"] call core_fnc_getSetting;
private _table = _tableType createVehicle [_hqX, _hqY, (_hqZ+1)];
_table enableSimulation true;
_tableType = nil;

private _laptopType = ["ia", "side", "laptop"] call core_fnc_getSetting;
private _laptop = _laptopType createVehicle [_hqX, _hqY, (_hqZ+5)];
_laptopType = nil;

[_table, _laptop, [0,0,0.80]] call BIS_fnc_relPosObject;
_laptop enableSimulationGlobal false;

private _action = ["ia", "side", "research", "action"] call core_fnc_getSetting;
[_laptop, _action] call SIDE_fnc_addAction;
_action = nil;

//spawn units
private _size = ["ia", "side", "size"] call core_fnc_getSetting;
private _skill = ["ia", "side", "garrisonSkill"] call core_fnc_getSetting;
private _groups = [_flatPos, 0, 4, 2, 0, 2, 1, 1, 2, 3, 0, (_size + (random 150))] call SIDE_fnc_placeEnemies;
_groups append ([_hq, _skill] call IA_fnc_forcedGarrison);
_skill = nil;


//markers
private _title = ["ia", "side", "research", "title"] call core_fnc_getSetting; 
[_flatPos, _title, _size] call SIDE_fnc_placeMarkers;
//briefing
private _briefing = ["ia", "side", "briefing"] call core_fnc_getSetting;
private _desc = ["ia", "side", "research", "briefing"] call core_fnc_getSetting;
format[_briefing, _title, _desc] call global_fnc_hint;
["NewSideMission", _title] call global_fnc_notification;
_title = nil;
_size = nil;
_briefing = nil;
_desc = nil;

private _checkDelay = ["ia", "checkDelay"] call core_fnc_getSetting;

while ( true ) do {
	if (!alive _hq) exitWith {
		private _fail = ["ia", "side", "failHint"] call core_fnc_getSetting;
		_fail call global_fnc_hint;
		[false, _flatPos, _groups, [_laptop, _table, _hq]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_success ) exitWith {
		private _planted = ["ia", "side", "research", "planted"] call core_fnc_getSetting;
		private _delay = ["ia", "side", "boomDelay"] call core_fnc_getSetting;
		[1, format[_planted, _delay], ["HQ", PLAYER_SIDE]] call global_fnc_chat;
		sleep _delay;
		[[_hqX, _hqY, (_hqZ+2)], false] spawn SIDE_fnc_boom;
		deleteVehicle _laptop;
		deleteVehicle _table;
		private _reward = call common_fnc_giveReward;
		private _hint = ["ia", "side", "successHint"] call core_fnc_getSetting;
		format[_hint, _reward] call global_fnc_hint;
		[false, _flatPos, _groups, [_hq]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _groups, [_laptop, _table, _hq]] spawn SIDE_fnc_cleanup;
	};
	sleep _checkDelay;
};