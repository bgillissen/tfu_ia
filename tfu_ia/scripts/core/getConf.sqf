/*
@filename: common\getConf.sqf
Author:
	Ben
Description:
	run on all context
	retrieve a config value either from a defined variable or from mission parameters
*/

params ["_conf"];

private _value = missionNamespace getVariable _conf;
if ( !isNil "_value" ) then exitWith{ _value };

_conf call BIS_fnc_getParamValue