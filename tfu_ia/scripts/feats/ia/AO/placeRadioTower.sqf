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
	private _pos = [[[_aoCoord, _aoSize],_aoTrigger],["water","out"]] call BIS_fnc_randomPos;
	_rtPos = _pos isFlatEmpty[3, 1, 0.3, 30, 0, false];
};

//spawn the radioTower
private _radioTower = (selectRandom S_radioTower) createVehicle _rtPos;
_radioTower setVectorUp [0,0,1];

//add to zeus
{
	_x addCuratorEditableObjects [[_radioTower], false];
} foreach allCurators;

//pick the right color, and randomize marker position
private _color = ["colorBLUFOR", "colorOPFOR"] select (PLAYER_SIDE isEqualTo west);
private _fuzzyCoord = [((_rtPos select 0) - 300) + (random 600), ((_rtPos select 1) - 300) + (random 600), 0];

createMarker [AO_rtCircle, _fuzzyCoord];
AO_rtCircle setMarkerColor _color;
AO_rtCircle setMarkerShape "ELLIPSE";
AO_rtCircle setMarkerSize [AO_rtSize, AO_rtSize];
AO_rtCircle setMarkerBrush "Border";

createMarker [AO_rtLabel, _fuzzyCoord];
AO_rtLabel setMarkerColor _color;
AO_rtLabel setMarkerShape "ICON";
AO_rtLabel setMarkerType "hd_dot";

//minefield or not ?
AO_minefield = [];
if ( random 100 < (["AO_minedRTProb"] call core_fnc_getConf) ) then {
	[_rtPos] call AO_fnc_placeMinefield;
	AO_rtLabel setMarkerText "Radiotower (Minefield)";
} else {
	AO_rtLabel setMarkerText "Radiotower";
};

_radioTower