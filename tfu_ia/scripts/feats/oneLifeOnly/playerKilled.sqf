
if ( (["onelifeonly"] call core_fnc_getParam) == 0 ) exitWith {};

params ["_unit", "_killer", "_instigator"];

[] call bis_fnc_respawnspectator;