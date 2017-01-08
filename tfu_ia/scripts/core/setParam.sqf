/*
@filename: core\setParam.sqf
Author:
	Ben
Description:
	run on server
	add the given parameters to the stack of overwrited parameters 
*/
params ["_param", "_value", "_setBy"];

private _toAdd = [_param, _value, _setBy];

{
	_x params ["_name"];
	if ( _name isEqualTo _param ) exitWith { 
		PARAMETERS set [_forEachIndex, _toAdd]; 
	};
} forEach PARAMETERS;

PARAMETERS pushback _toAdd;