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

if ( _isStart ) exitWith {
	(isAssigned && !zeusMission) 
};

(isAssigned && zeusMission)
