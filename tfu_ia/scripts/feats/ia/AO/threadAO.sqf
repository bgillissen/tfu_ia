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
private _triggers = [];
{
	private _trigger = createTrigger ["EmptyDetector", _coord];
	_trigger setTriggerArea [_size, _size, 0, false];
	_trigger setTriggerActivation [toUpper (str _x), "PRESENT", false];
	_trigger setTriggerStatements ["this","",""];
	_triggers pushback _trigger;
} foreach ENEMIES;


//spawn radioTower
private _radioTower = [_coord, _size, _triggers] call AO_fnc_placeRadioTower;

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
format[(["ia", "ao", "newHint"] call core_fnc_getSetting), _ao] call global_fnc_hint;
["NewMain", _ao] call global_fnc_notification;
["NewSub", (["ia", "ao", "radioTower", "newNotif"] call core_fnc_getSetting)] call global_fnc_notification;

//spawn cas thread
private _doCAS = [false, true] select (["AO_cas"] call core_fnc_getParam);
if ( _doCAS ) then {
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
	(["ia", "ao", "radioTower", "endHint"] call core_fnc_getSetting) call global_fnc_hint;
	["CompletedSub", (["ia", "ao", "radioTower", "endNotif"] call core_fnc_getSetting)] call global_fnc_notification;
};

private _unitThreshold  = ["AO_unitThreshold"] call core_fnc_getParam;
//units loop
waitUntil {
	sleep _delay;
	private _sum = 0;
	{
		_sum = _sum + (count list _x);
	} forEach _triggers;
	diag_log format["AO unit check: threshold: %1 --- current: %2", _unitThreshold, _sum];
	( (_sum < _unitThreshold) || zeusMission || AO_stop )
};

if ( !zeusMission && !AO_stop ) then {
	//unit threshold has been reached
	format[(["ia", "ao", "endHint"] call core_fnc_getSetting), _ao] call global_fnc_hint;
	["CompletedMain", _ao] call global_fnc_notification;
};
//cleanUp
[_coord, _triggers, _radioTower, _units, (zeusMission || AO_stop)] spawn AO_fnc_cleanup;