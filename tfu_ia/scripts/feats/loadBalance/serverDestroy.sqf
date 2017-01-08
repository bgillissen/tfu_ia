/*
@filename: feats\baseProtection\serverDestroy.sqf
Author:
	Ben
Description:
	this run on server
	kill the loadBalance thread
 */

if ( count(_this) == 0 ) exitWith {};

params ["_when", "_thread"];

if ( scriptDone _thread ) exitWith {};

terminate _thread;

waitUntil{ scriptDone _thread };