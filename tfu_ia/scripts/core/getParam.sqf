/*
@filename: core\getParam.sqf
Author:
	Ben
Description:
	run on all context
	retrieve a mission parameter value either from missionConfigFile if it has not been overwrited,
	or from a stack of overwrited parameters
*/

params ["_conf"];

{
	_x params ["_name", "_value"];
	if ( _name isEqualTo _conf ) exitWith { _value };
	
} count PARAMETERS;

([_conf] call BIS_fnc_getParamValue)