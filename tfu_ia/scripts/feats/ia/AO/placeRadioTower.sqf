/*
@filename: feats\ia\AO\placeRadioTower.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this run on server,
	it spawn the radioTower inside the given coordonate 
*/

params ["_aoCoord", "_aoSize", "_aoTrigger"];

//find a flat position inside AO
private _rtPos = [];
while {(count _rtPos) < 1} do {
	private _pos = [[[_aoCoord, _aoSize], _aoTrigger], ["water","out"]] call BIS_fnc_randomPos;
	_rtPos = _pos isFlatEmpty[3, 1, 0.3, 30, 0, false];
};

//spawn the radioTower
private _radioTower = (selectRandom S_radioTower) createVehicle _rtPos;
_radioTower setVectorUp [0,0,1];

//add to zeus
{
	_x addCuratorEditableObjects [[_radioTower], false];
} foreach allCurators;

//randomize marker position, pick the right color, then create them
private _fuzzyCoord = [((_rtPos select 0) - 300) + (random 600), ((_rtPos select 1) - 300) + (random 600), 0];
private _color = ["colorBLUFOR", "colorOPFOR"] select (PLAYER_SIDE isEqualTo west);
private _circle = ["ia", "ao", "radioTower", "circle"] call core_fnc_getSetting;
private _label = ["ia", "ao", "radioTower", "label"] call core_fnc_getSetting;
private _size =  ["ia", "ao", "radioTower", "size"] call core_fnc_getSetting;
createMarker [_circle, _fuzzyCoord];
_circle setMarkerColor _color;
_circle setMarkerShape "ELLIPSE";
_circle setMarkerSize [_size, _size];
_circle setMarkerBrush "Border";
_circle = nil;
_size = nil;
createMarker [_label, _fuzzyCoord];
_label setMarkerColor _color;
_label setMarkerShape "ICON";
_label setMarkerType "hd_dot";
_color = nil;
_fuzzyCoord = nil;

//minefield or not ?
if ( random 100 < (["AO_minedRTProb"] call core_fnc_getParam) ) then {
	[_rtPos] call AO_fnc_placeMinefield;
	_label setMarkerText "Radiotower (Minefield)";
} else {
	AO_minefield = [];
	_label setMarkerText "Radiotower";
};

_radioTower