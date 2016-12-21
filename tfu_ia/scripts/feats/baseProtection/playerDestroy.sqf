/*
@filename: feats\baseProtection\playerDestroy.sqf
Author:
	Ben
Description:
	this run on player
	kill the baseProtection initThread
 */

if ( count(_this) == 0 ) ewitWith {};

params ["_when", "_thread"];

if ( scriptDone _thread ) ewitWith {};

terminate _thread;

waitUntil{ scriptDone _thread };

BP_inBase = false;