/*
@filename: feats\iaSIDE\addAction.sqf
Author:
	Ben
Description:
	this run on client,
	it add the action to activate to finish a side mission on the given object,
	when activated it set broadcast SIDE_SUCCESS to server 
*/

params ["_obj", "_msg"];

_obj addAction[_msg, {SIDE_SUCCESS=true;publicVariableServer "SIDE_SUCCESS"}, [], 6, true, true, {true}, 2, false];