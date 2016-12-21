/*
@filename: feats\iaFOB\serverDestroy.sqf
Author:
	Ben
Description:
	run on server side
	tell FOB thread to stop, wait some, kill it 
*/

if ( count(_this) == 0 ) exitWith{};

params ["_when", "_thread"];

if ( !(["FOB"] call core_fnc_getConf) ) ewitWith{};

FOB_stop = true;

private _start = time;

waitUntil {
	((time > (_start + 20)) || scriptDone FOB_main)
};

terminate _thread;

waitUntil{ scriptDone _thread };