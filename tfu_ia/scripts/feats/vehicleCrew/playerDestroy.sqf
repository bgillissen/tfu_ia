/*
@filename: feats\vehicleCrew\playerDestroy.sqf
Author:
	Ben
Description:
	this run on player
	kill the vehicleCrew initThread
 */

if ( count(_this) == 0 ) exitWith {};

if ( !(["vehicleCrew"] call core_fnc_getParam) ) exitWith{};

params ["_when", "_thread"];

if ( scriptDone _thread ) exitWith {};

terminate _thread;

waitUntil{ scriptDone _thread };