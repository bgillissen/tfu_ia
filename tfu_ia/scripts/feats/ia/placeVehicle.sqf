/*
@filename: feats\ia\placeVehicle.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run server side,
	it spawn vehicles with crew inside the given coordonate 
*/

params ["_coord", "_size", "_amount", "_skill", "_patrolSize", "_class", "_commander"];

private _groups = [];

if ( _amount <= 0 ) exitWith{_groups};

for "_x" from 1 to _amount do {
	private _group = createGroup _side;
	private _randomPos = [[[_coord, (_size / 2)],[]],["water","out"]] call BIS_fnc_randomPos;
	private _veh = _class createVehicle _randomPos;
	
	if (random 100 >= (["ia", "crewSrayInProb"] call BIS_fnc_GetCfgData) ) then {
		_veh allowCrewInImmobile true;
	};
	(selectRandom S_crew) createUnit [_randomPos,_group];
	(selectRandom S_crew) createUnit [_randomPos,_group];
	(selectRandom S_crew) createUnit [_randomPos,_group];
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
	[_group, _coord, _patrolSize] call BIS_fnc_taskPatrol;
	if (["ia", "lockVeh"] call BIS_fnc_GetCfgData) then { 
		_veh lock 3; 
	};
	[(units _group), _skill] call common_fnc_setSkill;
	{
		_x addCuratorEditableObjects [[_veh], false];
		_x addCuratorEditableObjects [units _group, false];
	} count allCurators;
	_groups append [_group];
	_groups append [_veh];
};

_groups