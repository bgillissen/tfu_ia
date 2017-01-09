/*
@filename: feats\vonHint\playerDestroy.sqf
Author:
	Ben
Description:
	run on player
	kill the vonHint postInit thread
 */

if ( count(_this) == 0 ) exitWith {};

params ["_when", "_thread"];

if ( scriptDone _thread ) exitWith {};

terminate _thread;

waitUntil{ scriptDone _thread };