/*
@filename: feats\mods\rhsUSAF\init.sqf
Author:
	Ben
Description:
	Run once by server and players.
	implent RHS USAF assets
*/

private _u = call compileFinal preprocessFileLineNumbers "feats\mods\rhsUSAF\assets.sqf";

//------------------------------------------------------------ ARSENAL / CARGO / SUPPLYDROP

//arsenal
private _backpacks 	= [];
private _items 		= [];
private _weapons 	= [];
private _ammo 		= [];
//cargo
private _cBackpacks = [];
private _cItems 	= [];
private _cWeapons 	= [];
private _cAmmo 		= [];
//supplyDrop
private _sdBackpacks = [];
private _sdItems 	 = [];
private _sdWeapons 	 = [];
private _sdAmmo 	 = [];
private _sdCrates	 = [];
private _sdVehicles  = [];

private _conf = ["gear_usaf_backpacks"] call core_fnc_getConf;
if ( [_conf, west, false, [], []] call mods_fnc_implentCond ) then {
	_backpacks	 append (_u select A_USAF select A__BACKPACKS); 
	_cBackpacks  append (_u select C_USAF select C__BACKPACKS);
	_sdBackpacks append (_u select SD_USAF select SD__BACKPACKS);
};
_conf = ["gear_usaf_items"] call core_fnc_getConf;
if ( [_conf, west, false, [], []] call mods_fnc_implentCond ) then {
	_items	 append (_u select A_USAF select A__ITEMS); 
	_cItems  append (_u select C_USAF select C__ITEMS);
	_sdItems append (_u select SD_USAF select SD__ITEMS);
};
_conf = ["gear_usaf_weapons"] call core_fnc_getConf;
if ( [_conf, west, false, [], []] call mods_fnc_implentCond ) then {
	_weapons  	append (_u select A_USAF select A__WEAPONS);
	_ammo		append (_u select A_USAF select A__AMMO);
	_cWeapons 	append (_u select C_USAF select C__WEAPONS);
	_cAmmo  	append (_u select C_USAF select C__AMMO);
	_sdWeapons	append (_u select SD_USAF select SD__WEAPONS);
	_sdAmmo 	append (_u select SD_USAF select SD__AMMO);
};
if ( PLAYER_SIDE == west ) then {
	_sdCrates 	append (_u select SD_USAF select SD__CRATES);
};
//arsenal Implent
[_backpacks, _items, _weapons, _ammo] call mods_fnc_implentArsenal;
_backpacks = nil;
_items = nil;
_weapons = nil;
_ammo = nil;
//cargo Implent
[_cBackpacks, _cItems, _cWeapons, _cAmmo] call mods_fnc_implentCargo;
_cBackpacks = nil;
_cItems = nil;
_cWeapons = nil;
_cAmmo = nil;

//------------------------------------------------------------ BASE VEHICLE

_conf = ["bv_usaf"] call core_fnc_getConf;
private _do = [_conf, west, false, [], []] call mods_fnc_implentCond;
if ( _do ) then {
	{
		[_forEachIndex, ((_u select V_USAF) select _forEachIndex)] call mods_fnc_implentBaseVehicle;
	} forEach ((PV select BV_k) select 1);
	_sdVehicles append (_u select SD_USAF select SD__VEHICLES);
};
//supplyDrop Implent
[_sdBackpacks, _sdItems, _sdWeapons, _sdAmmo, _sdCrates, _sdVehicles] call mods_fnc_implentSupplyDrop;
_sdBackpacks = nil;
_sdItems = nil;
_sdWeapons = nil;
_sdAmmo = nil;
_sdCrates = nil;
_sdVehicles = nil;

//------------------------------------------------------------ REWARDS

private _rewards = [];
_conf = ["reward_usaf"] call core_fnc_getConf;
if ( [_conf, west, false, [], []] call mods_fnc_implentCond ) then {
	_rewards append (_u select R_USAF); 
};
[_rewards] call mods_fnc_implentReward;
_rewards = nil;
	
//------------------------------------------------------------ SPAWN

if ( BLUFOR_ARE_ENEMY ) then {
	_conf = ["spawn_usaf"] call core_fnc_getConf;
	_do = [_conf, west, true, [], []] call mods_fnc_implentCond;
	if ( _do ) then {
		{
			[_forEachIndex, (_u select S_USAF select _forEachIndex)] call mods_fnc_implentSpawn;
		} forEach (PV select S_k select 1);
	};
};

//------------------------------------------------------------ ROLE LOADOUT

if ( PLAYER_SIDE == west ) then {
	_do = [_conf, west, false, [], []] call mods_fnc_implentCond;
	if ( _do ) then {
		{
			[_forEachIndex, (_u select RL_USAF select _forEachIndex)] call mods_fnc_implentRoleLoadout;
		} forEach ((PV select RL_k) select 1);
	};
};

//------------------------------------------------------------ RESTRICTED GEAR

private _restrictEnemyGear = (["restrictEnemyGear"] call core_fnc_getConf == 1);
if ( !(_restrictEnemyGear && BLUFOR_ARE_ENEMY) ) then {
	[(_u select RG_USAF select RG__LAUNCHER), 
	 (_u select RG_USAF select RG__MG), 
	 (_u select RG_USAF select RG__SRIFLE),
	 (_u select RG_USAF select RG__MRIFLE), 
	 (_u select RG_USAF select RG__SSCOPE), 
	 (_u select RG_USAF select RG__MSCOPE), 
	 (_u select RG_USAF select RG__OSCOPE), 
	 (_u select RG_USAF select RG__BACKPACK)] call mods_fnc_implentRestrictedGear;
};


//------------------------------------------------------------ ALLOWED VEHICLE

[(_u select AV_USAF select AV__HELI), 
 (_u select AV_USAF select AV__PLANE), 
 (_u select AV_USAF select AV__TANK)] call mods_fnc_implentAllowedVehicle;