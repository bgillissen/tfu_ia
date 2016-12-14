/*
@filename: feats\va\add.sqf
Author:
	ben
Description:
	This script will run on all context (object init)
	must be called by the object init that you want to add a virtual arsenal to, like this:
		[this] call va_fnc_add;
*/

param ["_box"];
private ["_filtered"];

if (!isServer) exitWith {};

_filtered = ( PARAMS_filterArsernal == 1 );

["AmmoboxInit", [_box, !_filtered]] call BIS_fnc_arsenal;

if ( _filtered ) then {
	[_box, VA_backpacks, true] call BIS_fnc_addVirtualBackpackCargo;
	[_box, VA_ammo, true] call BIS_fnc_addVirtualMagazineCargo;
	[_box, VA_weapons, true] call BIS_fnc_addVirtualWeaponCargo;
	[_box, VA_items, true] call BIS_fnc_addVirtualItemCargo;
};