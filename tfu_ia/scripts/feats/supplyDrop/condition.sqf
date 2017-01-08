/*
@filename: feats\supplyDrop\condition.sqf
Credit:
	Quicksilver
Author:
	Ben
Description:
	run on player,
	supplyDrop action condition
Params:
	none
Environment:
	missionNamespace:
		SD_avail
	object:
		supplyDrop
	missionConfig:
		supplyDrop >> minAltitude
		mapTracker >> colorEast
Return:
	BOOL, supplyDrop action is shown or not
*/

if ( !SD_avail ) exitWith { false };

private _veh = vehicle player;

if ( _veh isEqualTo player) exitWith { false };

if ( !(driver _veh isEqualTo player) ) exitWith { false };

_isSD = _veh getVariable "supplyDrop";
if ( isNil "_isSD" ) exitWith { false };

if ( (position _veh) distance (getMarkerPos "SZ") <= SZ_RADIUS ) exitWith { false };

true