/*
@filename: feats\voiceControl\playerDestroy.sqf
Author:
	Ben
Description:
	this run on player
	kill the voiceControl initThread
 */

if ( count(_this) == 0 ) ewitWith {};

params ["_when", "_thread"];

if ( scriptDone _thread ) ewitWith {};

terminate _thread;

waitUntil{ scriptDone _thread };