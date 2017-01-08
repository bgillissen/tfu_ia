/*
@filename: feats\voiceControl\playerDestroy.sqf
Author:
	Ben
Description:
	this run on player
	kill the voiceControl initThread
 */

if ( count(_this) == 0 ) exitWith {};

params ["_when", "_thread"];

if ( scriptDone _thread ) exitWith {};

terminate _thread;

waitUntil{ scriptDone _thread };