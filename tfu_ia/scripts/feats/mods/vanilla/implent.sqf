/*
@filename: mods\vanilla\implent.sqf
Author:
	Ben
Description:
	run on server.
	implent vanilla assets
*/

private _backpacks = AV_backpacks;
private _items = AV_items;
private _weapons = AV_weapons;
private _ammo = AV_ammo;

private _cBackpacks = CV_backpacks;
private _cItems = CV_items;
private _cWeapons = CV_weapons;
private _cAmmo = CV_ammo;

private _sdBackpacks = SDV_backpacks;
private _sdItems = SDV_items;
private _sdWeapons = SDV_weapons;
private _sdAmmo = SDV_ammo;

private _conf = ["gear_vb_backpacks"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_backpacks append AVB_backpacks; 
	_cBackpacks append CVB_backpacks;
	_sdBackpacks append SDVB_backpacks;
};
_conf = ["gear_vb_items"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_items append AVB_items;
	_cItems append CVB_items; 
	_sdItems append SDVB_items;
};
_conf = ["gear_vb_weapons"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_weapons append AVB_weapons;
	_ammo append AVB_ammo;
	_cWeapons append CVB_weapons;
	_cAmmo append CVB_ammo;
	_sdWeapons append SDVB_weapons;
	_sdAmmo append SDVB_ammo;
};

_conf = ["gear_vo_backpacks"] call core_fnc_getConf;
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_backpacks append AVO_backpacks; 
	_cBackpacks append CVO_backpacks;
	_sdBackpacks append SDVO_backpacks;
};
_conf = ["gear_vo_items"] call core_fnc_getConf;
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then { 
	_items append AVO_items; 
	_cItems append CVO_items;
	_sdItems append SDVO_items;
};
_conf = ["gear_vo_weapons"] call core_fnc_getConf;
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
	_weapons append AVO_weapons;
	_ammo append AVO_ammo;
	_cWeapons append CVO_weapons;
	_cAmmo append CVO_ammo;
	_sdWeapons append SDVO_weapons;
	_sdAmmo append SDVO_ammo;
};

[_backpacks, _items, _weapons, _ammo] call common_fnc_implentArsenal;
_backpacks = nil;
_items = nil;
_weapons = nil;
_ammo = nil;

[_cBackpacks, _cItems, _cWeapons, _cAmmo] call common_fnc_implentCargo;
_cBackpacks = nil;
_cItems = nil;
_cWeapons = nil;
_cAmmo = nil;

[_sdBackpacks, _sdItems, _sdWeapons, _sdAmmo, SDV_crates] call implentSupplyDrop;
_sdBackpacks = nil;
_sdItems = nil;
_sdWeapons = nil;
_sdAmmo = nil;

private _rewards = [];
_conf = ["Reward_vb"] call core_fnc_getConf;
if ( [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
	_rewards append RVB; 
};
_conf = ["Reward_vo"] call core_fnc_getConf;
if ( [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond ) then {
	_rewards append RVO; 
};

[_rewards] call common_fnc_implentReward;
_rewards = nil;


_conf = ["Spawn_vanilla"] call core_fnc_getConf;
private ["_doBLUFOR", "_doOPFOR"];
if ( PLAYER_SIDE == west ) then {
	_doBLUFOR = [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond;
	_doOPFOR = false;
} else {
	_doOPFOR = [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond;
	_doBLUFOR = false;
};
{
	if ( _doOPFOR ) then {
		private _vname = format["SVO_%1", _x];
		[_forEachIndex, (missionNameSpace getVariable _vname)] call implentSpawn;
	};
	if ( _doBLUFOR ) then {
		private _vname = format["SVB_%1", _x];
		[_forEachIndex,(_missionNameSpace getVariable _vname)] call implentSpawn;
	};
} forEach ((PV select RL) select 1);


_conf = ["BaseVehicle_vanilla"] call core_fnc_getConf;
private ["_doBLUFOR", "_doOPFOR"];
_doBLUFOR = [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond;
_doOPFOR = [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond;
{
	if ( _doOPFOR ) then {
		private _vname = format["VVO_%1", _x];
		[_forEachIndex, (missionNameSpace getVariable _vname)] call implentBaseVehicle;
	};
	if ( _doBLUFOR ) then {
		private _vname = format["VVB_%1", _x];
		[_forEachIndex, (_missionNameSpace getVariable _vname)] call implentBaseVehicle;
	};
} forEach ((PV select BV) select 1);


_conf = ["RoleLoadout_vanilla"] call core_fnc_getConf;
private ["_doBLUFOR", "_doOPFOR"];
if ( PLAYER_SIDE == west ) then {
	_doBLUFOR = [_conf, west, [false, MOD_rhsUSAF], [false, "Tanoa"]] call common_fnc_implentCond;
	_doOPFOR = false;
} else {
	_doOPFOR = [_conf, east, [false, MOD_rhsAFRF], [false, "Tanoa"]] call common_fnc_implentCond;
	_doBLUFOR = false;
};
{
	if ( _doOPFOR ) then {
		private _vname = format["RLVO_%1", _x];
		[_forEachIndex, (missionNameSpace getVariable _vname)] call implentRoleLoadout;
	};
	if ( _doBLUFOR ) then {
		private _vname = format["RLVB_%1", _x];
		[_forEachIndex,(_missionNameSpace getVariable _vname)] call implentRoleLoadout;
	};
} forEach ((PV select RL) select 1);


[RGV_launcher, RGV_mg, RGV_sRifle, RGV_mRifle, RGV_sScope, RGV_mScope, RGV_oScope, RGV_backpack] call implentRestrictedGear;


[AVV_heli, AVV_plane, AVV_tank] call implentAllowedVehicle;