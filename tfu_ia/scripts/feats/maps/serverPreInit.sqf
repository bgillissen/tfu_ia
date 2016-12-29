/*
@filename: feats\maps\serverPreInit.sqf
Author:
	Ben
Description:
	run on server
	include map definition,
	include active base definition
	define needed globals and make some public 
*/

if ( isNil "MAP_INIT" ) then {
	call compileFinal preprocessFileLineNumbers format["feats\maps\%1.sqf", toUpper(worldName)];
};

private _base = BASES select (format["%1_base", MAP_PREFIX] call core_fnc_getConf);

BASE_COMP = format["%1_%2", MAP_PREFIX, (_base select 0)];
BASE_NAME = _base select 1;
SZ_RADIUS = _base select 2;
FR_RADIUS = _base select 3;

call compileFinal preprocessFileLineNumbers format["feats\maps\%1\%2.sqf", MAP_FOLDER, (_base select 0)];

publicVariable "BASE_NAME";
publicVariable "SZ_RADIUS";
publicVariable "FR_RADIUS";

MAP_INIT = true;