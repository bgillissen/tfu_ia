/*
@filename: feats\ia\SIDE\placeMarkers.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it create 2 markers near the given coord
	a circle and a dot with given text
*/
params ["_coord", "_text", "_size"];

private _size = ["ia", "side", "size"] call BIS_fnc_getCfgData;
private _color = ["colorBLUFOR", "colorOPFOR"] select (PLAYER_SIDE isEqualTo west);
private _fuzzyCoord = [(((_coord select 0) - (_size/2)) + (random _size)),
					   (((_coord select 1) - (_size/2)) + (random _size)), 0];
private _circle = ["ia", "side", "circle"] call BIS_fnc_getCfgData;
private _label = ["ia", "side", "label"] call BIS_fnc_getCfgData;

createMarker [_circle, _fuzzyCoord];
_circle setMarkerColor _color;
_circle setMarkerShape "ELLIPSE";
_circle setMarkerSize [_size, _size];
_circle setMarkerBrush "Border";

createMarker [_label, _fuzzyCoord];
_label setMarkerColor _color;
_label setMarkerShape "ICON";
_label setMarkerType "hd_dot";
_label setMarkerText format["Side Mission: %1", _text];