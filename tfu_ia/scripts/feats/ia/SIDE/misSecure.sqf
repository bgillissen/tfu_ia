/*
@filename: feats\ia\SIDE\misSecure.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run on server,
	it create a new side mission, 
	a radar or chopper to secure, we put a laptop to "activate" in a cargo house.
	and some guard tower around.
*/

private _aoCoord = getMarkerPos AO_circle;
private _szCoord = getMarkerPos "SZ";
private _flatPos = [0,0,0];
private _accepted = false;

//find a flat position, near coast
while {!_accepted} do {
	_position = [] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [5, 1, 0.2, (sizeOf _hqType), 0, false];
	while {(count _flatPos) < 2} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [10, 1, 0.2, sizeOf _hqType, 0, false];
	};
	if ((_flatPos distance _szCoord) > SIDE_minDistFromBase ) then {
		if ( _flatPos distance _aoCoord) > SIDE_minDistFromAO ) then _accepted = true;
	};
};
_aoCoord = nil;
_szCoord = nil;
_accepted = nil;

private _isRadar = [false, true] select (random 100 <= SIDE_secureRadarProb);
private ["_title", "_briefing", "_pool", "_notification"];
if ( _isRadar ) then {
	_title = SIDE_secureRadarTitle;
	_briefing = SIDE_secureRadarDebrief;
	 _pool = ["Land_Radar_Small_F"];
	 _notification = SIDE_secureRadarNotification; 
} else {
	_title = SIDE_secureChopperTitle;
	_briefing = SIDE_secureChopperDebrief;
	_pool = S_airPatrol;
	_notification = SIDE_secureChopperNotification;
};

//spawn objective
private _obj = (selectRandom _pool) createVehicle ([_flatPos, 25, 35, 10, 0, 0.5, 0] call BIS_fnc_findSafePos);
_obj setDir random 360;
if ( !isRadar ) then _obj lock 3;

//cargo house
private _cargo = "Land_Cargo_House_V3_F" createVehicle _objPos;
_cargo setDir random 360;

(getPos _cargo) params["_cargoX", "_cargoY", "_cargoZ"];

//table, laptop
private _table = SIDE_table createVehicle [_cargoX, _cargoY, (_cargoY+1)];
_table enableSimulation true;
private _laptop = SIDE_laptop createVehicle [_cargoX, _cargoY, (_cargoY+5)];
[_table, _laptop, [0,0,0.83]] call BIS_fnc_relPosObject;
_laptop enableSimulation true;
[_laptop, SIDE_secureAction] remoteExec ["SIDE_fnc_addAction", allPlayers - entities "HeadlessClient_F"];

private _groups = [];

//Populated watchTower
private _tower1 = "Land_Cargo_Patrol_V3_F" createVehicle ([_flatPos, 50, 0] call BIS_fnc_relPos);
_tower1 setDir 180;
_groups append [_tower1, SIDE_garrisonSkill] call IA_fnc_forcedGarrison;
private _tower2 = "Land_Cargo_Patrol_V3_F" createVehicle ([_flatPos, 50, 120] call BIS_fnc_relPos);
_tower2 setDir 300;
_groups append [_tower2, SIDE_garrisonSkill] call IA_fnc_forcedGarrison;
private _tower3 = "Land_Cargo_Patrol_V3_F" createVehicle ([_flatPos, 50, 240] call BIS_fnc_relPos);
_tower3 setDir 60;
_groups append [_tower3, SIDE_garrisonSkill] call IA_fnc_forcedGarrison;

//spawn units ["_coord", "_civ", "_inf", "_sniper", "_garrison", "_static", "_aa", "_tank", "_apc", "_car", "_air", "_patrolSize"];
_groups append [_flatPos, 0, 4, 2, 0, 2, 1, 1, 2, 3, 0, (SIDE_size + (random 150))] call SIDE_fnc_placeEnemies;

//briefing
[_flatPos, _title, SIDE_size] call SIDE_fnc_placeMarkers;
[format[SIDE_briefing, _title, _briefing] remoteExec ["common_fnc_globalHint", 0, false];
["NewSideMission", _title] remoteExec ["common_fnc_globalNotification" ,0 , false];


while ( true ){
	if (!alive _cargo || !alive _obj) exitWith {
		[SIDE_failHint] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_laptop, _table, _cargo, _obj, _tower1, _tower2, _tower3]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_success ) exitWith {
		[format[SIDE_securePlanted, SIDE_boomDelay]] remoteExec ["common_fnc_globalSideChat", 0, false];
		sleep SIDE_boomDelay;
		[[_cargoX, _cargoY, (_cargoZ+2)], false] spawn SIDE_fnc_boom.sqf
		deleteVehicle _laptop;
		deleteVehicle _table;
		private _reward = call common_fnc_giveReward;
		[format[SIDE_successHint, _reward] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_cargo, _obj, _tower1, _tower2, _tower3]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _groups, [_laptop, _table, _cargo, _obj, _tower1, _tower2, _tower3]] spawn SIDE_fnc_cleanup;
	};
	sleep IA_checkDelay;
};