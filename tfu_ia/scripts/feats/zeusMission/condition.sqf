/*
@filename: feats\zeusMission\condition.sqf
Credit:
	Quicksilver
Author:
	Ben
Description:
	run on player,
	start/stop zeusMission action condition
*/

params ["_isStart"];

if ( !isAssigned ) exitWith { false };

if ( _isStart ) exitWith { !zeusMission };

zeusMission