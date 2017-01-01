/*
@filename: feats\supportCrate\condition.sqf
Credit:
	Quicksilver
Author:
	Ben
Description:
	run on player,
	supportCrate action condition
Params:
	none
Environment:
	missionNamespace:
		SC_avail
	player:
		role
Return:
	BOOL, supportCrate action is shown or not
*/

if ( !SC_avail ) exitWith { false };

( (player getVariable "role") isEqualTo "hPilot" )