/*
@filename: common\implentCond.sqf
Author:
	Ben
Description:
	run on server
	it help to determine if something got to be implented
*/

params ["_conf", "_side", "_isEnemy", "_modRules", "_mapRules"];

//in these case assetAuto has been used
if ( _conf isEqualType true ) exitWith { _conf };
if ( _conf isEqualType false ) exitWith { _conf };

//server admin want to select himself, let s follow his desire 
if ( _conf isEqualTo 0 ) exitWith { false };
if ( _conf isEqualTo 1 ) exitWith { true };

private _out = true;

//so it s set to automatic, first friendship check
if ( !(PLAYER_SIDE isEqualTo _side) ) then {
	if ( _isEnemy ) then {
		if ( PLAYER_SIDE getFriend _side >= 0.6 ) then { 
			_out = false; 
		};
	} else {
		if ( PLAYER_SIDE getFriend _side < 0.6 ) then { 
			_out = false 
		};
	};
};
if ( !_out ) exitWith { false };

//then mods presence rules
{
	_x params ["_filter", "_modPresence"];
	if ( !(_filter isEqualTo _modPresence) ) exitWith { _out = false; };
} count _modRules;

if ( !_out ) exitWith { false };

//and finally, map keywords
{
	_x params ["_filter", "_keyword"];
	if ( _keyword in MAP_KEYWORDS ) then {
		if ( !_filter ) exitWith { _out = false; };
	} else {
		if ( _filter ) exitWith { _out = false; };
	};
} count _mapRules;

_out