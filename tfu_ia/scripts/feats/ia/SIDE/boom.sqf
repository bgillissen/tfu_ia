/*
@filename: feats\iaSIDE\boom.sqf
Author:
	Ben
Description:
	this run on server,
	just spawn a GBU on given coord, plus some secondary if needed. 
*/
params ["_coord", "_secondary"];

private _gbu = "Bo_GBU12_LGB" createVehicle _coord;
_gbu hideObjectGlobal true;

if ( !_secondary ) exitWith {};

sleep 0.1;

for "_i" from 1 to 5 do {
	sleep 1 + (random 3);
	"SmallSecondary" createVehicle ([_coord, random 15, random 360] call BIS_fnc_relPos);
};