/*
@filename: ia\ao\aoThread.sqf
Author:
	Ben
Description:
	this script is executed on server side,
	it start a main AO on the given marker, and keep track of it status 
*/

param ["_ao"];
private ["_coord", "_units", "_trigger", "_radioTower", "_casThread"];

_coord = getMarkerPos _ao;
//spawn units
_units = [_coord] call AO_fnc_unitSpawn;

//create detection trigger
_trigger = createTrigger ["EmptyDetector", getMarkerPos currentAO];
_trigger setTriggerArea [PARAMS_AOSize, PARAMS_AOSize, 0, false];
_trigger setTriggerActivation ["EAST", "PRESENT", false];
_trigger setTriggerStatements ["this","",""];

//spawn radioTower
_radioTower = [_coord, _trigger] call AO_fnc_rtSpawn;

//move marker
{ _x setMarkerPos _coord; } forEach ["aoCircle", "aoMarker"];

//set marker label
"aoMarker" setMarkerText format["Take %1", _ao];

//start messages
[format[IA_newAOHint, _ao]] remoteExec ["common_fnc_globalHint", 0, false];
["NewMain", _ao] remoteExec ["common_fnc_globalNotification", 0, false];
["NewSub", "Destroy the enemy radio tower."] remoteExec ["common_fnc_globalNotification", 0, false];

if ( PARAMS_AO_cas == 1 ) then {
	//cas spawn thread
	_casThread = spawn { [_coord, _radioTower] call AO_fnc_casThread; };
};
//radioTower loop
waitUntil { 
	sleep IA_checkDelay;
	!alive _radioTower || zeusMission 
};

{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["radioMarker","radioCircle"];
if ( !alive _radioTower ) then {
	//radioTower has been destroyed
	[IA_endRTHint] remoteExec ["common_fnc_globalHint", 0, false];
	["CompletedSub", "Enemy radio tower destroyed."] remoteExec ["common_fnc_globalNotification", 0, false];
};

//units loop
waitUntil {
	sleep IA_checkDelay;
	(count list _trigger < PARAMS_AO_unitThreshold) || zeusMission
};

{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["aoCircle","aoMarker"];
if ( !zeusMission ) then {
	//unit threshold has been reached
	[format[IA_endAOHint, _ao]] remoteExec ["common_fnc_globalHint", 0, false];
	["CompletedMain", _ao] remoteExec ["common_fnc_globalNotification", 0, false];
};
//cleanUp
[_coord, _trigger, _radioTower, _units] spawn AO_fnc_cleanup;
