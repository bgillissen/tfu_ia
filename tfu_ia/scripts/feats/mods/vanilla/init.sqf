/*
@filename: feats\mods\vanilla\init.sqf
Author:
	Ben
Description:
	run on server.
	implent vanilla assets
*/

private _c = call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\assetCommon.sqf";
private _o = call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\assetOpfor.sqf";
private _b = call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\assetBlufor.sqf";
private _i = call compileFinal preprocessFileLineNumbers "feats\mods\vanilla\assetInd.sqf";

//------------------------------------------------------------ ARSENAL / CARGO / SUPPLYDROP

//common arsenal
private _backpacks 	= _c select AVC select A__BACKPACKS;
private _items 		= _c select AVC select A__ITEMS;
private _weapons 	= _c select AVC select A__WEAPONS;
private _ammo 		= _c select AVC select A__AMMO;
//common cargo
private _cBackpacks = _c select CVC select C__BACKPACKS;
private _cItems 	= _c select CVC select C__ITEMS;
private _cWeapons 	= _c select CVC select C__WEAPONS;
private _cAmmo 		= _c select CVC select C__AMMO;
//common supplyDrop
private _sdBackpacks = _c select SDVC select SD__BACKPACKS;
private _sdItems 	 = _c select SDVC select SD__ITEMS;
private _sdWeapons 	 = _c select SDVC select SD__WEAPONS;
private _sdAmmo 	 = _c select SDVC select SD__AMMO;
private _sdCrates	 = _c select SDVC select SD__CRATES;
private _sdVehicles  = _c select SDVC select SD__VEHICLES;
//blufor, opfor, ind arsenal/cargo/supplyDrop
{
	_x params ["_k", "_side", "_mod", "_src"];
	private _conf = [format["gear_v%1_backpacks", _k]] call core_fnc_getConf;
	private _aK = missionNamespace getVariable format["AV%1", toUpper(_k)];
	private _cK = missionNamespace getVariable format["CV%1", toUpper(_k)];
	private _sK = missionNamespace getVariable format["SDV%1", toUpper(_k)];
	private _isPresent = missionNamespace getVariable _mod; 
	if ( [_conf, _side, false, [[false, _isPresent]], [[false, "jungle"]]] call mods_fnc_implentCond ) then {
		_backpacks	 append (_src select _aK select A__BACKPACKS); 
		_cBackpacks  append (_src select _cK select C__BACKPACKS);
		_sdBackpacks append (_src select _sK select SD__BACKPACKS);
	};
	_conf = [format["gear_v%1_items", _k]] call core_fnc_getConf;
	if ( [_conf, _side, false, [[false, _isPresent]], [[false, "jungle"]]] call mods_fnc_implentCond ) then { 
		_items 	 append (_src select _aK select A__ITEMS); 
		_cItems  append (_src select _cK select C__ITEMS);
		_sdItems append (_src select _sK select SD__ITEMS);
	};
	_conf = [format["gear_v%1_weapons", _k]] call core_fnc_getConf;
	if ( [_conf, _side, false, [[false, _isPresent]], [[false, "jungle"]]] call mods_fnc_implentCond ) then {
		_weapons 	append (_src select _aK select A__WEAPONS);
		_ammo 		append (_src select _aK select A__AMMO);
		_cWeapons 	append (_src select _cK select C__WEAPONS);
		_cAmmo 		append (_src select _cK select C__AMMO);
		_sdWeapons	append (_src select _sK select SD__WEAPONS);
		_sdAmmo 	append (_src select _sK select SD__AMMO);
	};
	if ( PLAYER_SIDE == _side ) then {
		_sdCrates append (_src select _sK select SD__CRATES);
		
	};
} count [["b", west, "MOD_rhsUSAF", _b],
         ["o", west, "MOD_rhsAFRF", _o],
         ["i", independent, "MOD_rhsGREF", _i]];

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

_conf = ["bv_vo"] call core_fnc_getConf;
private _doOPFOR = [_conf, east, false, [[false, MOD_rhsAFRF]], [[false, "jungle"]]] call mods_fnc_implentCond;
_conf = ["bv_vb"] call core_fnc_getConf;
private _doBLUFOR = [_conf, west, false, [[false, MOD_rhsUSAF]], [[false, "jungle"]]] call mods_fnc_implentCond;
_conf = ["bv_vi"] call core_fnc_getConf;
private _doIND = [_conf, independent, false, [[false, MOD_rhsGREF]], [[false, "jungle"]]] call mods_fnc_implentCond;
{
	[_forEachIndex, ((_c select VVC) select _forEachIndex)] call mods_fnc_implentBaseVehicle;
	if ( _doOPFOR ) then {
		[_forEachIndex, ((_o select VVO) select _forEachIndex)] call mods_fnc_implentBaseVehicle;
	};
	if ( _doBLUFOR ) then {
		[_forEachIndex, ((_b select VVB) select _forEachIndex)] call mods_fnc_implentBaseVehicle;
	};
	if ( _doIND ) then {
		[_forEachIndex, ((_i select VVI) select _forEachIndex)] call mods_fnc_implentBaseVehicle;
	};
	
} forEach ((PV select BV_k) select 1);

