/*
@filename: feats\ia\FOB\serverDestroy.sqf
Author:
	Ben
Description:
	run on server side
	tell FOB thread to stop, wait some, kill it 
*/

if ( count(_this) == 0 ) exitWith{};

params ["_when", "_thread"];

if ( (["FOB"] call core_fnc_getParam) == 0 ) exitWith{};

FOB_stop = true;

if ( !(isNil "FOB_main") ) then {
	private _limit = time + 20;
	waitUntil {
		( (time > _limit) || (scriptDone FOB_main) )
	};
};

terminate _thread;

waitUntil{ scriptDone _thread };