/*
@filename: common\getConf.sqf
Author:
	Ben
Description:
	this script will run on client or server side,
	retrieve a config value either from a defined variable or from mission parameters
*/

param ["_conf"];
private ["_value"];

_value = missionNamespace getVariable _conf;
if ( !isNil _value ) then exitWith{ _value };

_conf call BIS_fnc_getParamValue