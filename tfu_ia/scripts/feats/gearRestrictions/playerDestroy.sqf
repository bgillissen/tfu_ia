
if ( count(_this) == 0 ) exitWith{};

if ( (["restrictGear"] call core_fnc_getParam) == 0 ) exitWith {};

params ["_when", "_thread"];

terminate _thread;

waitUntil{ scriptDone _thread };