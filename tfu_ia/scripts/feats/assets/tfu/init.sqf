/*
@filename: mods\tfu\init.sqf
Author:
	Ben
Description:
	run on server
	implent TFU assets
*/

private _c = call tfu_fnc_assets;

(_c select A_TFU) params ["_backpacks", "_items", "_weapons", "_ammo"];

[_backpacks, _items, _weapons, _ammo] call assets_fnc_implentArsenal;

{
	private _rlK = missionNamespace getVariable format["RL_%1", toUpper(_k)];
	["player", _forEachIndex, (_c select RL_TFU select _forEachIndex)] call assets_fnc_implentRoleLoadout;
} forEach ((PV select RL_k) select 1);