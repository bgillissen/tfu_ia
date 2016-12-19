/*
@filename: feats\va\add.sqf
Author:
	ben
Description:
	This script will run on server
	it add to the given thing a virtual arsenal, like this: [this] call va_fnc_add;
*/

params ["_box"];

private _filtered = ( ["filterArsenal"] call core_fnc_getConf );

["AmmoboxInit", [_box, !_filtered]] call BIS_fnc_arsenal;

if ( _filtered ) then {
	[_box, A_backpacks, true] call BIS_fnc_addVirtualBackpackCargo;
	[_box, A_ammo, true] call BIS_fnc_addVirtualMagazineCargo;
	[_box, A_weapons, true] call BIS_fnc_addVirtualWeaponCargo;
	[_box, A_items, true] call BIS_fnc_addVirtualItemCargo;
};