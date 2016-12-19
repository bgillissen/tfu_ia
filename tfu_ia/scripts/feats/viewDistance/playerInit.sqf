/*
@filename: feats\viewDistance\playerInit.sqf
Author: 
	Bryan "Tonic" Boardwine
Description:
	run on client
	Master init for TAW View Distance.
*/

tawvd_foot = VD_foot;
tawvd_car = VD_car;
tawvd_air = VD_air;
tawvd_addon_disable = true;

[] spawn viewDistance_fnc_track;