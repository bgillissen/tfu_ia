/*
@filename: common\isBlacklisted.sqf
Author:
	Ben
Description:
	tell if the given item is blacklist in the given category
*/

param ["_class", "_category"];
private ["_key"];

switch(_category){
	case "backpack": { _key = 0; };
	case "item": { _key = 1; };
	case "weapon": { _key = 2; };
	case "ammo": { _key = 3; };
	case "unit": { _key = 4; };
	case "vehicle": { _key = 5; };
	case "object": { _key = 6; };
	case "group": { _key = 7; };
}

(_item in (BLACKLIST select _key))