/*
@filename: feats\supplyDrop\condition.sqf
Credit:
	Quicksilver
Author:
	Ben
Description:
	run on player,
	supplyDrop action condition
*/

if ( !SD_avail ) exitWith { false };
private _veh = vehicle player;
if ( _veh isEqualTo player) ewitWith { false };
if ( !(_veh getVariable "supplyDrop") ) ewitWith { false };
if ( (position _veh) select 2 < SD_minAltitude ) exitWith { false };

true