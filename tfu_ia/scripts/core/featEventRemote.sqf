/*
@filename: core\FeatEventRemote.sqf
Author:
	Ben
Description:
	this run on all context
	used as front door for feature events triggered remotly
*/

params ["_when", "_param"];

private _allowed = ["respawn", "join", "killed"]; 

if ( (_when in _allowed) && CTXT_SERVER) exitWith {
	["SERVER", _when, _param] call core_fnc_featEvent;
};