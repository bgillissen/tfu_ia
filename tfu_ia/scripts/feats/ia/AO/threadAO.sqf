/*
@filename: feats\ia\AO\threadAO.sqf
Author:
	Ben
Description:
	this run on server,
	it start a main AO on the given marker, and wait for it to complete 
*/

params ["_ao"];

private _coord = getMarkerPos _ao;
private _size = ["AO_size"] call core_fnc_getConf;
//spawn units
private _units = [_coord, _size] call AO_fnc_placeEnemies;

//create detection trigger
private _trigger = createTrigger ["EmptyDetector", getMarkerPos currentAO];
_trigger setTriggerArea [_size, _size, 0, false];
_trigger setTriggerActivation [ENEMY_SIDETXT, "PRESENT", false];
_trigger setTriggerStatements ["this","",""];

//spawn radioTower
private _radioTower = [_coord, _size, _trigger] call AO_fnc_placeRadioTower;

//create markers
private _color = ["colorBLUFOR", "colorOPFOR"] select (PLAYER_SIDE isEqualTo west);
createMarker [AO_circle, _coord];
AO_circle setMarkerColor _color;
AO_circle setMarkerShape "ELLIPSE";
AO_circle setMarkerSize [_size, _size];
AO_circle setMarkerBrush "Border";
createMarker [AO_label, _coord];
AO_label setMarkerColor _color;
AO_label setMarkerShape "ICON";
AO_label setMarkerType "hd_dot";
AO_label setMarkerText format["Take %1", _ao];

//start messages
[format[IA_newAOHint, _ao]] remoteExec ["common_fnc_globalHint", 0, false];
["NewMain", _ao] remoteExec ["common_fnc_globalNotification", 0, false];
["NewSub", "Destroy the enemy radio tower."] remoteExec ["common_fnc_globalNotification", 0, false];

//cas spawn thread
_doCAS = ["AO_cas"] call core_fnc_getConf;
if ( _doCAS ) then _casThread = spawn { [_coord, _radioTower] call AO_fnc_threadCAS; };

//radioTower loop
waitUntil { 
	sleep IA_checkDelay;
	(!alive _radioTower || zeusMission || AO_stop)
};

if ( !alive _radioTower ) then {
	//radioTower has been destroyed
	deleteMarker AO_rtLabel;
	deleteMarker AO_rtCircle;
	[IA_endRTHint] remoteExec ["common_fnc_globalHint", 0, false];
	["CompletedSub", "Enemy radio tower destroyed."] remoteExec ["common_fnc_globalNotification", 0, false];
};

_unitThreshold  = ["AO_unitThreshold"] call core_fnc_getConf;
//units loop
waitUntil {
	sleep IA_checkDelay;
	((count list _trigger < _unitThreshold) || zeusMission || AO_stop)
};

if ( !zeusMission && !AO_stop ) then {
	//unit threshold has been reached
	[format[IA_endAOHint, _ao]] remoteExec ["common_fnc_globalHint", 0, false];
	["CompletedMain", _ao] remoteExec ["common_fnc_globalNotification", 0, false];
};
//cleanUp
[_coord, _trigger, _radioTower, _units, (zeusMission || AO_stop)] spawn AO_fnc_cleanup;