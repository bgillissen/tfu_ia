/*
@filename: ia\ao\spawn.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it spawn the AO ennemy units inside the given ao coordonate 
*/

param ["_aoCoord"];
private ["_side", "_units", "_group", "_randomPos", "_groupPath", "_infGroup", "_veh", "_buildings"];

if ( PLAYER_SIDE == 'blufor' ) then {
	_side = east;
} else {
	_side = west;
};
_units = [];

//Infantry Patrols
if ( PARAMS_AO_groupPatrol > 0 ) then {
	for "_x" from 1 to PARAMS_AO_groupPatrol do {
		_randomPos = [[[_aoCoord, (PARAMS_AO_size / 1.2)],[]],["water","out"]] call BIS_fnc_randomPos;
		_groupPath = selectRandom IA_patrolGroups;
		_infGroup = selectRandom ()[_groupPath] call Bis_fnc_getCfgSubClasses);
		_group = [_randomPos, _side, (_groupPath + _infGroup) call BIS_fnc_configPath] call BIS_fnc_spawnGroup;
		[_patrolGroup, getMarkerPos currentAO, 400] call BIS_fnc_taskPatrol;

		[(units _group), IA_patrolSkill] call common_fnc_setSkill;
		
		_units append _group;

		{
			_x addCuratorEditableObjects [units _group, false];
		} foreach allCurators;
	};
};

//Snipers
if ( PARAMS_AO_sniperPatrol > 0 ) then {
	for "_x" from 1 to PARAMS_AO_sniperPatrol do {
		_randomPos = [_aoCoord, 1200, 100, 10] call BIS_fnc_findOverwatch;
		_group = [_randomPos, _side, [selectRandom IA_sniperGroups] call Bis_fnc_getCfgSubClasses] call BIS_fnc_spawnGroup;
		_group setBehaviour "COMBAT";
		_group setCombatMode "RED";
		
		[(units _group), IA_sniperSkill] call common_fnc_setSkill;
		
		_units append _group;

		{
			_x addCuratorEditableObjects [units _group, false];
		} foreach allCurators;
	};
];

//AA Tanks
if ( PARAMS_AO_aaPatrol > 0 ) then {
	for "_x" from 1 to PARAMS_AO_aaPatrol do {
	 _group = [_side, _aoCoord, (selectRandom IA_aaTank), 500, true, IA_aaSkill] call AO_fnc_vehSpawn;
	 _units append _group;
	};
};

//Tank Patrols
if ( PARAMS_AO_tankPatrol > 0 ) then {
	for "_x" from 1 to PARAMS_AO_tankPatrol) do {
		_group = [_side, _aoCoord, (selectRandom IA_tank, true), 400, IA_tankSkill] call AO_fnc_vehSpawn;
		_units append _group;
	};
};

//APC Patrols
if ( PARAMS_AO_apcPatrol > 0 ) then {
	for "_x" from 1 to PARAMS_AO_apcPatrol) do {
		_group = [_side, _aoCoord, (selectRandom IA_apc, false), 400, IA_apcSkill] call AO_fnc_vehSpawn;
		_units append _group;
	};
};

//Car Patrols
if ( PARAMS_AO_carPatrol > 0 ) then {
	for "_x" from 1 to PARAMS_AO_carPatrol) do {
		_group = [_side, _aoCoord, (selectRandom IA_car, false), 400, IA_carSkill] call AO_fnc_vehSpawn;
		_units append _group;
	};
};

//air Patrol
if( random 100 <= PARAMS_AO_airPatrolProb ) then {
	_group = createGroup _side;
	_randomPos = [[[_aoCoord, (PARAMS_AO_size / 2)],[]],["water","out"]] call BIS_fnc_randomPos;
	_veh = (selectRandom IA_airPatrol) createVehicle [_randomPos select 0, _randomPos select 1, 1000];
	waitUntil{
		sleep 0.1;
		!isNull _veh
	};
	_veh engineOn true;
	_veh setPos [_randomPos select 0,_randomPos select 1,300];

	(selectRandom IA_pilot) createUnit [_randomPos, _group];
	(selectRandom IA_pilot) createUnit [_randomPos, _group];
	((units _group) select 0) assignAsDriver _veh;
	((units _group) select 0) moveInDriver _veh;		
	((units _group) select 1) assignAsGunner _veh;
	((units _group) select 1) moveInGunner _veh;
	
	_group setCombatMode "RED";
	_veh flyInHeight 300;
	[_group, _aoCoord, 800] call BIS_fnc_taskPatrol;
	
	[(units _group), IA_airSkill] call common_fnc_setSkill;
	
	if (IA_lockVeh) _veh lock 3;
		
	_units append _group;
	_units append _veh;

	{
		_x addCuratorEditableObjects [[_veh], false];
		_x addCuratorEditableObjects [units _group, false];
	} foreach allCurators;
};

//Garrisoned units
if (PARAMS_AO_garrison > 0) then {
	_buildings = _aoCoord nearObjects ["House",500];
	if ( (count _buildings) > 6 ) then {
		_randomPos = [[[_aoCoord, (PARAMS_AO_size / 2)],[]],["water","out"]] call BIS_fnc_randomPos;
		_group = createGroup _side;
		
		for "_x" from 1 to PARAMS_AO_garrison) do {
			_unit = (selectRandom IA_garrison) createUnit [_randomPos, _group];
			[_unit, (selectRandom _buildings), true] call common_fnc_garrisonUnit;
			_units append _unit;
		};
			
		[(units _group), IA_garrisonSkill] call common_fnc_setSkill;
		
		{
			_x addCuratorEditableObjects [(units _group),FALSE];
		} count allCurators;	
	};
};

//Static weapons
if (PARAMS_AO_static > 0) then {
	for "_x" from 1 to PARAMS_AO_static do {
	_group = createGroup _side;
	_randomPos = [_aoCoord, 200, 10, 10] call BIS_fnc_findOverwatch;
	_veh = (selectRandom IA_static) createVehicle _randomPos;
	waitUntil{
		sleep 0.1;
		!isNull _veh
	};
	_veh setDir random 360;
	_veh setVectorUp [0,0,1];
	
	(selectRandom IA_garrison) createUnit [_randomPos,_group];
	((units _group) select 0) assignAsGunner _veh;
	((units _group) select 0) moveInGunner _veh;
	
	_group setBehaviour "COMBAT";
	_group setCombatMode "RED";
	
	if (IA_lockVeh) _veh lock 3;
	
	_units append _group;
	_units append _veh;
		
	{
		_x addCuratorEditableObjects [[_veh], false];
		_x addCuratorEditableObjects [(units _group), false];
	} foreach allCurators;
};

_units