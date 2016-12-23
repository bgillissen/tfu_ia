/*
@filename: feats\ia\SIDE\misHQCoast.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run on server,
	it create a new side mission, 
	a HQ bunker near coast with a crate to "activate" on top. 
*/

private _aoCoord = getMarkerPos AO_circle;
private _szCoord = getMarkerPos "SZ";
private _flatPos = [0,0,0];
private _accepted = false;

//find a flat position, near coast
while {!_accepted} do {
	private _position = [[[] call BIS_fnc_worldArea],["water","out"]] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty [2,0,0.3,1,1,true];
	while {(count _flatPos) < 2} do {
		_position = [[[] call BIS_fnc_worldArea],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [2,0,0.3,1,1,true];
	};

	if ((_flatPos distance szCoord) > SIDE_minDistFromBase ) then {
		if ( _flatPos distance _aoCoord) > SIDE_minDistFromAO ) then _accepted = true;
	};
};
_aoCoord = nil;
_szCoord = nil;
_accepted = nil;

//objective building
private _hq = "Land_Cargo_HQ_V1_F" createVehicle _flatPos;
waitUntil {alive _hq};
_hq setDir (random 360);
(getPos _hq) params["_hqX", "_hqY", "_hqZ"];
_hq setVectorUp [0,0,1];

//objective crate
private _crate = (selectRandom S_crates) createVehicle [0,0,0];
_crate allowDamage false;
_crate setPos [_hqX, _hqY, (_hqZ + 5)];
[_crate, SIDE_hqCoastAction] remoteExec ["SIDE_fnc_addAction", allPlayers - entities "HeadlessClient_F"];

//ambiance objects
private _coord = [_flatPos, 200, 300, 10, 2, 1, 0] call BIS_fnc_findSafePos;
private _trawler = "C_Boat_Civil_04_F" createVehicle _coord;
_trawler setDir random 360;
_trawler allowDamage false;

_coord = [_flatPos, 15, 25, 10, 0, 1, 0] call BIS_fnc_findSafePos;
private _boat = "O_Boat_Transport_01_F" createVehicle _coord;
_boat setDir random 360;
_boat allowDamage false;
_boat lock 3

//spawn units ["_coord", "_civ", "_inf", "_sniper", "_garrison", "_static", "_aa", "_tank", "_apc", "_car", "_air", "_patrolSize"];
private _groups = [_flatPos, 0, 4, 2, 0, 1, 1, 1, 2, 3, 0, (SIDE_size + (random 150))] call SIDE_fnc_placeEnemies;
_groups append ([_hq, SIDE_garrisonSkill] call IA_fnc_forcedGarrison);
//briefing
[_flatPos, SIDE_hqCoastTitle, SIDE_size] call SIDE_fnc_placeMarkers;
[format[SIDE_briefing, SIDE_hqCoastTitle, SIDE_hqCoastBriefing] remoteExec ["common_fnc_globalHint", 0, false];
["NewSideMission", SIDE_hqCoastTitle] remoteExec ["common_fnc_globalNotification" ,0 , false];

while ( true ){
	if (!alive _hq) exitWith {
		[SIDE_failHint] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_boat, _trawler, _crate, _hq]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_success ) exitWith {
		[format[SIDE_hqCoastPlanted, SIDE_boomDelay]] remoteExec ["common_fnc_globalSideChat", 0, false];
		sleep SIDE_boomDelay;
		[getPos _crate, true] spawn SIDE_fnc_boom.sqf
		deleteVehicle _crate;
		private _reward = call common_fnc_giveReward;
		[format[SIDE_successHint, _reward] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _flatPos, _groups, [_boat, _trawler, _hq]] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _flatPos, _groups, [_boat, _trawler, _crate, _hq]] spawn SIDE_fnc_cleanup;
	};
	sleep IA_checkDelay;
};