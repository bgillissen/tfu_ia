/*
@filename: core\FeatEventRemote.sqf
Author:
	Ben
Description:
	this run on all context
	used as front door for feature events triggered remotly
*/

params ["_when", "_param"];

if ( _when isEqualTo "respawn" && CTXT_SERVER) exitWith {
	["SERVER", _when, _param] call core_fnc_featEvent;
};

if ( _when isEqualTo "join" && CTXT_SERVER) exitWith {
	["SERVER", _when, _param] call core_fnc_featEvent;
};