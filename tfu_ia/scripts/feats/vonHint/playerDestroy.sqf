/*
@filename: feats\vonHint\playerDestroy.sqf
Author:
	Ben
Description:
	this run on player
	kill the vonHint postInitThread
 */

if ( count(_this) == 0 ) ewitWith {};

params ["_when", "_thread"];

if ( scriptDone _thread ) ewitWith {};

terminate _thread;

waitUntil{ scriptDone _thread };