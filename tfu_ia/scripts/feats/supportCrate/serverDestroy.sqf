/*
@filename: feats\supplyDrop\serverDestroy.sqf
Author:
	Ben
Description:
	run on server side
	kill the supply cooldown thread 
*/

if ( count(_this) == 0 ) exitWith{};

if ( !(["supportCrate"] call core_fnc_getParam) ) exitWith{};

params ["_when", "_thread"];

terminate _thread;
waitUntil{ scriptDone _thread };

SC_avail = false;
publicVariable "SD_avail";

{ deleteVehicle _x; } count SD_crates;
SC_crates = [];
publicVariable "SC_crates";