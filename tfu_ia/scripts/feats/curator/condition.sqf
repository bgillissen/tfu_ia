/*
@filename: feats\curator\condition.sqf
Credit:
	Quicksilver
Author:
	Ben
Description:
	run on player,
	request/release/reload curator action condition
*/

params ["_mustBeAssigned"];

if ( !isCurator ) exitWith { false };

if ( _mustBeAssigned ) exitWith { isAssigned };

!isAssigned