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

private _doLock = ( (["ia", "lockVeh"] call core_fnc_getSetting) == 1 );

private _groups = [];

for "_x" from 1 to _amount do {
	
	(["aPatrol"] call ia_fnc_randomSide) params ["_side", "_pool", "_key"];
	
	if ( isNil "_side" ) exitWith { [grpNull] };
	
	private _group = createGroup _side;
	
	private _randomPos = [[[_coord, (_size / 2)],[]],["water","out"]] call BIS_fnc_randomPos;
	
	private _veh = (selectRandom _pool) createVehicle [_randomPos select 0, _randomPos select 1, 5000];
	_veh engineOn true;
	if ( _doLock ) then { _veh lock 3; };
	_groups pushback _veh;
	[[_veh], true] call curator_fnc_addEditableServer;
	
	(selectRandom (S_pilot select _key)) createUnit [_randomPos, _group];
	((units _group) select 0) assignAsDriver _veh;
	((units _group) select 0) moveInDriver _veh;
	(selectRandom (S_pilot select _key)) createUnit [_randomPos, _group];		
	((units _group) select 1) assignAsGunner _veh;
	((units _group) select 1) moveInGunner _veh;
	_group setCombatMode "RED";
	_veh flyInHeight _altitude;
	[_group, _coord, _patrolSize] call BIS_fnc_taskPatrol;
	[(units _group), _skill] call common_fnc_setSkill;
	_groups pushback _group;
};

_groups