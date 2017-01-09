/*
@filename: feats\ia\placeStatic.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it spawn static weapons and a gunner for each inside the given coordonate
*/

params ["_coord", "_size", "_amount", "_skill"];

diag_log format["Placing %1 statics", _amount];

if ( _count <= 0 ) exitWith{[]};

private _groups = [];

for "_x" from 1 to _amount do {
	(["static"] call ia_fnc_randomSide) params ["_side", "_gunPool", "_key"];
	private _randomPos = [_coord, _size, 10, 10] call BIS_fnc_findOverwatch;
	private _veh = (selectRandom _gunPool) createVehicle _randomPos;
	_veh setDir random 360;
	_veh setVectorUp [0,0,1];
	if ( (["ia", "lockVeh"] call core_fnc_getSetting) == 1 ) then { 
		_veh lock 3;
	};
	if (random 100 >= (["ia", "crewStayInProb"] call core_fnc_getSetting) ) then {
		_veh allowCrewInImmobile true;
	};
	[[_veh], false] call curator_fnc_addEditable;
	_groups pushback _veh;
	
	private _group = createGroup _side;
	(selectRandom (S_garrison select _key)) createUnit [_randomPos, _group];
	((units _group) select 0) assignAsGunner _veh;
	((units _group) select 0) moveInGunner _veh;	
	_group setBehaviour "COMBAT";
	_group setCombatMode "RED";
	[(units _group), false] call curator_fnc_addEditable;	
	_groups pushback _group;	
};

_groups