/*
@filename: feats\baseProtection\playerDestroy.sqf
Author:
	Ben
Description:
	this run on player
	kill the baseProtection initThread
 */

params ["_when", "_thread"];

if ( scriptDone _thread ) ewitWith {};

terminate _thread;

waitUntil( scriptDone _thread );

BP_inBase = false;