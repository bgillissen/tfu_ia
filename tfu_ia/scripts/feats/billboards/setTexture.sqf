/*
@filename: feats\billboards\setTexture.sqf
Author:
	Ben
Description:
	called on player side.
	It changes the texture displayed on the billboards.
*/

params ["_obj", "_texture"];

private _path = ["billboards", "path"] call core_fnc_getSetting;

_obj setObjectTexture [0, format[_path, _texture]];