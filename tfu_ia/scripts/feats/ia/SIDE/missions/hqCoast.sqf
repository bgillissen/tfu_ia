/*
@filename: feats\ia\SIDE\misHQCoast.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	run on server,
	spawn by feats\ia\SIDE\serverPostInitTheard.sqf, 
	a HQ bunker near coast with a crate to "activate" on top. 
Params:
	none
Environment:
	missionNamespace:
		S_crates
		SIDE_stop
		zeusMission
	missionConfig:
		ia >> oa >> circle
		ia >> side >> minDistFromBase
		ia >> side >> minDistFromAO
		ia >> side >> hqCoast >> action
		ia >> side >> size
		ia >> side >> garrisonSkill
		ia >> side >> hqCoast >> title
		ia >> side >> briefing
		ia >> side >> hqCoast >> briefing
		ia >> checkDelay
		ia >> side >> failHint
		ia >> side >> hqCoast >> planted
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
private _flatPos = [0,0,0];
private _minDistFromBase = ["ia", "side", "minDistFromBase"] call core_fnc_getSetting;
private _minDistFromAO = ["ia", "side", "minDistFromAO"] call core_fnc_getSetting;

//find a flat position, near coast
while {!_accepted} do {
	private _position = [[[] call BIS_fnc_worldArea],["water","out"]] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [2,0,0.3,1,1,true];
	while {(count _flatPos) < 2} do {
		_position = [[[] call BIS_fnc_worldArea],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [2,0,0.3,1,1,true];
	};

	if ( (_flatPos distance _baseCoord) >= _minDistFromBase ) then {
		if ( _aoCoord isEqualTo [0,0,0] ) exitWith {};
		if ( (_flatPos distance _aoCoord) >= _minDistFromAO ) exitWith {};
	};
};
_aoCoord = nil;
_szCoord = nil;
_minDistFromBase = nil;
_minDistFromAO = nil;

//objective building
private _hq = "Land_Cargo_HQ_V1_F" createVehicle _flatPos;
_hq setDir (random 360);
_hq setVectorUp [0,0,1];

(getPos _hq) params["_hqX", "_hqY", "_hqZ"];

//objective crate
private _crate = (selectRandom S_crates) createVehicle [0,0,0];
_crate allowDamage false;
_crate setPos [_hqX, _hqY, (_hqZ + 5)];
private _action = ["ia", "side", "hqCoast", "action"] call core_fnc_getSetting;
[_crate, _action] call SIDE_fnc_addAction;
_action =nil;

//ambiance objects
private _coord = [_flatPos, 200, 300, 10, 2, 1, 0] call BIS_fnc_findSafePos;
private _trawler = "C_Boat_Civil_04_F" createVehicle _coord;
_trawler setDir random 360;
_trawler allowDamage false;
_coord = nil;

_coord = [_flatPos, 15, 25, 10, 0, 1, 0] call BIS_fnc_findSafePos;
private _boat = "O_Boat_Transport_01_F" createVehicle _coord;
_boat setDir random 360;
_boat allowDamage false;
_boat lock 3;
_coord = nil;

//spawn units
private _size = ["ia", "side", "size"] call core_fnc_getSetting;
private _skill = ["ia", "side", "garrisonSkill"] call core_fnc_getSetting;
private _groups = [_flatPos, 0, 4, 2, 0, 1, 1, 1, 2, 3, 0, (_size + (random 150))] call SIDE_fnc_placeEnemies;
_groups append ([_hq, _skill] call IA_fnc_forcedGarrison);
_skill = nil;

//markers
private _title = ["ia", "side", "hqCoast", "title"] call core_fnc_getSetting; 
[_flatPos, _title, _size] call SIDE_fnc_placeMarkers;
//briefing
private _briefing = ["ia", "side", "briefing"] call core_fnc_getSetting;
private _desc = ["ia", "side", "hqCoast", "briefing"] call core_fnc_getSetting;
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
		[false, _flatPos, _groups, [_boat, _trawler, _crate, _hq]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_success ) exitWith {
		private _planted = ["ia", "side", "hqCoast", "planted"] call core_fnc_getSetting;
		private _delay = ["ia", "side", "boomDelay"] call core_fnc_getSetting;
		[1, format[_planted, _delay], ["HQ", PLAYER_SIDE]] call global_fnc_chat;
		_planted = nil;
		sleep _delay;
		_delay = nil;
		[getPos _crate, true] spawn SIDE_fnc_boom;
		deleteVehicle _crate;
		private _reward = call common_fnc_giveReward;
		private _hint = ["ia", "side", "successHint"] call core_fnc_getSetting;
		format[_hint, _reward] call global_fnc_hint;
		_hint = nil;
		_reward = nil;
		[false, _flatPos, _groups, [_boat, _trawler, _hq]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _groups, [_boat, _trawler, _crate, _hq]] spawn SIDE_fnc_cleanup;
	};
	sleep _checkDelay;
};