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

if ( !(_veh getVariable "supplyDrop") ) exitWith { false };

if ( (position _veh) select 2 <= (["supplyDrop", "minAltitude"] call BIS_fnc_GetCfgData) ) exitWith { false };

true