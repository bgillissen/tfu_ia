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

if ( isNil "PARAMETERS" ) then { PARAMETERS = []; };

private "_value";
{
	_x params ["_name", "_val"];
	if ( _name isEqualTo _conf ) exitWith { _value = _val; };
	
} count PARAMETERS;

if ( isNil "_value" ) exitWith {
	([_conf] call BIS_fnc_getParamValue)
};

_value