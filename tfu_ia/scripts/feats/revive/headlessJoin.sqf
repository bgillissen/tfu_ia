
params ["_player"];

if ( MOD_ace ) exitWith {};

if ( player isEqualTo _player ) exitWith {};

if ( _player in (entities "headless_Client_F") ) exitWith {};

_player execFSM ("feats\revive\fsm\main.fsm");