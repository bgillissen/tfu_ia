/*
@filename: common\isBlacklisted.sqf
Author:
	Ben
Description:
	tell if the given thing is blacklisted in the given category
*/

params ["_item", "_cat"];
private ["_key", "_out"];

if ( _cat == 'backpack' ) then { _key = 0; };
if ( _cat == 'item' ) then { _key = 1; };
if ( _cat == 'weapon' ) then { _key = 2; };
if ( _cat == 'ammo' ) then { _key = 3; };
if ( _cat == 'unit' ) then { _key = 4; };
if ( _cat == 'vehicle' ) then { _key = 5; };
if ( _cat == 'group' ) then { _key = 6; };
if ( _cat == 'object' ) then { _key = 7; };

if ( !isNil "_key" ) exitWith { (_item in (BLACKLIST select _key)) };

false