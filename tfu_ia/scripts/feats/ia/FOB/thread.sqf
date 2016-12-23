/*
@filename: feats\iaFOB\thread.sqf
Author:
	Ben
Description:
	this run on server,
	it start a FOB mission, and wait for it to complete 
*/

params ["_fob", "_type", "_aoZone"];

private _coord =  = getMarkerPos _fob;

"FOB_marker" setMarkerPos (_coord);

private ["_veh1", "_veh2", "_pDir"];
{
	if ( (_x select 0) == _fob ) exitWith {
		_veh1 = _x select 1;
		_veh2 = _x select 2;
		_pDir = _x select 3;
	};
} count FOB_objects;

private _v1 = _veh1 select 0;
private _v1Dir =  _veh1 select 1;
_veh1 = (BV_car select random (count BV_car)) createVehicle (getMarkerPos v1);
_veh1 setDir _v1Dir;
_v1 = nil;
_v1Dir = nil;
[_veh1, VC_car] call common_fnc_setCargo;

private _v2 = _veh2 select 0;
private _v2Dir =  _veh2 select 1;
_veh2 = (BV_car select random (count BV_car)) createVehicle (getMarkerPos v1);
_veh2 setDir _v2Dir;
_v2 = nil;
_v2Dir = nil;
[_veh2, VC_car] call common_fnc_setCargo;


private _pad = "Land_HelipadSquare_F" createVehicle _coord;
_pad setDir _pDir;
_pDir = nil;

private _depotCoord = getMarkerPos "FOB_Depot";
private _truck = (selectRandom (missionNamespace getVariable format["BV_%1", _type])) createVehicle _depotCoord;
[_truck, format["VC_%1", _type]] call common_fnc_setCargo;

[format [FOB_newHint, (FOB_maxTime / 60)]] remoteExec ["AW_fnc_globalHint", 0, false];

private _time = time;
private _lastSpawnTime = time;
private _lastSpawnCoord = nil;
private _groups = [];
private _vehs = [];
while ( true ) {
	if ( count _groups < FOB_maxGroup ) then {
		if ( time > (_lastSpawn + FOB_spawnDelay) ) then {
			if ( (_truck distance _depotCoord > FOB_minDistToDepot)  && (_truck distance _coord > 100) ) then {
				private _distance = 100 + (random 100);
				private _spawnCoord = [_truck, _distance, getDir (_truck)] call BIS_fnc_relPos;
				private _spawnVeh = false;
				if ( !isNil _lastSpawnCoord ) then {
					//check if they moved a little since the last spawn, if not mutch let's punish them
					_spawnVeh = ( _truck distance _lastSpawnCoord < 400 );
				}
				private ["_group", "_veh"];
				if ( !_spawnVeh ) then {
					private _groupPath = selectRandom S_patrolGroups;
					private _infGroup = selectRandom ([_groupPath] call Bis_fnc_getCfgSubClasses);
					_group = [_spawnCoord, ENEMY_SIDE, (_groupPath + [_infGroup]) call BIS_fnc_configPath] call BIS_fnc_spawnGroup;
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
					if (IA_lockVeh) then _veh lock 3;
					_vehs append _veh;
				};
				//set skill
				[(units _group), FOB_skill] call common_fnc_setSkill;
				//add to zeus
				{
					if ( _spawnVeh ) then _x addCuratorEditableObjects [[_veh], false];
					_x addCuratorEditableObjects [units _group, false];
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
				//update lastspawn time and coord
				_lastSpawn = time;
				_lastSpawnCoord = _spawnCoord;
			};
		};
	};
	sleep IA_loopDelay;
	if (_truck distance _coord <= 10) ewitWith {
		private _reward = call common_fnc_giveReward; 
		[format[FOB_successHint, (_reward select 1)] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _coord, _groups, _vehs, _pad, _truck] spawn FOB_fnc_cleanup;
		
	};
	if ( !alive _truck || (time > _time + FOB_maxTime) ) exitWith {
		[FOB_failHint] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _coord, _groups, _vehs, _pad, _truck, _veh1, _veh2] spawn FOB_fnc_cleanup;
		FOB_failed = true;
	};
	if ( AO_zone != _aoZone ) ewitWith {
		[FOB_newZoneHint] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _coord, _groups, _vehs, _pad, _truck, _veh1, _veh2] spawn FOB_fnc_cleanup;
	};
	if ( FOB_stop || zeusMission ) exitWith{
		[true, _coord, _groups, , vehs, _pad, _truck, _veh1, _veh2] spawn FOB_fnc_cleanup;
	};
};