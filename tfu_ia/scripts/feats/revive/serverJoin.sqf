
params ["_player"];

if ( MOD_ace  || !isDedicated ) exitWith {};

_player execFSM ("feats\revive\fsm\main.fsm");