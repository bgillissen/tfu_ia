/*
@filename: mods\adr97\init.sqf
Author:
	Ben
Description:
	run on server
	implent ADR-97 assets
*/

(call adr97_fnc_assets) params ["_backpacks", "_items", "_weapons", "_ammo"];

[_backpacks, _items, _weapons, _ammo] call assets_fnc_implentArsenal;