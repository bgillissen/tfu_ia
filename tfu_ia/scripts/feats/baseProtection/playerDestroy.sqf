/*
@filename: feats\baseProtection\playerDestroy.sqf
Author:
	Ben
Description:
	this run on player
	kill the baseProtection initThread
 */

if ( count(_this) == 0 ) exitWith {};

params ["_when", "_thread"];

if ( scriptDone _thread ) exitWith {};

terminate _thread;

waitUntil{ scriptDone _thread };

BP_inBase = false;