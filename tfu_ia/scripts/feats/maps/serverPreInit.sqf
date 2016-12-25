/*
@filename: feats\maps\serverPreInit.sqf
Author:
	Ben
Description:
	this run on server
	include map definition,
	include active base definition
	define needed globals and make some public 
*/

preprocessFileLineNumbers format["feats/maps/%1.hpp", toUpper(worldName)];

private _base = BASES select ([format["%1_base", MAP_PREFIX]] call core_fnc_getConf);

BASE_NAME = _base select 1;
BASE_COMP = format["%1_%2", MAP_PREFIX, (_base select 0)];
SZ_RADIUS = _base select 2:
FR_RADIUS = _base select 3;

preprocessFileLineNumbers format["feats\maps\%1\%2.hpp", MAP_FOLDER, (_base select 0)];

BV = missionNamespace getVariable format["%1_BV_%2", MAP_PREFIX, (_base select 0)];
BA = missionNamespace getVariable format["%1_BA_%2", MAP_PREFIX, (_base select 0)];
BC = format["feats\maps\%1\%2.sqe", MAP_FOLDER, (_base select 0)];

publicVariableClient "BASE_NAME";
publicVariableClient "SZ_RADIUS";
publicVariableClient "FR_RADIUS";