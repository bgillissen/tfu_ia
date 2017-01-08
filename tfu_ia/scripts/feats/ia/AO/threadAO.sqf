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
private _size = ["AO_size"] call core_fnc_getParam;
//spawn units
private _units = [_coord, _size] call AO_fnc_placeEnemies;

//create detection trigger
private _trigger = createTrigger ["EmptyDetector", _coord];
_trigger setTriggerArea [_size, _size, 0, false];
_trigger setTriggerActivation [ENEMY_SIDETXT, "PRESENT", false];
_trigger setTriggerStatements ["this","",""];

//spawn radioTower
private _radioTower = [_coord, _size, _trigger] call AO_fnc_placeRadioTower;

//create markers
private _circle = ["ia", "ao", "circle"] call core_fnc_getSetting;
private _label = ["ia", "ao", "label"] call core_fnc_getSetting;
private _color = ["colorBLUFOR", "colorOPFOR"] select (PLAYER_SIDE isEqualTo west);
createMarker [_circle, _coord];
_circle setMarkerColor _color;
_circle setMarkerShape "ELLIPSE";
_circle setMarkerSize [_size, _size];
_circle setMarkerBrush "Border";
createMarker [_label, _coord];
_label setMarkerColor _color;
_label setMarkerShape "ICON";
_label setMarkerType "hd_dot";
_label setMarkerText format["Take %1", _ao];
_circle = nil;
_label = nil;
_color = nil;

//start messages
[format[(["ia", "ao", "newHint"] call core_fnc_getSetting), _ao]] remoteExec ["common_fnc_globalHint", 0, false];
["NewMain", _ao] remoteExec ["common_fnc_globalNotification", 0, false];
["NewSub", (["ia", "ao", "radioTower", "newNotif"] call core_fnc_getSetting)] remoteExec ["common_fnc_globalNotification", 0, false];

//spawn cas thread
if ( ["AO_cas"] call core_fnc_getParam ) then {
	[_coord, _radioTower] spawn AO_fnc_threadCAS;
};

private _delay = ["ia", "checkDelay"] call core_fnc_getSetting; 

//radioTower loop
waitUntil { 
	sleep _delay;
	(!alive _radioTower || zeusMission || AO_stop)
};

if ( !alive _radioTower ) then {
	//radioTower has been destroyed
	private _circle = ["ia", "ao", "radioTower", "circle"] call core_fnc_getSetting;
	private _label = ["ia", "ao", "radioTower", "label"] call core_fnc_getSetting;
	deleteMarker _circle;
	deleteMarker _label;
	_circle = nil;
	_label = nil;
	[(["ia", "ao", "radioTower", "endHint"] call core_fnc_getSetting)] remoteExec ["common_fnc_globalHint", 0, false];
	["CompletedSub", (["ia", "ao", "radioTower", "endNotif"] call core_fnc_getSetting)] remoteExec ["common_fnc_globalNotification", 0, false];
};

_unitThreshold  = ["AO_unitThreshold"] call core_fnc_getParam;
//units loop
waitUntil {
	sleep _delay;
	((count list _trigger < _unitThreshold) || zeusMission || AO_stop)
};

if ( !zeusMission && !AO_stop ) then {
	//unit threshold has been reached
	[format[(["ia", "ao", "endHint"] call core_fnc_getSetting), _ao]] remoteExec ["common_fnc_globalHint", 0, false];
	["CompletedMain", _ao] remoteExec ["common_fnc_globalNotification", 0, false];
};
//cleanUp
[_coord, _trigger, _radioTower, _units, (zeusMission || AO_stop)] spawn AO_fnc_cleanup;