/*
@filename: feats\ia\AO\placeMinefield.sqf
Credit:
	Quiksilver (credit Rarek [ahoyworld] for initial build)
Author:
	Ben
Description:
	this run on server,
	it spawn a minefield around the radioTower 
*/

params ["_rtCoord"];

AO_minefield = [];

private _mines = ["ia", "ao", "radioTower", "mineTypes"] call BIS_fnc_GetCfgData;
private _amount = ["ia", "ao", "radioTower", "mines"] call BIS_fnc_GetCfgData;
for "_x" from 1 to _amount do {
	private _mine = createMine [(selectRandom _mines), _rtCoord, [], 38];
    AO_minefield append [_mine];
};
_mines = nil;
_amount = nil;

private _dist = 40;
private _dir = 180;

for "_c" from 0 to 23 do {
    private _bWire = "Land_Razorwire_F" createVehicle ([_flatPos, _dist, _dir] call BIS_fnc_relPos);
    _bWire setDir _dir;
    _bWire enableSimulation false;
	_bWire allowDamage false;
    _dir = _dir + 15;
    AO_minefield append [_bWire];
};