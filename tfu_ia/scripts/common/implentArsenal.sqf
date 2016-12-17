/*
@filename: common\implentArsenal.sqf
Author:
	Ben
Description:
	This is used to append given gears into the arsenal
*/

param ["_backpacks", "_items", "_weapons", "_ammo"];

if ( !(["filteredArsenal"] call core_fnc_getConf) ) then exitWith{};
	
if (count _backpacks > 0 ) then {
	{
		if ( [_x, "backpack"] call common_fns_isBlacklisted ) then continue;
		A_backpacks append _x;
	} forEach(_backpacks);
}

if (count _items > 0) then {
	{
		if ( [_x, "item"] call common_fns_isBlacklisted ) then continue;
		A_items append _x;
	} forEach(_items);
};

if (count _weapons > 0) then {
	{
		if ( [_x, "weapon"] call common_fns_isBlacklisted ) then continue;
		A_weapons append _x;
	} forEach(_weapons);
};

if (count _ammo > 0) then {
	{
		if ( [_x, "ammo"] call common_fns_isBlacklisted ) then continue;
		A_ammo append _x;
	} forEach(_ammo);
};