/*
@filename: common\setLoadout.sqf
Author:
	Ben
Description:
	this run on player and server
	set given unit the given loadout
	expect : 
	_unit, [uniform, [inUniform]], [vest, inVest]], [backpack, [inBackpack]], [primWeapon, [primWeaponItems]] [secWeapon, [secWeapItems]], [handWeapon, handWeapItems]], helmet, face, comm, terminal, map, bino, nv, watch
*/

params ["_unit", "_uniform", "_vest", "_backpack", "_pw", "_sw", "_hw", "_helmet", "_face", "_comm", "_term", "_map", "_bino", "_nv", "_watch"];

