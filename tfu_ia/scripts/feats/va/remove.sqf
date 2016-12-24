/*
@filename: feats\va\remove.sqf
Author:
	ben
Description:
	this run on server
	it remove the arsenal from the given thing
*/

params ["_box"];

["AmmoboxExit", [_box]] call BIS_fnc_arsenal;