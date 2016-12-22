/*
@filename: feats\iaSIDE\addAction.sqf
Author:
	Ben
Description:
	this run on client,
	it add the action to activate to finish a side mission on the given object,
	when activated it broadcast SIDE_success to server 
*/

params ["_obj", "_label"];

_obj addAction[_label, {SIDE_success=true;publicVariableServer "SIDE_success"}, [], 6, true, true, {true}, 2, false];