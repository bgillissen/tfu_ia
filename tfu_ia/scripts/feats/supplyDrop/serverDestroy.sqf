/*
@filename: feats\supplyDrop\serverDestroy.sqf
Author:
	Ben
Description:
	run on server side
	kill the supply cooldown thread 
*/

if ( count(_this) == 0 ) exitWith{};

if ( !(["supplyDrop"] call core_fnc_getConf) ) exitWith{};

params ["_when", "_thread"];

terminate _thread;
waitUntil{ scriptDone _thread };

SD_avail = false;
publicVariable "SD_avail";

{ deleteVehicle _x; } count Sd_crates;
SD_crates = [];
publicVariable "SD_crates";