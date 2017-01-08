/*
@filename: feats\ia\AO\serverDestroy.sqf
Author:
	Ben
Description:
	run on server side
	tell main AO to stop, wait some, kill it 
*/

if ( count(_this) == 0 ) exitWith{};

params ["_when", "_thread"];

if ( (["AO"] call core_fnc_getParam) == 0 ) exitWith{};

AO_stop = true;

private _start = time;

waitUntil {
	((time > (_start + 20)) || scriptDone AO_main)
};

terminate _thread;

waitUntil{ scriptDone _thread };