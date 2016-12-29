/*
@filename: common\implentCond.sqf
Author:
	Ben
Description:
	run on all context
	it help to determine if something got to be implented
*/

params ["_conf", "_side", "_modRule", "_mapRule"];

if ( _conf isEqualType true ) exitWith { _conf };
if ( _conf isEqualType false ) exitWith { _conf };

if ( _conf isEqualTo 0 ) exitWith { false };
if ( _conf isEqualTo 1 ) exitWith { true };

if ( PLAYER_SIDE getFriend _side >= 0.6 ) exitWith{ false };

if ( (_modRule select 0) isEqualTo (_modRule select 1) ) exitWith{ false };

if ( _conf < 3 ) exitWith{ true }; 

( (_mapRule select 0) isEqualTo (worldName isEqualTo (_mapRule select 1)) )