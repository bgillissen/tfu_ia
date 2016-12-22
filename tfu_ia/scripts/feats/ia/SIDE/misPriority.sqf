/*
@filename: feats\ia\SIDE\misPriotiry.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run on server,
	it create a new side mission, 
	either Arti or AA tank position, not to far from AO 
*/

private _aoCoord = getMarkerPos "aoCircle";
private _szCoord = getMarkerPos "SZ";
private _hqType = "Land_Research_HQ_F";
private _flatPos = [0,0,0];
private _accepted = false;

//find a flat position, not too far from AO
while {!_accepted} do {
	_position = [[[_szCoord, 2000]], ["water","out"]] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [5, 0, 0.2, 5, 0, false];
	while {(count _flatPos) < 2} do {
		_position = [[[_szCoord, 6000]],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [5, 0, 0.2, 5, 0, false];
	};
	if ((_flatPos distance _szCoord) > SIDE_mindistFromBase) then {
		if ((_flatPos distance _aoCoord) < SIDE_priorityMaxDistFromAO) then {
			if ((_flatPos distance _aoCoord) > SIDE_priorityMinDistFromAO) then _accepted = true;
		};
	};
};

(getPos _flatPos) params["_cX", "_cY", "_cZ"];

private _tankCoords = [[_cX - 2, _cY - 2, _cZ], [_cX + 2, _cY + 2, _cZ]];
private _tankDir = (random 360);
private _truckCoord = [_cX + 20, _cY + random 20, _cZ];

//arti or AA ?
private _isArti  = [true, false] select (random 100 <= SIDE_priorityArtiProb);
private ["_title", "_briefing", "_pool", "_notification"];
if ( _isArti ) then {
	_title = SIDE_priorityArtiTitle;
	_briefing = SIDE_priorityArtiDebrief;
	 _pool = S_arti;
	 _notification = SIDE_priorityArtiNotification; 
} else {
	_title = SIDE_priorityAATitle;
	_briefing = SIDE_priorityAADebrief;
	_pool = S_aaTank;
	_notification = SIDE_priorityAANotification;
};

//spawn objective
private _tank1 = (selectRandom _pool) createVehicle (_tankCoords select 0);
_tank1 setDir _tankDir;
private _tank2 = (selectRandom _pool) createVehicle (_tankCoords select 1);
_tank2 setDir _tankDir;
_pool = nil;
//spawn an ammo truck
private _truck = (selectRandom S_ammo) createVehicle _truckCoord;
_truck setDir (random 360);

{
	_x lock 3;
	_x allowCrewInImmobile true;
} count [_truck, _tank2, _tank1];

//spawn tanks crew
private _groups = [];
_group = createGroup ENEMY_SIDE;
for "_x" from 1 to 4 {
	(selectRandom S_crew) createUnit [_flatPos, _gGroup];
};
((units _group) select 0) assignAsCommander _tank1;
((units _group) select 0) moveInCommander _tank1;
((units _group) select 1) assignAsCommander _tank2;
((units _group) select 1) moveInCommander _tank2;
((units _group) select 2) assignAsGunner tank1;
((units _group) select 2) moveInGunner _tank1;
((units _group) select 3) assignAsGunner _tank2;
((units _group) select 3) moveInGunner _tank2;
{
	_x addCuratorEditableObjects [[_tank1, _tank2, _truck] + (units _group), false];
} foreach allCurators;
_tank1 engineOn true;
_tank2 engineOn true;
_tank1 doWatch _aoCoord;
_tank2 doWatch _aoCoord;
if ( SIDE_priorityInfAmmo ) then {
	_tank1 setVariable ["fired_EH", (_tank1 addEventHandler ["Fired",{ (_this select 0) setVehicleAmmo 1 }])];
	_tank2 setVariable ["fired_EH", (_tank2 addEventHandler ["Fired",{ (_this select 0) setVehicleAmmo 1 }])];
};
if ( SIDE_priorityExtraHealth ) then {
	_tank1 setVariable ["damage_EH", ([_tank1] call SIDE_fnc_reduceDamage)];
	_tank2 setVariable ["damage_EH", ([_tank2] call SIDE_fnc_reduceDamage)];
};
[(units _group), 4] call common_fnc_setSkill;
_group setBehaviour "COMBAT";
_group setCombatMode "RED";	
_group allowFleeing 0;

_groups append _group;

//H-barrier ring
private _distance = 16;
private _dir = 0;
for "_c" from 0 to 7 do {
	private _pos = [_flatPos, _distance, _dir] call BIS_fnc_relPos;
	private _barrier = SIDE_priorityHBarrier createVehicle _pos;
	_barrier setDir _dir;
	_dir = _dir + 45;
	_barrier allowDamage false; 
	_barrier enableSimulation false;
		
	_groups append [_barrier];
};

//spawn units ["_coord", "_civ", "_inf", "_sniper", "_garrison", "_static", "_aa", "_tank", "_apc", "_car", "_air", "_patrolSize"];
_groups append [_flatPos, 0, 4, 2, 0, 0, ([0,2] select (_isArti)), 2, 2, 3, 0, (SIDE_size + (random 150))] call SIDE_fnc_placeEnemies;

//briefing
[_flatPos, _title, SIDE_size] call SIDE_fnc_placeMarkers;
[format[SIDE_priorityBriefing, _title, _briefing] remoteExec ["common_fnc_globalHint", 0, false];
["NewSideMission", _title] remoteExec ["common_fnc_globalNotification" ,0 , false];

if ( isArti ) then {
	private _tickMax = ["ArtilleryTargetTickTimeMax"] call core_fnc_getConf;;
	private _tickMin = ["ArtilleryTargetTickTimeMin"] call core_fnc_getConf;
};

while ( true ) do {
	if (!alive _tank1) then {
		_tank1 removeEventHandler ["Fired", 0];
		if ( SIDE_priorityExtraHealth ) then _tank1 removeEventHandler ["HandleDamage", (_tank1 getVariable "damage_EH")];
		if ( SIDE_priorityInfAmmo ) then _tank1 removeEventHandler ["Fired", (_tank1 getVariable "fired_EH")];
		if (!alive _tank2) ewitWith {
			if ( SIDE_priorityExtraHealth ) then _tank2 removeEventHandler ["HandleDamage", (_tank2 getVariable "damage_EH")];
			if ( SIDE_priorityInfAmmo ) then _tank2 removeEventHandler ["Fired", (_tank2 getVariable "fired_EH")];
			[SIDE_prioritySuccess] remoteExec ["common_fnc_globalHint", 0, false];
			["CompletedPriorityTarget", _notification] remoteExec ["AW_fnc_globalNotification", 0, false];
			[false, _flatPos, _groups, [_truck, _tank1, _tank2]] spawn SIDE_fnc_cleanup;
		};
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _groups, [_truck, _tank1, _tank2]] spawn SIDE_fnc_cleanup;
	};
	if ( isArti ) then {
		[_tank1, _tank2] call SIDE_fnc_artiFire;
		private "_tick"; 
		if (_tickMax <= _tickMin) then {
			_tick = _tickMin;
		} else {
			_tick = (_tickMax + (random (_tickMax - _tickMin)));
		};
		private _end = time + _tick;
		while ( true ) do {
			if ( time >= _end ) ewitWith{};
			if ( SIDE_stop || zeusMission ) exitWith {};
			sleep IA_checkDelay;
		};
	} else {
		[_tank1, _tank2] call SIDE_fnc_aaFire;
	}
	sleep IA_checkDelay;
};