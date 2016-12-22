/*
@filename: feats\ia\SIDE\misUrban.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run on server,
	it create a new side mission, 
	a crate to "activate" on a predefined marker in a urban area. 
*/

private _aoCoord = getMarkerPos "aoCircle";
private _coord = [0,0,0];
private _accepted = false;

if ( isNil "URBAN_markers" ) then {
	URBAN_markers = [];
	for "_x" from 1 to MAP_urban do { URBAN_markers append [format["Urban_%1", _x]]; };
};

if ( isNil "URBAN_pool" ) then URBAN_pool = URBAN_markers;
if ( (count URBAN_pool) == 0 ) then URBAN_pool = URBAN_markers;

{
	_coord = getMarkerPos _x;
	if ((_coord distance (getMarkerPos "SZ")) > SIDE_minDistFromBase ) then {
		if ( _coord distance _aoCoord) > SIDE_minDistFromAO ) exitWith {
			URBAN_pool = URBAN_pool - [_x];
		};
	};
} count(URBAN_pool);

//objective crate
private _crate = (selectRandom S_crates) createVehicle _coord;
_crate allowDamage false;
[_crate, SIDE_urbanAction] remoteExec ["SIDE_fnc_addAction", allPlayers - entities "HeadlessClient_F"];

//spawn units ["_coord", "_civ", "_inf", "_sniper", "_garrison", "_static", "_aa", "_tank", "_apc", "_car", "_air", "_patrolSize"];
private _groups = [_coord, 15, 20, 2, 20, 0, 0, 0, 0, 2, 0, (random 200)] call SIDE_fnc_placeEnemies;

//briefing
[_coord, SIDE_urbanTitle, SIDE_size] call SIDE_fnc_placeMarkers;
[format[SIDE_briefing, SIDE_urbanTitle, SIDE_urbanBriefing] remoteExec ["common_fnc_globalHint", 0, false];
["NewSideMission", SIDE_urbanTitle] remoteExec ["common_fnc_globalNotification" ,0 , false];

while ( true ){
	if ( SIDE_success ) exitWith {
		[format[SIDE_urbanPlanted, SIDE_boomDelay]] remoteExec ["common_fnc_globalSideChat", 0, false];
		sleep SIDE_boomDelay;
		[getPos _crate, false] spawn SIDE_fnc_boom.sqf
		deleteVehicle _crate;
		private _reward = call common_fnc_giveReward;
		[format[SIDE_successHint, _reward] remoteExec ["common_fnc_globalHint", 0, false];
		[false, _coord, _groups, []] spawn SIDE_fnc_cleanup;
	};
	if ( SIDE_stop || zeusMission ) exitWith {
		[true, _coord, _groups, []] spawn SIDE_fnc_cleanup;
	};
	sleep IA_checkDelay;
};