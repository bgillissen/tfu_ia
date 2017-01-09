/*
@filename: common\isBlacklisted.sqf
Author:
	Ben
Description:
	tell if the given thing is blacklisted in the given category
*/

params ["_item", "_cat"];

private _key = _cat call {
	if ( _this isEqualTo 'backpack' ) exitWith { 0 };
	if ( _this isEqualTo 'item' ) exitWith { 1 };
	if ( _this isEqualTo 'weapon' ) exitWith { 2 };
	if ( _this isEqualTo 'ammo' ) exitWith { 3 };
	if ( _this isEqualTo 'unit' ) exitWith { 4 };
	if ( _this isEqualTo 'vehicle' ) exitWith { 5 };
	if ( _this isEqualTo 'group' ) exitWith { 6 };
	if ( _this isEqualTo 'object' ) exitWith { 7 };
	nil
};

if ( !isNil "_key" ) exitWith { (_item in (BLACKLIST select _key)) };

false