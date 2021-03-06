/*
@filename: feats\ia\SIDE\misIntel.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	run on server,
	spawn by feats\ia\SIDE\serverPostInitTheard.sqf,
	an officer to "active" inside a car or not
Params:
	none
Environment:
	missionNamespace:
		SIDE_stop
		zeusMission
		S_officer
		S_car
		S_crew
	missionConfig:
		ia >> oa >> circle
		ia >> side >> minDistFromBase
		ia >> side >> minDistFromAO
		ia >> side >> intel >> vehicleProb
		ia >> side >> intel >> action
		ia >> side >> intel >> triggerSize
		ia >> side >> size 
		ia >> side >> intel >> title
		ia >> side >> briefing
		ia >> side >> intel >> briefing
		ia >> checkDelay
		ia >> side >> failHint
		ia >> side >> intel >> fail
		ia >> side >> intel >> spotted
		ia >> side >> intel >> secured
		ia >> side >> successHint
Return:
		nothing
*/

private _baseCoord = getMarkerPos "SZ";
private _flatPos = [0,0,0];
private _sizeType = "Land_Dome_Small_F";
private _minDistFromBase = ["ia", "side", "minDistFromBase"] call core_fnc_getSetting;
private _minDistFromAO = ["ia", "side", "minDistFromAO"] call core_fnc_getSetting;
private _found = false;
//find a flat position
while { !_found } do {
	_position = [] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [5, 1, 0.2, (sizeOf _sizeType), 0, false];
	while {(count _flatPos) < 2} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [10, 1, 0.2, (sizeOf _sizeType), 0, false];
	};
	if ( (_flatPos distance _baseCoord) >= _minDistFromBase ) then {
		if ( AO_coord isEqualTo [0,0,0] ) then {
			_found = true;
		} else {
			_found = ( (_flatPos distance AO_coord) >= _minDistFromAO );
		};
	};
};
_baseCoord = nil;
_minDistFromBase = nil;
_minDistFromAO = nil;
_sizeType = nil;
_found = nil;

private _inVehicle = (random 100 <= (["ia", "side", "intel", "vehicleProb"] call core_fnc_getSetting));

private _pos1 = [_flatPos, 3, random 360] call BIS_fnc_relPos;
private _pos2 = [_flatPos, 10, random 360] call BIS_fnc_relPos;
private _pos3 = [_flatPos, 15, random 360] call BIS_fnc_relPos;

//Intel
(["officer"] call ia_fnc_randomSide) params ["_side", "_pool", "_key"];
private _intelGroup = createGroup _side;
(selectRandom _pool) createUnit [_pos1, _intelGroup];
private _intel = (units _intelGroup) select 0;
_intel setVariable ["NOAI", true, true];
removeAllWeapons _intel;
(selectRandom (S_crew select _key)) createUnit [_flatPos, _intelGroup];
private _intelDriver = (units _intelGroup) select 1;
private _intelCar = (selectRandom (S_car select _key)) createVehicle _flatPos;
_intelCar setDir (random 360);
_intel assignAsCargo _intelCar;
_intelDriver assignAsDriver _intelCar;
_intelDriver moveInDriver _intelCar;
//Fake 1
private _fake1Group = createGroup _side;
(selectRandom (S_crew select _key)) createUnit [_pos2, _fake1Group];
private _fake1Driver = (units _fake1Group) select 0;
private _fake1Car = (selectRandom (S_car select _key)) createVehicle _pos2;
_fake1Driver assignAsDriver _fake1Car;
_fake1Driver moveInDriver _fake1Car;
//Fake 2
private _fake2Group = createGroup _side;
(selectRandom (S_crew select _key)) createUnit [_pos3, _fake2Group];
private _fake2Driver = (units _fake2Group) select 0;
private _fake2Car = (selectRandom (S_car select _key)) createVehicle _pos3;
_fake2Driver assignAsDriver _fake2Car;
_fake2Driver moveInDriver _fake2Car;

private ["_guard1", "_guard2", "_addActionTo", "_toclean"];
if ( _inVehicle ) then {
	_intel moveInCargo _intelCar;
	_addActionTo = _intelCar;
} else {
	(selectRandom _pool) createUnit [_pos1, _intelGroup];
	_guard1 = (units _intelGroup) select 2;
	_guard1 setVariable ["NOAI", true, true];
	(selectRandom _pool) createUnit [_pos1, _intelGroup];
	_guard2 = (units _intelGroup) select 3;
	_guard2 setVariable ["NOAI", true, true];
	_addActionTo = _intel;
};

