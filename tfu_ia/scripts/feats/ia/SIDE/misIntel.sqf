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

private _aoCoord = getMarkerPos (["ia", "ao", "circle"] call BIS_fnc_GetCfgData);
private _baseCoord = getMarkerPos "SZ";
private _flatPos = [0,0,0];
private _sizeType = "Land_Dome_Small_F";
private _minDistFromBase = ["ia", "side", "minDistFromBase"] call BIS_fnc_GetCfgData;
private _minDistFromAO = ["ia", "side", "minDistFromAO"] call BIS_fnc_GetCfgData;
//find a flat position
while ( true ) do {
	_position = [] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [5, 1, 0.2, (sizeOf _sizeType), 0, false];
	while {(count _flatPos) < 2} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [10, 1, 0.2, (sizeOf _sizeType), 0, false];
	};
	if ( (_flatPos distance _baseCoord) >= _minDistFromBase ) then {
		if ( _aoCoord isEqualTo [0,0,0] ) exitWith {};
		if ( (_flatPos distance _aoCoord) >= _minDistFromAO ) exitWith{};
	};
};
_baseCoord = nil;
_minDistFromBase = nil;
_minDistFromAO = nil;
_sizeType = nil;


private _inVehicle = [false, true] select (random 100 <= (["ia", "side", "intel", "vehicleProb"] call BIS_fnc_GetCfgData));

private _pos1 = [_flatPos, 2, random 360] call BIS_fnc_relPos;
private _pos2 = [_flatPos, 10, random 360] call BIS_fnc_relPos;
private _pos3 = [_flatPos, 15, random 360] call BIS_fnc_relPos;

//Intel
private _intelGroup = createGroup ENEMY_SIDE;
private _intel = (selectRandom S_officer) createUnit [_pos1, _intelGroup];
removeAllWeapons _intel;
private _intelDriver = (selectRandom S_crew) createUnit [_flatPos, _intelGroup];
private _intelCar = (selectRandom S_car) createVehicle _flatPos;
_intelCar setDir (random 360);
_intel assignAsCargo _intelCar;
_intelDriver assignAsDriver _intelCar;
_intelDriver moveInDriver _intelCar;
//Fake 1
private _fake1Group = createGroup ENEMY_SIDE;
private _fake1Driver = (selectRandom S_crew) createUnit [_pos2, _fake1Group];
private _fake1Car = (selectRandom S_car) createVehicle _pos2;
_fake1Driver assignAsDriver _fake1Car;
_fake1Driver moveInDriver _fake1Car;
//Fake 2
private _fake2Group = createGroup ENEMY_SIDE;
private _fake2Driver = (selectRandom S_crew) createUnit [_pos3, _fake2Group];
private _fake2Car = (selectRandom S_car) createVehicle _pos3;
_fake2Driver assignAsDriver _fake2Car;
_fake2Driver moveInDriver _fake2Car;

_intelDriver = nil;
_fake1Driver = nil;
_fake2Driver = nil;
_pos1 = nil;
_pos2 = nil;
_pos3 = nil;

private ["_guard1", "_guard2", "_addActionTo", "_toclean"];
if ( _inVehicle ) then {
	_intel moveInCargo _intelCar;
	_addActionTo = _intelCar;
} else {
	_guard1 = (selectRandom S_officer) createUnit [_pos1, _intelGroup];
	_guard2 = (selectRandom S_officer) createUnit [_pos1, _intelGroup];
	_addActionTo = _intel;
};

[(units _intelGroup), 2] call common_fnc_setSkill;
[(units _fake1Group), 2] call common_fnc_setSkill;
[(units _fake2Group), 2] call common_fnc_setSkill;

private _action = ["ia", "side", "intel", "action"] call BIS_fnc_GetCfgData;
[_addActionTo, _action] remoteExec ["SIDE_fnc_addAction", allPlayers - entities "HeadlessClient_F"];
_addActionTo = nil;
_action = nil;

//detection trigger
private _trigger = createTrigger ["EmptyDetector", getPos _intel];
private _size = ["ia", "side", "intel", "triggerSize"] call BIS_fnc_GetCfgData;
_trigger setTriggerArea [_size, _size, 0, false];
_trigger setTriggerActivation [PLAYER_SIDETXT, "PRESENT", false];
_trigger setTriggerStatements ["this","",""];
_trigger attachTo [_intel,[0,0,0]];

private _groups = [];
_groups append [_intelGroup];
_groups append [_fake1Group];
_groups append [_fake2Group];

//spawn units
_size = ["ia", "side", "size"] call BIS_fnc_GetCfgData;
_groups append [_flatPos, 0, 4, 0, 0, 0, 1, 0, 2, 2, 0, (_size - (random 50))] call SIDE_fnc_placeEnemies;

//markers
private _title = ["ia", "side", "intel", "title"] call BIS_fnc_GetCfgData;
[_flatPos, _title, _size] call SIDE_fnc_placeMarkers;
_size = nil;

//briefing
private _briefing = ["ia", "side", "briefing"] call BIS_fnc_GetCfgData;
private _desc = ["ia", "side", "intel", "briefing"] call BIS_fnc_GetCfgData;
[format[_briefing, _title, _desc]] remoteExec ["common_fnc_globalHint", 0, false];
["NewSideMission", _title] remoteExec ["common_fnc_globalNotification" ,0 , false];
_title = nil;
_size = nil;
_briefing = nil;
_desc = nil;

private _isFleing = false;
private _escaped = false;
private _checkDelay = ["ia", "checkDelay"] call BIS_fnc_GetCfgData;

while ( true ) do {
	private ["_cond"];
	if ( _inVehicle ) then {
		_cond = (alive _intelCar);
	} else {
		_cond = (alive _intel);
	}
	if ( !_cond ) exitWith {
		private _fail = ["ia", "side", "failHint"] call BIS_fnc_GetCfgData;
		[_fail] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	if ( _escaped ) exitWith {
		private _chat = ["ia", "side", "intel", "fail"] call BIS_fnc_GetCfgData;
		[_chat] remoteExec ["common_fnc_globalSideChat", 0, false];
		private _fail = ["ia", "side", "failHint"] call BIS_fnc_GetCfgData;
		[_fail] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	if ( _isFleing ) then {
		_escaped = (count list _trigger < 1);
	} else {
		if (_intel call BIS_fnc_enemyDetected) then {
			private _chat = ["ia", "side", "intel", "spotted"] call BIS_fnc_GetCfgData;
			[_chat] remoteExec ["common_fnc_globalSideChat",0,false];
			_chat = nil;
			if ( !_inVehicle ) then { 
				[_intel] orderGetIn true;
				sleep 10;
			};
			{
				private _wp = _x addWaypoint [_aoCoord, 100];	
				_wp setWaypointType "MOVE";
				_wp setWaypointBehaviour "CARELESS";
				_wp setWaypointSpeed "FULL";
			} count [_intelGroup, _fake1Group, _fake2Group];
			_isFleing = true;
	};
	if ( SIDE_success ) exitWith {
		
		private _chat = ["ia", "side", "intel", "secured"] call BIS_fnc_GetCfgData;
		[_chat] remoteExec ["common_fnc_globalSideChat", 0, false];
		private _reward = call common_fnc_giveReward;
		private _hint = ["ia", "side", "successHint"] call BIS_fnc_GetCfgData;
		[format[_hint, _reward]] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	sleep _checkDelay;
};
