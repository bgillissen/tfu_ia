/*
@filename: feats\va\add.sqf
Author:
	ben
Description:
	run on server
	add to the given thing a virtual arsenal
*/

params ["_box"];

private _filtered = ( ["filterArsenal"] call core_fnc_getConf );

["AmmoboxInit", [_box, !_filtered]] call BIS_fnc_arsenal;

if ( _filtered ) then {
	[_box, A_backpacks, true] call BIS_fnc_addVirtualBackpackCargo;
	[_box, A_items, true] call BIS_fnc_addVirtualItemCargo;
	[_box, A_weapons, true] call BIS_fnc_addVirtualWeaponCargo;
	[_box, A_ammo, true] call BIS_fnc_addVirtualMagazineCargo;
};