if ( _doOPFOR ) then { _sdVehicles append (_o select SDVO select SD__VEHICLES); };
if ( _doBLUFOR ) then { _sdVehicles append (_b select SDVB select SD__VEHICLES); };
if ( _doIND ) then { _sdVehicles append (_i select SDVI select SD__VEHICLES); };
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
_rewards append (_c select RVC); 
_conf = ["Reward_vb"] call core_fnc_getConf;
if ( [_conf, west, false, [[false, MOD_rhsUSAF]], [[false, "jungle"]]] call mods_fnc_implentCond ) then {
	_rewards append (_b select RVB); 
};
_conf = ["Reward_vo"] call core_fnc_getConf;
if ( [_conf, east, false, [[false, MOD_rhsAFRF]], [[false, "jungle"]]] call mods_fnc_implentCond ) then {
	_rewards append (_o select RVO); 
};
_conf = ["Reward_vi"] call core_fnc_getConf;
if ( [_conf, east, false, [[false, MOD_rhsGREF]], [[false, "jungle"]]] call mods_fnc_implentCond ) then {
	_rewards append (_i select RVI); 
};
[_rewards] call mods_fnc_implentReward;
_rewards = nil;

//------------------------------------------------------------ SPAWN

private ["_doBLUFOR", "_doOPFOR", "_doIND"];
if ( OPFOR_ARE_ENEMY ) then {
	_conf = ["spawn_vo"] call core_fnc_getConf;
	_doOPFOR = [_conf, east, true, [[false, MOD_rhsAFRF]], [[false, "jungle"]]] call mods_fnc_implentCond;
} else {
	_doOPFOR = false;
};
if ( BLUFOR_ARE_ENEMY ) then {
	_conf = ["spawn_vb"] call core_fnc_getConf;
	_doBLUFOR = [_conf, west, true, [[false, MOD_rhsUSAF]], [[false, "jungle"]]] call mods_fnc_implentCond;
} else {
	_doBLUFOR = false;
};
if ( IND_ARE_ENEMY ) then {
	_conf = ["spawn_vi"] call core_fnc_getConf;
	_doIND = [_conf, independent, true, [[false, MOD_rhsGREF]], [[false, "jungle"]]] call mods_fnc_implentCond;
} else {
	_doIND = false;
};

{
	if ( _doOPFOR ) then {
		[_forEachIndex, (_o select SVO select _forEachIndex)] call mods_fnc_implentSpawn;
	};
	if ( _doBLUFOR ) then {
		[_forEachIndex, (_b select SVB select _forEachIndex)] call mods_fnc_implentSpawn;
	};
	if ( _doInd ) then {
		[_forEachIndex, (_i select SVI select _forEachIndex)] call mods_fnc_implentSpawn;
	};
} forEach (PV select S_k select 1);



//------------------------------------------------------------ ROLE LOADOUT

_conf = ["rl_vanilla"] call core_fnc_getConf;
if ( PLAYER_SIDE == west ) then {
	_doBLUFOR = [_conf, west, false, [[false, MOD_rhsUSAF]], [[false, "jungle"]]] call mods_fnc_implentCond;
	_doOPFOR = false;
	_doIND = false;
};
if ( PLAYER_SIDE == east ) then {
	_doOPFOR = [_conf, east, false, [[false, MOD_rhsAFRF]], [[false, "jungle"]]] call mods_fnc_implentCond;
	_doBLUFOR = false;
	_doIND = false;
};
if ( PLAYER_SIDE == independent ) then {
	_doIND = [_conf, independent, false, [[false, MOD_rhsGREF]], [[false, "jungle"]]] call mods_fnc_implentCond;
	_doBLUFOR = false;
	_doOPFOR = false;
};

{
	if ( _doOPFOR ) then {
		[_forEachIndex, (_o select RLVO select _forEachIndex)] call mods_fnc_implentRoleLoadout;
	};
	if ( _doBLUFOR ) then {
		[_forEachIndex, (_b select RLVB select _forEachIndex)] call mods_fnc_implentRoleLoadout;
	};
	if ( _doIND ) then {
		[_forEachIndex, (_i select RLVI select _forEachIndex)] call mods_fnc_implentRoleLoadout;
	};
} forEach ((PV select RL_k) select 1);

//------------------------------------------------------------ RESTRICTED GEAR

private _restrictEnemyGear = (["restrictEnemyGear"] call core_fnc_getConf == 1);
private _sides = [[(_o select RGVO), east, "OPFOR"],
                  [(_b select RGVB), west, "BLUFOR"],
                  [(_i select RGVI), independent, "IND"]];
{
	_x params ["_src", "_side", "_sideTXT"];
	private _isEnemy = missionNamespace getVariable format["%1_ARE_ENEMY", _sideTXT];
	if ( !(_restrictEnemyGear && _isEnemy) ) then {
		[(_src select RG__LAUNCHER), 
		 (_src select RG__MG), 
		 (_src select RG__SRIFLE),
		 (_src select RG__MRIFLE), 
		 (_src select RG__SSCOPE), 
		 (_src select RG__MSCOPE), 
		 (_src select RG__OSCOPE), 
		 (_src select RG__BACKPACK)] call mods_fnc_implentRestrictedGear;
	};
} count _sides;

//------------------------------------------------------------ ALLOWED VEHICLE

[(_o select AVVO select AV__HELI), 
 (_o select AVVO select AV__PLANE), 
 (_o select AVVO select AV__TANK)] call mods_fnc_implentAllowedVehicle;
[(_b select AVVB select AV__HELI), 
 (_b select AVVB select AV__PLANE), 
 (_b select AVVB select AV__TANK)] call mods_fnc_implentAllowedVehicle;
[(_i select AVVI select AV__HELI), 
 (_i select AVVI select AV__PLANE), 
 (_i select AVVI select AV__TANK)] call mods_fnc_implentAllowedVehicle;