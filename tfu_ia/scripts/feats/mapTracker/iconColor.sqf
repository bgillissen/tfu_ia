/*
@filename: feats\mapTracker\iconColor.sqf
Credits: 
	Quiksilver
Author:
	Ben
Description:
	run on client
	return the color of the icon to draw.
Params:
	OBJECT,	a unit
Environment:
	object:
		BTC_need_revive
	missionConfig:
		mapTracker >> colorNeedRevive
		mapTracker >> colorEast
		mapTracker >> colorWest
		mapTracker >> colorInd
		mapTracker >> colorCiv
		mapTracker >> colorDft
Return:
	ARRAY of SCALAR, color RGB + Alpha
*/

params ["_unit"];

private _a = 0.7;
if ((group _unit) == (group player)) then {
	_a = 0.9;
};

if (format ["%1", _unit getVariable "BTC_need_revive"] == "1") exitWith { 
	(["mapTracker", "colorNeedRevive"] call core_fnc_getSetting) 
};
if ( _unit getVariable "agony" ) exitWith {
	(["mapTracker", "colorNeedRevive"] call core_fnc_getSetting)
};


private _c = (side _unit) call {
	if ( _this == east) exitWith { (["mapTracker", "colorEast"] call core_fnc_getSetting) };
	if ( _this == west) exitWith { (["mapTracker", "colorWest"] call core_fnc_getSetting) };
	if ( _this == independent) exitWith { (["mapTracker", "colorInd"] call core_fnc_getSetting) };
	if ( _this == civilian) exitWith { (["mapTracker", "colorCiv"] call core_fnc_getSetting) };
	(["mapTracker", "colorDft"] call core_fnc_getSetting)
};

(_c + [_a])