/*
@filename: feats\iaAO\placeMinefield.sqf
Credit:
	Quiksilver (credit Rarek [ahoyworld] for initial build)
Author:
	Ben
Description:
	this run on server,
	it spawn a minefield around the radioTower 
*/

params ["_rtCoord"];
private ["_dist", "_dir"];

AO_minefield = [];

for "_x" from 1 to IA_rtMines do {
	_mine = createMine [[AO_rtMineTypes] call BIS_fnc_selectrandom, _rtCoord, [], 38];
    AO_minefield append [_mine];
};

_dist = 40;
_dir = 180;

for "_c" from 0 to 23 do {
    _pos = [_flatPos, _dist, _dir] call BIS_fnc_relPos;
    _bWire = "Land_Razorwire_F" createVehicle _pos;
    waitUntil {alive _bWire};
    _bWire setDir _dir;
    _bWire enableSimulation false;
	_bWire allowDamage false;
    _dir = _dir + 15;
    AO_minefield append [_bWire];
};