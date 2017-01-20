/*
@filename: core\FeatEventRemote.sqf
Author:
	Ben
Description:
	this run on all context
	used as front door for feature events triggered remotly
*/

params ["_when", "_param"];

if ( CTXT_SERVER ) exitWith {
	private _allowed = ["respawn", "join", "killed"]; 
	if ( _when in _allowed ) exitWith {
		["SERVER", _when, _param] call core_fnc_featEvent;
	};
};

if ( CTXT_PLAYER ) exitWith {
	private _allowed = ["leave", "join"]; 
	if ( _when in _allowed ) exitWith {
		["PLAYER", _when, _param] call core_fnc_featEvent;
	};
};