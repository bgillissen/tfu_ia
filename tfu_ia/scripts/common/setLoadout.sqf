/*
@filename: common\setLoadout.sqf
Author:
	Ben
Description:
	this run on player and server
	set given unit the given loadout
	expect : 
	_unit, [uniform, [inUniform]], [vest, inVest]], [backpack, [inBackpack]], [primWeapon, [primWeaponItems]] [secWeapon, [secWeapItems]], [handWeapon, handWeapItems]], helmet, face, comm, terminal, map, bino, nv, watch, compass
*/

params ["_unit", "_uniform", "_vest", "_backpack", "_pw", "_sw", "_hw", "_helmet", "_face", "_comm", "_term", "_map", "_bino", "_nv", "_watch", "_compass"];

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_pw params ["_weapon", "_acc"];
if ( !(_weapon isEqualto "") ) then {
	_unit addWeapon _weapon;
	{ _unit addPrimaryWeaponItem _x; } count _acc;
};

_uniform params ["_container", "_content"];
if ( !(_container isEqualto "") ) then {
	diag_log _container;
	_unit forceAddUniform _container;
	{
		_x params ["_item", "_qty"];
		for "_i" from 1 to _qty do { _unit addItemToUniform _item; };
	} count _content;
};

_vest params ["_container", "_content"];
if ( !(_container isEqualto "") ) then {
	_unit addVest _container;
	{
		_x params ["_item", "_qty"];
		for "_i" from 1 to _qty do { _unit addItemToVest _item; };
	} count _content;
};

_backpack params ["_container", "_content"];
if ( !(_container isEqualto "") ) then {
	_unit addBackpack _container;
	{
		_x params ["_item", "_qty"];
		for "_i" from 1 to _qty do { _unit addItemToBackpack _item; };
	} count _content;
};

_sw params ["_weapon", "_acc"];
if ( !(_weapon isEqualto "") ) then {
	_unit addWeapon _weapon;
	{ _unit addSecondaryWeaponItem _x; } count _acc;
};

_hw params ["_weapon", "_acc"];
if ( !(_weapon isEqualto "") ) then {
	_unit addWeapon _weapon;
	{ _unit addHandgunItem _x; } count _acc;
};

if ( !(_helmet isEqualto "") ) then { _unit addHeadgear _helmet; };

if ( !(_face isEqualto "") ) then { _unit addGoggles  _face; };

if ( !(_comm isEqualto "") ) then { _unit linkItem _comm; };

if ( !(_term isEqualto "") ) then { _unit linkItem _term; };

if ( !(_map isEqualto "") ) then { _unit linkItem _map; };

if ( !(_bino isEqualto "") ) then { _unit addWeapon _bino; };

if ( !(_nv isEqualto "") ) then { _unit linkItem _nv; };

if ( !(_watch isEqualto "") ) then { _unit linkItem _watch; };

if ( !(_compass isEqualto "") ) then { _unit linkItem _compass; };
