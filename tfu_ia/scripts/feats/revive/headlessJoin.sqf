
params ["_player"];

if ( MOD_ace ) exitWith {};

if ( player isEqualTo _player ) exitWith {};

_player execFSM ("feats\revive\fsm\main.fsm");