/*
@filename: feats\ia\placeAirPatrol.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run server side,
	it spawn a helicopter with crew inside the given coordonate 
*/

params ["_coord", "_size", "_amount", "_skill", "_patrolSize", "_altitude"];

if ( _amount <= 0 ) exitWith {[]};

private _doLock = true; //( (["ia", "lockVeh"] call BIS_fnc_GetCfgData) == 1 );

private _groups = [];

for "_x" from 1 to _amount do {
	
	(["aPatrol"] call ia_fnc_randomSide) params ["_side", "_pool", "_enemyKey"];
	
	if ( isNil "_side" ) exitWith { [grpNull] };
	
	private _group = createGroup _side;
	
	private _randomPos = [[[_coord, (_size / 2)],[]],["water","out"]] call BIS_fnc_randomPos;
	
	private _veh = (selectRandom _pool) createVehicle [_randomPos select 0, _randomPos select 1, 10000];
	_veh engineOn true;
	if ( _doLock ) then { _veh lock 3; };
	
	(selectRandom (S_pilot select _enemyKey)) createUnit [_randomPos, _group];
	((units _group) select 0) assignAsDriver _veh;
	((units _group) select 0) moveInDriver _veh;
		
	(selectRandom (S_pilot select _enemyKey)) createUnit [_randomPos, _group];		
	((units _group) select 1) assignAsGunner _veh;
	((units _group) select 1) moveInGunner _veh;
	
	_group setCombatMode "RED";
	_veh flyInHeight _altitude;
	
	[_group, _coord, _patrolSize] call BIS_fnc_taskPatrol;
	
	[(units _group), _skill] call common_fnc_setSkill;
	
	[[_veh], true] call curator_fnc_addEditableServer;
	
	_groups append [_group];
	_groups append [_veh];
	
	[_veh, _randomPos select 0, _randomPos select 1, _altitude] spawn {
		params ["_veh", "_x", "_y", "_z"];
		sleep 20;
		_veh setPos [_x, _y, _z];
	};
};

_groups