/*
@filename: feats\supplyDrop\actionCondition.sqf
Credit:
	Quicksilver
Author:
	Ben
Description:
	this script will run on client side,
	supplyDrop action condition
*/

private ["_veh"];

_veh = vehicle player;

( supplyDropAvail && (_veh != player) && (_veh getVariable "supplyDrop") && ((position _veh) select 2 >= SD_minAltitude) )