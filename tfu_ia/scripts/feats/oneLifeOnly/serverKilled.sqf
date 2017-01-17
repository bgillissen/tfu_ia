
if ( (["onelifeonly"] call core_fnc_getParam) == 0 ) exitWith {};

params ["_eventArgs", "_player"];

DEAD_PLAYERS pushback (getPlayerUID _player);

publicVariable "DEAD_PLAYERS";