/*
@filename: feats\supportCrate\condition.sqf
Credit:
	Quicksilver
Author:
	Ben
Description:
	run on player,
	supportCrate action condition
*/

if ( !SC_avail ) exitWith { false };

( ({player isEqualType _x} count PUT_hPilot) > 0 )