/*
@filename: initPlayerServer.sqf
Author:
	ben
Description:
	run on server side by game engine when player join
	just add player to zeus
*/

param ["_player"];

{
     _x addCuratorEditableObjects [[_player],true];
} forEach allCurators;