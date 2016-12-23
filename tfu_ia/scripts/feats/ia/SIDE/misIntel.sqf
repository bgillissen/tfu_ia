/*
@filename: feats\ia\SIDE\misIntel.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run on server,
	it create a new side mission, 
	an officer to "capture" inside a car or not 
*/

private _aoCoord = getMarkerPos AO_circle;
private _szCoord = getMarkerPos "SZ";
private _flatPos = [0,0,0];
private _accepted = false;

//find a flat position
while {!_accepted} do {
	_position = [] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [5, 1, 0.2, (sizeOf _cargoType), 0, false];
	while {(count _flatPos) < 2} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [10, 1, 0.2, sizeOf _hqType, 0, false];
	};
	if ((_flatPos distance _szCoord) > SIDE_minDistFromBase ) then {
		if ( _flatPos distance _aoCoord) > SIDE_minDistFromAO ) then _accepted = true;
	};
};
_szCoord = nil;
_accepted = nil;

private _inVehicle = [false, true] (random 100 <= SIDE_intelVehicleProb);

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

private ["_guard1", "_guard2", "_addActionTo", "_toclean"];
if ( _inVehicle ) then {
	_intel moveInCargo _intelCar;
	_addActionTo = _intelCar;
} else {
	private _guard1 = (selectRandom S_officer) createUnit [_pos1, _intelGroup];
	private _guard2 = (selectRandom S_officer) createUnit [_pos1, _intelGroup];
	_addActionTo = _intel;
};

[(units _intelGroup), 2] call common_fnc_setSkill;
[(units _fake1Group), 2] call common_fnc_setSkill;
[(units _fake2Group), 2] call common_fnc_setSkill;

[_addActionTo, SIDE_intelAction] remoteExec ["SIDE_fnc_addAction", allPlayers - entities "HeadlessClient_F"];

//detection trigger
private _trigger = createTrigger ["EmptyDetector", getPos _intel];
_trigger setTriggerArea [SIDE_intelTriggerSize, SIDE_intelTriggerSize, 0, false];
_trigger setTriggerActivation [PLAYER_SIDETXT, "PRESENT", false];
_trigger setTriggerStatements ["this","",""];
_trigger attachTo [_intel,[0,0,0]];

private _groups = [];
_groups append [_intelGroup];
_groups append [_fake1Group];
_groups append [_fake2Group];
//spawn units ["_coord", "_civ", "_inf", "_sniper", "_garrison", "_static", "_aa", "_tank", "_apc", "_car", "_air", "_patrolSize"];
_groups append [_flatPos, 0, 4, 0, 0, 0, 1, 0, 2, 2, 0, (SIDE_size - (random 50))] call SIDE_fnc_placeEnemies;

//briefing
[_flatPos, SIDE_intelTitle, SIDE_size] call SIDE_fnc_placeMarkers;
[format[SIDE_briefing, SIDE_intelTitle, SIDE_intelBriefing] remoteExec ["common_fnc_globalHint", 0, false];
["NewSideMission", SIDE_intelTitle] remoteExec ["common_fnc_globalNotification" ,0 , false];

private _isFleing = false;
private _escaped = false;

while ( true ) do {
	private ["_cond"];
	if ( _inVehicle ) then {
		_cond = (alive _intelCar);
	} else {
		_cond = (alive _intel);
	}
	if ( !_cond ) exitWith {
		[SIDE_failHint] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	if ( _escaped ) exitWith {
		[SIDE_intelFail] remoteExec ["common_fnc_globalSideChat", 0, false];
		[SIDE_failHint] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	if ( _isFleing ) then {
		_escaped = (count list _trigger < 1);
	} else {
		if (_intel call BIS_fnc_enemyDetected) then {
			[SIDE_intelSpotted] remoteExec ["AW_fnc_globalSideChat",0,false];
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
		[SIDE_intelSecured] remoteExec ["common_fnc_globalSideChat", 0, false];
		private _reward = call common_fnc_giveReward;
		[format[SIDE_successHint, _reward] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _groups, [_intelCar, _fake1Car, _fake2Car, _trigger]] spawn SIDE_fnc_cleanup;
	};
	sleep IA_checkDelay;
};
