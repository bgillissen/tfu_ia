/*
@filename: ia\ao\rtSpawn.sqf
Credit:
	Quiksilver
Author:
	Ben
Description:
	this script is executed on server side,
	it spawn the radioTower inside the given ao coordonate 
*/

param ["_aoCoord", "_aoTrigger"];
private ["_pos", "_rtPos", "_radioTower", "_markerPos"];

//find a flat position inside AO
_rtPos = [];
while {(count _rtPos) < 1} do {
	_pos = [[[_aoCoord, PARAMS_AO_size],_aoTrigger],["water","out"]] call BIS_fnc_randomPos;
	_rtPos = _pos isFlatEmpty[3, 1, 0.3, 30, 0, false];
};
//spawn the radioTower
//selectRandom IA_radioTower; 
_radioTower = "Land_TTowerBig_2_F" createVehicle _rtPos;
waitUntil { 
	sleep 0.5; 
	alive _radioTower 
};
_radioTower setVectorUp [0,0,1];
//add to zeus
{
	_x addCuratorEditableObjects [[_radioTower], false];
} foreach allCurators;
//randomize marker position
_markerPos = 
[
	((_rtPos select 0) - 200) + (random 400),
	((_rtPos select 1) - 200) + (random 400),
	0
];
//place marker
{ _x setMarkerPos _markerPos; } forEach ["radioMarker", "radioCircle"];
//minefield or not ?
AO_minefield = ( random 100 < PARAMS_minedRTProb );
if ( AO_minefield ) then {
	[_rtPos] call AO_fnc_rtSpawnMinefield;
	"radioMarker" setMarkerText "Radiotower (Minefield)";
} else {
	"radioMarker" setMarkerText "Radiotower";
};

_radioTower