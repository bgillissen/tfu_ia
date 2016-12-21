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

params ["_aoCoord", "_aoSize"];
private ["_aoSize", "_units", "_count", "_group", "_randomPos", "_groupPath", "_infGroup", "_veh", "_buildings"];

_units = [];

//Infantry Patrols
_count = ["AO_groupPatrol"] call core_fnc_getConf; 
if ( _count) > 0 ) then {
	for "_x" from 1 to _count do {
		_randomPos = [[[_aoCoord, (_aoSize / 1.2)],[]],["water","out"]] call BIS_fnc_randomPos;
		_groupPath = selectRandom S_patrolGroups;
		_infGroup = selectRandom ([_groupPath] call Bis_fnc_getCfgSubClasses);
		_group = [_randomPos, ENEMY_SIDE, (_groupPath + [_infGroup]) call BIS_fnc_configPath] call BIS_fnc_spawnGroup;
		[_patrolGroup, getMarkerPos currentAO, 400] call BIS_fnc_taskPatrol;

		[(units _group), IA_patrolSkill] call common_fnc_setSkill;
		
		_units append _group;

		{
			_x addCuratorEditableObjects [units _group, false];
		} count allCurators;
	};
};

//Snipers
_count = ["AO_sniperPatrol"] call core_fnc_getConf;
if ( _countl > 0 ) then {
	for "_x" from 1 to _sniperPatrol do {
		_randomPos = [_aoCoord, 1200, 100, 10] call BIS_fnc_findOverwatch;
		_group = [_randomPos, ENEMY_SIDE, [selectRandom S_sniperGroups] call Bis_fnc_getCfgSubClasses] call BIS_fnc_spawnGroup;
		_group setBehaviour "COMBAT";
		_group setCombatMode "RED";
		
		[(units _group), IA_sniperSkill] call common_fnc_setSkill;
		
		_units append _group;

		{
			_x addCuratorEditableObjects [units _group, false];
		} count allCurators;
	};
];

//Garrisoned units
_count = ["AO_garrison"] call core_fnc_getConf;
if ( _count > 0) then {
	_buildings = _aoCoord nearObjects ["House",500];
	if ( (count _buildings) > 6 ) then {
		_randomPos = [[[_aoCoord, (_aoSize / 2)],[]],["water","out"]] call BIS_fnc_randomPos;
		_group = createGroup ENEMY_SIDE;
		
		for "_x" from 1 to _count) do {
			_unit = (selectRandom S_garrison) createUnit [_randomPos, _group];
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
_count = ["AO_static"] call core_fnc_getConf;
if ( _count > 0) then {
	for "_x" from 1 to _count do {
		_group = createGroup ENEMY_SIDE;
		_randomPos = [_aoCoord, 200, 10, 10] call BIS_fnc_findOverwatch;
		_veh = (selectRandom S_static) createVehicle _randomPos;
		waitUntil{
			sleep 0.1;
			!isNull _veh
		};
		_veh setDir random 360;
		_veh setVectorUp [0,0,1];
	
		(selectRandom S_garrison) createUnit [_randomPos,_group];
		((units _group) select 0) assignAsGunner _veh;
		((units _group) select 0) moveInGunner _veh;
	
		_group setBehaviour "COMBAT";
		_group setCombatMode "RED";
	
		if (IA_lockVeh) then _veh lock 3;
	
		_units append _group;
		_units append _veh;
		
		{
			_x addCuratorEditableObjects [[_veh], false];
			_x addCuratorEditableObjects [(units _group), false];
		} count allCurators;
	};
};
	
//AA Tanks
_count = ["AO_aaPatrol"] call core_fnc_getConf; 
if ( _count > 0 ) then {
	for "_x" from 1 to _count do {
	 _group = [ENEMY_SIDE, _aoCoord, _aoSize, (selectRandom S_aaTank), 500, true, IA_aaSkill] call AO_fnc_placeVehicle;
	 _units append _group;
	};
};

//Tank Patrols
_count = ["AO_tankPatrol"] call core_fnc_getConf; 
if ( _count > 0 ) then {
	for "_x" from 1 to _count) do {
		_group = [ENEMY_SIDE, _aoCoord, _aoSize, (selectRandom S_tank, true), 400, IA_tankSkill] call AO_fnc_placeVehicle;
		_units append _group;
	};
};

//APC Patrols
_count = ["AO_apcPatrol"] call core_fnc_getConf;
if ( _count > 0 ) then {
	for "_x" from 1 to _count) do {
		_group = [ENEMY_SIDE, _aoCoord, _aoSize, (selectRandom S_apc, false), 400, IA_apcSkill] call AO_fnc_placeVehicle;
		_units append _group;
	};
};

//Car Patrols
_count = ["AO_tankPatrol"] call core_fnc_getConf;
if ( _count > 0 ) then {
	for "_x" from 1 to _count) do {
		_group = [ENEMY_SIDE, _aoCoord, _aoSize, (selectRandom S_car, false), 400, IA_carSkill] call AO_fnc_placeVehicle;
		_units append _group;
	};
};

//air Patrol

if( random 100 <= (["AO_airPatrolProb"] call core_fnc_getConf) ) then {
	_group = createGroup ENEMY_SIDE;
	_randomPos = [[[_aoCoord, (_aoSize / 2)],[]],["water","out"]] call BIS_fnc_randomPos;
	_veh = (selectRandom S_airPatrol) createVehicle [_randomPos select 0, _randomPos select 1, 1000];
	waitUntil{
		sleep 0.1;
		!isNull _veh
	};
	_veh engineOn true;
	_veh setPos [_randomPos select 0,_randomPos select 1,300];

	(selectRandom S_pilot) createUnit [_randomPos, _group];
	(selectRandom S_pilot) createUnit [_randomPos, _group];
	((units _group) select 0) assignAsDriver _veh;
	((units _group) select 0) moveInDriver _veh;		
	((units _group) select 1) assignAsGunner _veh;
	((units _group) select 1) moveInGunner _veh;
	
	_group setCombatMode "RED";
	_veh flyInHeight 300;
	[_group, _aoCoord, 800] call BIS_fnc_taskPatrol;
	
	[(units _group), IA_airSkill] call common_fnc_setSkill;
	
	if (IA_lockVeh) then _veh lock 3;
		
	_units append _group;
	_units append _veh;

	{
		_x addCuratorEditableObjects [[_veh], false];
		_x addCuratorEditableObjects [units _group, false];
	} count allCurators;
};

_units