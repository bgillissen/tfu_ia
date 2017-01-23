/*
@filename: feats\ia\FOB\thread.sqf
Author:
	Ben
Description:
	this run on server,
	it start a FOB mission, and wait for it to complete 
*/

params ["_fob", "_type", "_aoZone"];

private _coord = getMarkerPos _fob;

private _marker = ["ia", "fob", "marker"] call core_fnc_getSetting;
private _color = ["colorBLUFOR", "colorOPFOR"] select (PLAYER_SIDE isEqualTo west);
createMarker [_marker, _coord];
_marker setMarkerColor _color;
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_end";


private _vMarker1 = format["%1_veh1", _fob];
private _veh1 = (selectRandom BV_carArmed) createVehicle (getMarkerPos _vMarker1);
_veh1 setDir (markerDir _vMarker1);
[_veh1, C_car] call common_fnc_setCargo;
_vMarker1 = nil;

private _vMarker2 = format["%1_veh2", _fob];
private _veh2 = (selectRandom BV_carArmed) createVehicle (getMarkerPos _vMarker2);
_veh2 setDir (markerDir _vMarker2);
[_veh2, C_car] call common_fnc_setCargo;
_vMarker2 = nil;

private _pad = "Land_HelipadSquare_F" createVehicle _coord;
_pad setDir (markerDir _fob);

private _depotCoord = getMarkerPos "FOB_depot";
private _truck = (selectRandom (missionNamespace getVariable format["BV_%1", _type])) createVehicle _depotCoord;
[_truck, format["C_%1", _type]] call common_fnc_setCargo;
_depotCoord = nil;

private _hint = ["ia", "fob", "newHint"] call core_fnc_getSetting;
private _maxTime = ["ia", "fob", "maxTime"] call core_fnc_getSetting;
format [_hint, (_maxTime / 60)] call global_fnc_hint;

private _endTime = time + _maxTime;
private _maxGrp = ["ia", "fob", "maxGroup"] call core_fnc_getSetting;
private _maxVeh  = ["ia", "fob", "maxVehicle"] call core_fnc_getSetting;
private _lockVeh = ["ia", "lockVeh"] call core_fnc_getSetting;
private _loopDelay = ["ia", "loopDelay"] call core_fnc_getSetting;
private _spawnDelay = ["ia", "waveDelay"] call core_fnc_getSetting;
private _nextSpawn = time + _spawnDelay;
private _lastSpawnTime = time;
private _lastSpawnCoord = nil;
private _groups = [];
private _vehs = [];

while ( true ) do {
	if ( (count _groups) <= _maxGrp ) then {
		if ( time > _nextSpawn ) then {
			if ( (_truck distance _depotCoord > FOB_minDistToDepot)  && (_truck distance _coord > 100) ) then {
				private _distance = 100 + (random 100);
				private _spawnCoord = [_truck, _distance, getDir (_truck)] call BIS_fnc_relPos;
				private _spawnVeh = false;
				if ( !isNil "_lastSpawnCoord" ) then {
					//check if they moved a little since the last spawn, if not mutch let's punish them
					_spawnVeh = ( (_truck distance _lastSpawnCoord < 400) && (count _vehs <= _maxVeh) );
				};
				private ["_group", "_veh"];
				if ( !_spawnVeh ) then {
					private _groupPath = selectRandom S_patrolGroups;
					private _infGroup = selectRandom ([_groupPath] call Bis_fnc_getCfgSubClasses);
					_group = [_spawnCoord, ENEMY_SIDE, (_groupPath + [_infGroup]) call BIS_fnc_configPath] call BIS_fnc_spawnGroup;
					_groupPath = nil;
					_infGroup = nil;
				} else {
					_group = createGroup ENEMY_SIDE;
					_veh = (selectRandom S_apc) createVehicle _spawnCoord;
					(selectRandom IA_crew) createUnit [_spawnCoord,_group];
					(selectRandom IA_crew) createUnit [_spawnCoord,_group];
					(selectRandom IA_crew) createUnit [_spawnCoord,_group];
					((units _group) select 0) assignAsDriver _veh;
					((units _group) select 0) moveInDriver _veh;
					((units _group) select 1) assignAsGunner _veh;
					((units _group) select 1) moveInGunner _veh;
					if ( _lockVeh ) then { _veh lock 3; };
					_vehs append [_veh];
				};
				//set skill
				[(units _group), FOB_skill] call common_fnc_setSkill;
				//add to zeus
				{
					if ( _spawnVeh ) then {
						_x addCuratorEditableObjects [[_veh], false];
					};
					_x addCuratorEditableObjects [(units _group), false];
				} count allCurators;
				//make new group attack the truck
				[_group, (getPos _truck)] call BIS_fnc_taskAttack;
				
				_groups append [_group];
				//remove killed groups
				{
					if ((count units _x) == 0) then {
						_groups = _groups - [_x];
						deleteGroup _x;
					};
				} count _groups;
				//update lastspawn time and coord, next time
				_lastSpawn = time;
				_lastSpawnCoord = _spawnCoord;
				_nextSpawn = time + _spawnDelay;
			};
		};
	};
	sleep _loopDelay;
	if (_truck distance _coord <= 10) exitWith {
		private _reward = call common_fnc_giveReward; 
		private _hint = ["ia", "fob", "succesHint"] call core_fnc_getSetting;
		format[_hint, (_reward select 1)] call global_fnc_hint;
		[false, _coord, _groups, _vehs, _pad, _truck, _marker] spawn FOB_fnc_cleanup;
		private _marker = format["%1_success", _fob];
		createMarker [_marker, _coord];
		_marker setMarkerColor _color;
		_marker setMarkerShape "ICON";
		_marker setMarkerType "mil_flag";
		if ( isNil "FOB_success" ) then {  };
		(FOB_deployed select _aoZone) append [_fob];
		private _done = count (FOB_deployed select _aoZone); 
		private _avail = count (FOB_markers select _aoZone);
		if ( _done == _avail ) then {
			sleep 5;
			_hint = ["ia", "fob", "zoneHint"] call core_fnc_getSetting;
			format[_hint] call global_fnc_hint;
		};
		
	};
	if ( !alive _truck || (time > _endTime) ) exitWith {
		private _hint = ["ia", "fob", "failHint"] call core_fnc_getSetting;
		_hint call global_fnc_hint;
		[false, _coord, _groups, _vehs, _pad, _truck, _marker, _veh1, _veh2] spawn FOB_fnc_cleanup;
		//FOB_failed = true;
	};
	if ( AO_zone != _aoZone ) exitWith {
		private _hint = ["ia", "fob", "newZoneHint"] call core_fnc_getSetting;
		_hint call global_fnc_hint;
		[false, _coord, _groups, _vehs, _pad, _truck, _marker, _veh1, _veh2] spawn FOB_fnc_cleanup;
	};
	if ( FOB_stop || zeusMission ) exitWith {
		[true, _coord, _groups, _vehs, _pad, _truck, _marker, _veh1, _veh2] spawn FOB_fnc_cleanup;
	};
};