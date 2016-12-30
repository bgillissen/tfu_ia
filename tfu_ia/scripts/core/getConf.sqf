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

if ( !isNil "_value" ) exitWith { _value };
/*
diag_log "getConf start";
diag_log _conf;
diag_log (_conf call BIS_fnc_getParamValue);
diag_log "getConf END";
*/
(_conf call BIS_fnc_getParamValue)