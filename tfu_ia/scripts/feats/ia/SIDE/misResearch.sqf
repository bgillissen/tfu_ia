/*
@filename: feats\ia\SIDE\misResearch.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run on server,
	it create a new side mission, 
	a Research bunker with a laptop to "activate" inside. 
*/

private _aoCoord = getMarkerPos AO_circle;
private _szCoord = getMarkerPos "SZ";
private _hqType = "Land_Research_HQ_F";
private _flatPos = [0,0,0];
private _accepted = false;

//find a flat position, near coast
while {!_accepted} do {
	_position = [] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [5, 1, 0.2, (sizeOf _hqType), 0, false];
	while {(count _flatPos) < 2} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [10, 1, 0.2, sizeOf _hqType, 0, false];
	};
	if ((_flatPos distance _szCoord) > SIDE_minDistFromBase ) then {
		if ( _flatPos distance _aoCoord) > SIDE_minDistFromAO ) then _accepted = true;
	};
};
_aoCoord = nil;
_szCoord = nil;
_accepted = nil;

//objective building
private _hq = _hqType createVehicle _flatPos;
waitUntil {alive _hq};
_hq setDir (random 360);
_hq setVectorUp [0,0,1];

(getPos _hq) params["_hqX", "_hqY", "_hqZ"];

//objetive table, laptop
private _table = SIDE_table createVehicle [_hqX, _hqY, (_hqZ+1)];
_table enableSimulation true;
private _laptop = SIDE_laptop createVehicle [_hqX, _hqY, (_hqZ+5)];
[_table, _laptop, [0,0,0.83]] call BIS_fnc_relPosObject;
_laptop enableSimulation true;
[_laptop, SIDE_researchAction] remoteExec ["SIDE_fnc_addAction", allPlayers - entities "HeadlessClient_F"];

//spawn units ["_coord", "_civ", "_inf", "_sniper", "_garrison", "_static", "_aa", "_tank", "_apc", "_car", "_air", "_patrolSize"];
private _groups = [_flatPos, 0, 4, 2, 0, 2, 1, 1, 2, 3, 0, (SIDE_size + (random 150))] call SIDE_fnc_placeEnemies;
_groups append ([_hq, SIDE_garrisonSkill] call IA_fnc_forcedGarrison);
//briefing
[_flatPos, SIDE_researchTitle, SIDE_size] call SIDE_fnc_placeMarkers;
[format[SIDE_briefing, SIDE_researchTitle, SIDE_researchBriefing] remoteExec ["common_fnc_globalHint", 0, false];
["NewSideMission", SIDE_researchTitle] remoteExec ["common_fnc_globalNotification" ,0 , false];

while ( true ){
	if (!alive _hq) exitWith {
		[SIDE_failHint] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_laptop, _table, _hq]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_success ) exitWith {
		[format[SIDE_researchPlanted, SIDE_boomDelay]] remoteExec ["common_fnc_globalSideChat", 0, false];
		sleep SIDE_boomDelay;
		[[_hqX, _hqY, (_hqZ+2)], false] spawn SIDE_fnc_boom.sqf
		deleteVehicle _laptop;
		deleteVehicle _table;
		private _reward = call common_fnc_giveReward;
		[format[SIDE_successHint, _reward] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_hq]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _groups, [_laptop, _table, _hq]] spawn SIDE_fnc_cleanup;
	};
	sleep IA_checkDelay;
};