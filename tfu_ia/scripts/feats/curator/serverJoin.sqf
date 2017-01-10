/*
@filename: feats\curator\serverOnJoin.sqf
Author:
	Ben
Description:
	this script is run on server side when a player join
	to make player a zeus editable object
*/

params ["_player"];

[[_player], true] call curator_fnc_addEditable;