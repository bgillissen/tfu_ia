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

private _aoCoord = getMarkerPos (["ia", "ao", "circle"] call BIS_fnc_GetCfgData);
private _baseCoord = getMarkerPos "SZ";
private _hqType = ["ia", "side", "research", "hqType"] call BIS_fnc_GetCfgData;
private _flatPos = [0,0,0];
private _minDistFromBase = ["ia", "side", "minDistFromBase"] call BIS_fnc_GetCfgData;
private _minDistFromAO = ["ia", "side", "minDistFromAO"] call BIS_fnc_GetCfgData;

//find a flat position, near coast
while ( true ) do {
	_position = [] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [5, 1, 0.2, (sizeOf _hqType), 0, false];
	while {(count _flatPos) < 2} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [10, 1, 0.2, sizeOf _hqType, 0, false];
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
private _hq = _hqType createVehicle _flatPos;
_hq setDir (random 360);
_hq setVectorUp [0,0,1];
_hqType = nil;

(getPos _hq) params["_hqX", "_hqY", "_hqZ"];

//objective table, laptop
private _tableType = ["ia", "side", "table"] call BIS_fnc_GetCfgData;
private _table = _tableType createVehicle [_hqX, _hqY, (_hqZ+1)];
_table enableSimulation true;
_tableType = nil;

private _laptopType = ["ia", "side", "laptop"] call BIS_fnc_GetCfgData;
private _laptop = _laptopType createVehicle [_hqX, _hqY, (_hqZ+5)];
_laptopType = nil;

[_table, _laptop, [0,0,0.83]] call BIS_fnc_relPosObject;
_laptop enableSimulation true;

private _action = ["ia", "side", "research", "action"] call BIS_fnc_GetCfgData;
[_laptop, _action] remoteExec ["SIDE_fnc_addAction", allPlayers - entities "HeadlessClient_F"];
_action = nil;

//spawn units
private _size = ["ia", "side", "size"] call BIS_fnc_GetCfgData;
private _skill = ["ia", "side", "garrisonSkill"] call BIS_fnc_GetCfgData;
private _groups = [_flatPos, 0, 4, 2, 0, 2, 1, 1, 2, 3, 0, (_size + (random 150))] call SIDE_fnc_placeEnemies;
_groups append ([_hq, _skill] call IA_fnc_forcedGarrison);
_skill = nil;


//markers
private _title = ["ia", "side", "research", "title"] call BIS_fnc_GetCfgData; 
[_flatPos, _title, _size] call SIDE_fnc_placeMarkers;
//briefing
private _briefing = ["ia", "side", "briefing"] call BIS_fnc_GetCfgData;
private _desc = ["ia", "side", "research", "briefing"] call BIS_fnc_GetCfgData;
[format[_briefing, _title, _desc]] remoteExec ["common_fnc_globalHint", 0, false];
["NewSideMission", _title] remoteExec ["common_fnc_globalNotification" ,0 , false];
_title = nil;
_size = nil;
_briefing = nil;
_desc = nil;

private _checkDelay = ["ia", "checkDelay"] call BIS_fnc_GetCfgData;

while ( true ) do {
	if (!alive _hq) exitWith {
		private _fail = ["ia", "side", "failHint"] call BIS_fnc_GetCfgData;
		[_fail] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_laptop, _table, _hq]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_success ) exitWith {
		private _planted = ["ia", "side", "research", "planted"] call BIS_fnc_GetCfgData;
		private _delay = ["ia", "side", "boomDelay"] call BIS_fnc_GetCfgData;
		[format[_planted, _delay]] remoteExec ["common_fnc_globalSideChat", 0, false];
		sleep _delay;
		[[_hqX, _hqY, (_hqZ+2)], false] spawn SIDE_fnc_boom;
		deleteVehicle _laptop;
		deleteVehicle _table;
		private _reward = call common_fnc_giveReward;
		private _hint = ["ia", "side", "successHint"] call BIS_fnc_GetCfgData;
		[format[_hint, _reward]] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_hq]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _groups, [_laptop, _table, _hq]] spawn SIDE_fnc_cleanup;
	};
	sleep _checkDelay;
};