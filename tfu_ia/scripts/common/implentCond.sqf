/*
@filename: common\implentCond.sqf
Author:
	Ben
Description:
	This script is executed on all context (server, headless client, player)
	it help to determine if something got to be implented
*/

param["_conf", "_side", "_modRule", "_mapRule"];
private ["_bool"];

if ( _conf typeName == "BOOL" ) then exitWith{ _conf };

if ( _conf == 0 ) then exitWith{ false };

if ( _conf == 1 ) then exitWith{ true };

if ( PLAYER_SIDE getFriend _side >= 0.6 ) then exitWith{ false };

if ( _modRule select 0 != _modRule select 1 ) then exitWith{ false };

if ( _conf < 3 ) then exitWith{ true }; 

( _mapRule select 0 == (worldName == _mapRule select 1) )