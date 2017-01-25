
params ["_player"];

if ( MOD_ace  || !isDedicated ) exitWith {};

if ( _player in (entities "headless_Client_F") ) exitWith {};

_player execFSM ("feats\revive\fsm\main.fsm");