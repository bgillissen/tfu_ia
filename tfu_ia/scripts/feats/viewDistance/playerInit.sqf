/*
@filename: feats\viewDistance\playerInit.sqf
Author: 
	Bryan "Tonic" Boardwine
Description:
	run on client
	just define default value for TAW View Distance.
*/

tawvd_foot = ["viewDistance", "foot"] call BIS_fnc_GetCfgData;;
tawvd_car = ["viewDistance", "car"] call BIS_fnc_GetCfgData;
tawvd_air = ["viewDistance", "air"] call BIS_fnc_GetCfgData;
tawvd_addon_disable = true;