/*
@filename: feats\vehicleRespawn\serverInitThread.sqf
Author:
	ben
Description:
	this run on server,
	must be spawn, not called,
	loop through all the vehicles we got to monitor and respawn them when needed
	
*/

private ["dist", "_queue", "_veh", "_delay", "_type", "_pos", "_dir", "_id", "_inqueue", "_new"];

_dist = ["VehicleRespawn_distance"] call core_fnc_getConf;
_queue = [];

while {true} do {
	
	sleep VR_checkDelay;
	
	if ( isNil "VEHRESPAWN" ) then continue;
	if ( (count VEHRESPAWN) == 0 ) then continue;
	
	{
		_id = _forEachIndex;
		_veh = _x select 0;
		_delay = _x select 1;
		_type = _x select 2;
		_pos = _x select 3;
		_dir = _x select 4;
		_inqueue = false;
		
		{
			if ( _id == _x select 0) then _inqueue = true;
			if ( time > _x select 1) then {
				_entry = VEHRESPAWN select (_x select 0);
				_new = [_entry select 0, _entry select 2, _entry select 3, _entry select 4] call vehicleRespawn_fnc_spawn;
				_entry set [0,_new];
				VEHRESPAWN set [(_x select 0), _entry];
			};
		} forEach(_queue);
		
		if ( _inqueue ) then continue;
		
		if (!alive _veh) then {
			_queue append [_forEachIndex, (time + _delay)];
		} else {
			if ((count (crew _veh)) == 0) then {
				if ((_veh distance _pos) > VR_distanceFromSpawn) then {
					if (({(_veh distance _x) < _dist} count (allPlayers - entities "HeadlessClient_F")) < 1) then {
						_queue append [_forEachIndex, (time + _delay)];
					};
				};
			};
		};
	} forEach(VEHRESPAWN);
};