[(units _intelGroup), 2] call common_fnc_setSkill;
[(units _fake1Group), 2] call common_fnc_setSkill;
[(units _fake2Group), 2] call common_fnc_setSkill;

_intelDriver = nil;
_fake1Driver = nil;
_fake2Driver = nil;
_pos1 = nil;
_pos2 = nil;
_pos3 = nil;

private _action = ["ia", "side", "intel", "action"] call core_fnc_getSetting;
[_addActionTo, _action] call SIDE_fnc_addAction;
_addActionTo = nil;
_action = nil;

//detection trigger
private _trigger = createTrigger ["EmptyDetector", getPos _intel];
private _size = ["ia", "side", "intel", "triggerSize"] call core_fnc_getSetting;
_trigger setTriggerArea [_size, _size, 0, false];
_trigger setTriggerActivation [toUpper (str PLAYER_SIDE), "PRESENT", false];
_trigger setTriggerStatements ["this", "", ""];
_trigger attachTo [_intel, [0,0,0]];

private _groups = [];
_groups pushback _intelGroup;
_groups pushback _fake1Group;
_groups pushback _fake2Group;

//spawn units
_size = ["ia", "side", "size"] call core_fnc_getSetting;
_groups append ([_flatPos, 0, 4, 0, 0, 0, 1, 0, 2, 2, 0, (_size - (random 50))] call SIDE_fnc_placeEnemies);

//markers
private _title = ["ia", "side", "intel", "title"] call core_fnc_getSetting;
[_flatPos, _title, _size] call SIDE_fnc_placeMarkers;

//briefing
private _briefing = ["ia", "side", "briefing"] call core_fnc_getSetting;
private _desc = ["ia", "side", "intel", "briefing"] call core_fnc_getSetting;
format[_briefing, _title, _desc] call global_fnc_hint;
["NewSideMission", _title] call global_fnc_notification;
_title = nil;
_briefing = nil;
_desc = nil;

private _isFleing = false;
private _escaped = false;
private _checkDelay = ["ia", "checkDelay"] call core_fnc_getSetting;

while { true } do {
	private "_cond";
	if ( _inVehicle ) then {
		_cond = (alive _intelCar);
	} else {
		_cond = (alive _intel);
	};
	if ( !_cond ) exitWith {
		private _fail = ["ia", "side", "failHint"] call core_fnc_getSetting;
		_fail call global_fnc_hint;
		[false, _flatPos, _size, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	if ( _escaped ) exitWith {
		private _chat = ["ia", "side", "intel", "fail"] call core_fnc_getSetting;
		[1, _chat, ["HQ", PLAYER_SIDE]] call global_fnc_chat;
		private _fail = ["ia", "side", "failHint"] call core_fnc_getSetting;
		_fail call global_fnc_hint;
		[false, _flatPos, _size, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	if ( _isFleing ) then {
		_escaped = (count list _trigger < 1);
	} else {
		if ( _intel call BIS_fnc_enemyDetected ) then {
			private _chat = ["ia", "side", "intel", "spotted"] call core_fnc_getSetting;
			[1, _chat, ["HQ", PLAYER_SIDE]] call global_fnc_chat;
			_chat = nil;
			if ( !_inVehicle ) then { 
				[_intel] orderGetIn true;
				sleep 10;
			};
			{
				private _wp = _x addWaypoint [AO_coord, 100];	
				_wp setWaypointType "MOVE";
				_wp setWaypointBehaviour "CARELESS";
				_wp setWaypointSpeed "FULL";
			} count [_intelGroup, _fake1Group, _fake2Group];
			_isFleing = true;
		};
	};
	if ( SIDE_success ) exitWith {
		private _chat = ["ia", "side", "intel", "secured"] call core_fnc_getSetting;
		[1, _chat, ["HQ", PLAYER_SIDE]] call global_fnc_chat;
		private _reward = call IA_fnc_giveReward;
		private _hint = ["ia", "side", "successHint"] call core_fnc_getSetting;
		format[_hint, _reward] call global_fnc_hint;
		[false, _flatPos, _size, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _size, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	sleep _checkDelay;
};