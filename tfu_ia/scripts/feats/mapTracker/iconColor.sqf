/*
@filename: feats\mapTracker\iconColor.sqf
Credits: 
	Quiksilver
Author:
	Ben
Description:
	run on client
	return the color of the icon to draw.
*/

params ["_unit"];

private _a = 0.7;
if ((group _unit) == (group player)) then {
	_a = 0.9;
};

if (format ["%1", _unit getVariable "BTC_need_revive"] == "1") exitWith { MT_colorNeedRevive };

private _c = MT_colorDft;
if (side _unit == east) then _c = MT_colorEast;
if (side _unit == west) then _c = MT_colorWest;
if (side _unit == independent) then _c = MT_colorInd;
if (side _unit == civilian) then _c = MT_colorCiv;

(_c + _a)