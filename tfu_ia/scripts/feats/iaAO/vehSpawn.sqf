
param ["_side", "_aoCoord", "_vehType", "_patrolSize", "_commander", "_skill"];
private ["_group", "_randomPos", "_veh", "_units"];

_units = [];
_group = createGroup _side;
_randomPos = [[[_aoCoord, (PARAMS_AO_size / 2)],[]],["water","out"]] call BIS_fnc_randomPos;
_veh = _vehType createVehicle _randomPos;
waitUntil{
	sleep 0.1;
	!isNull _veh
};

if (random 100 >= IA_crewStayInProb) then _veh allowCrewInImmobile true;

(selectRandom IA_crew) createUnit [_randomPos,_group];
(selectRandom IA_crew) createUnit [_randomPos,_group];
(selectRandom IA_crew) createUnit [_randomPos,_group];
((units _group) select 0) assignAsDriver _veh;
((units _group) select 0) moveInDriver _veh;
((units _group) select 1) assignAsGunner _veh;
((units _group) select 1) moveInGunner _veh;
if ( _commander ) then {
	((units _group) select 2) assignAsCommander _veh;
	((units _group) select 2) moveInCommander _veh;
} else {
	((units _group) select 2) assignAsCargo _veh;
	((units _group) select 2) moveInCargo _veh;
};
[_group, _aoCoord, 500] call BIS_fnc_taskPatrol;

if (IA_lockVeh) _veh lock 3;

[(units _group), _skill] call common_fnc_setSkill;

{
	_x addCuratorEditableObjects [[_veh], false];
	_x addCuratorEditableObjects [units _group, false];
} foreach allCurators;

_units append _group;
_units append _veh;

_units