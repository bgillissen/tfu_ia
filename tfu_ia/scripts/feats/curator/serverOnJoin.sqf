/*
@filename: feats\curator\serverOnJoin.sqf
Author:
	Ben
Description:
	this script is run on server side when a player join
	to make player a zeus editable object
*/

param ["_player"];

{
	_x addCuratorEditableObjects [[_player], true];
} forEach allCurators;