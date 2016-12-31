/*
@filename: feats\mapTracker\iconType.sqf
Credits: 
	Quiksilver
Author:
	Ben
Description:
	run on client
	return the icon type of the icon to draw.
*/

params ["_veh"];

private _i = _veh getVariable ["icontype", ""];
if (_i == "") then {
	_i = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "icon");
	_veh setVariable ["icontype", _i, true];
};

_i