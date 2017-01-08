/*
@filename: core\getSettings.sqf
Author:
	Ben
Description:
	run on all context
	retrieve a feature setting from missionConfigFile
*/

private _path = ["settings"];

_path append _this;

_path call BIS_fnc_getCfgData;