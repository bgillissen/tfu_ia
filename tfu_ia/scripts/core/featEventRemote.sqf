/*
@filename: core\FeatEventRemote.sqf
Author:
	Ben
Description:
	this run on all context
	used as front door for feature events triggered remotly
*/

params ["_when", "_param"];

//yep this is the only event allowed to do that
if ( _when == "onRespawn" && CTXT_SERVER) exitWith {
	["SERVER", _when, _param] call core_fnc_featEvent;
};