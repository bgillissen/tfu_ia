/*
@filename: feats\vehicleRespawn\serverInitThread.sqf
Author:
	ben
Description:
	this run on server,
	must be spawn, not called,
	loop through all the vehicles we got to monitor and respawn them when needed
	
*/
#include "..\..\core\debug.hpp"

private _dist = ["VehicleRespawn_distance"] call core_fnc_getConf;
private _queue = [];

private _delay = ["vehicleRespawn", "checkDelay"] call BIS_fnc_GetCfgData;
private _distFromSpawn = ["vehicleRespawn", "distanceFromSpawn"] call BIS_fnc_GetCfgData;

#ifdef DEBUG	
	private _debug = format["VehicleRespawn: %1 veh monitored", count(VR)];
	conWhite(_debug);
#endif	

while { true } do {
	
	sleep _delay;

	{	
		_x params ["_veh", "_delay", "_poolName", "_pos", "_dir"];

		private _inqueue = false;
		{
			_x params ["_qid", "_respawnAt"];
			if ( _forEachIndex == _qid) then { _inqueue = true; };
			if ( time > _respawnAt ) then {
#ifdef DEBUG
				private _debug = format["VehicleRespawn: respawning veh %1", _qid];
				conWhite(_debug);
#endif
				private _entry = VR select _qid;
				private _new = [_entry select 0, _entry select 2, _entry select 3, _entry select 4] call vehicleRespawn_fnc_spawn;
				_entry set [0,_new];
				VR set [_qid, _entry];
				_queue = _queue - [_x];
			};
		} count _queue;
		
		if ( !_inqueue ) then {
			if (!alive _veh) then {
#ifdef DEBUG
				private _debug = format["VehicleRespawn: veh %1 has been added to queue (dead)", _forEachIndex];
				conWhite(_debug);
#endif
				_queue append [[_forEachIndex, (time + _delay)]];
			} else {
				if ((count (crew _veh)) == 0) then {
					if ((_veh distance _pos) > _distFromSpawn) then {
						if (({(_veh distance _x) < _dist} count (allPlayers - entities "HeadlessClient_F")) < 1) then {
#ifdef DEBUG
							private _debug = format["VehicleRespawn: veh %1 has been added to queue (alone)", _forEachIndex];
							conWhite(_debug);
#endif
							_queue append [[_forEachIndex, (time + _delay)]];
						};
					};
				};
			};
		};
	} forEach VR;
};
