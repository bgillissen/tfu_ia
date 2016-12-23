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
params["_coord", "_text", "_size"];

private _color = ["colorBLUFOR", "colorOPFOR"] select (PLAYER_SIDE isEqualTo west);
private _fuzzyCoord = [((_coord select 0) - 300) + (random 600),((_coord select 1) - 300) + (random 600),0];

createMarker [SIDE_circle, _fuzzyCoord];
SIDE_circle setMarkerColor _color;
SIDE_circle setMarkerShape "ELLIPSE";
SIDE_circle setMarkerSize [_size, _size];
SIDE_circle setMarkerBrush "Border";

createMarker [SIDE_label, _fuzzyCoord];
SIDE_label setMarkerColor _color;
SIDE_label setMarkerShape "ICON";
SIDE_label setMarkerType "hd_dot";
SIDE_label setMarkerText format["Side Mission: %1", _text];